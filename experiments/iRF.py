from sklearn.base import BaseEstimator, ClassifierMixin
from irf import irf_utils
from irf.ensemble.wrf import RandomForestClassifierWithWeights

class iRFClassifier(BaseEstimator, ClassifierMixin):
    params = {}
    def __init__(self, **params):
        self.params = params

    def _create_rf(self):
        return RandomForestClassifierWithWeights(
            bootstrap=False,
            max_depth=60,
            max_features='log2',
            min_samples_leaf=2,
            n_estimators=600,
            random_state=42,
        )

    def fit(self, X, y, **params):
        # print(dict(**params))
        # exit()
        rf = self._create_rf()
        K = self.params['K']
        split_index = round(len(X)*0.8)
        # print(self.params)
        # print("1")
        all_rf_weights, all_K_iter_rf_data, \
            all_rf_bootstrap_output, all_rit_bootstrap_output, \
            stability_score = irf_utils.run_iRF(
                rf=rf,
                X_train=X[:split_index],
                X_test=X[split_index:],
                y_train=y[:split_index],
                y_test=y[split_index:],
                K=K,
                random_state_classifier=self.params['random_state_classifier'],
                B=self.params['B'],
                propn_n_samples=self.params['propn_n_samples'],
                bin_class_type=self.params['bin_class_type'],
                M=self.params['M'],
                max_depth=self.params['max_depth'],
                noisy_split=self.params['noisy_split'],
                num_splits=self.params['num_splits'],
                signed=self.params['signed'],
                n_estimators_bootstrap=self.params['n_estimators_bootstrap'],
            )
        # print("2")

        final_weights = all_rf_weights[f'rf_weight{K}']
        self.rf_final = self._create_rf()
        self.rf_final.fit(X, y, feature_weight=final_weights)
        # print("3")
        return self

    def predict(self, X):
        y_pred = self.rf_final.predict(X)
        return y_pred

    def get_params(self, deep=True):
        return self.params

    def set_params(self, **parameters):
        for parameter, value in parameters.items():
            self.params[parameter] = value
        return self
