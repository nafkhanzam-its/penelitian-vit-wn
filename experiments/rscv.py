hyperparams = {
    "dataset": "CassavaNew",  # this is for salt stress dataset
    "folder": "Data/",
    "model": "irf",
    "epoch": 200,
    "runs": 10,
    "flag": 0,
    "training_sample": 0.7,
    "val_size": 0,
    "sampling_mode": "kfold",
    "lr": 0.0002,
    "patch_size": 17,
    "batch_size": 256,
    "ignored_labels": 0,
    "norm_type": "scale",
    "padded": 1,
    "dmodel": 96,
    "nhead": 4,
    "depth": 5,
    "dropout": 0.1,
    "ignored_labels": [0],
    "supervision": "full",
    "device": "cuda",
    "Beta": 1,  # this is wor class weight loss for imbalance data
    "channels": 1,
    "restore": None,
}

#? DATASET
from HSI import *
from sklearn import preprocessing
from sklearn.decomposition import PCA
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import RandomizedSearchCV

HSIs = HSI(**hyperparams)

data = preprocessing.scale(HSIs.img)
pca = PCA(n_components=30)
data_pca = pca.fit_transform(data)
data_img = data_pca

y = HSIs.gt
X = data_img

#? TRAIN
from sklearn import metrics
# Create a Random Forest classifier
rf = RandomForestClassifier(n_estimators=100, random_state=42)
# Number of trees in random forest
n_estimators = [int(x) for x in np.linspace(start = 200, stop = 2000, num = 10)]
# Number of features to consider at every split
max_features = ['log2', 'sqrt']
# Maximum number of levels in tree
max_depth = [int(x) for x in np.linspace(10, 110, num = 11)]
max_depth.append(None)
# Minimum number of samples required to split a node
min_samples_split = [2, 5, 10]
# Minimum number of samples required at each leaf node
min_samples_leaf = [1, 2, 4]
# Method of selecting samples for training each tree
bootstrap = [True, False]
# Create the random grid
random_grid = {'n_estimators': n_estimators,
               'max_features': max_features,
               'max_depth': max_depth,
               'min_samples_split': min_samples_split,
               'min_samples_leaf': min_samples_leaf,
               'bootstrap': bootstrap}
clf = RandomizedSearchCV(
    rf,
    random_grid,
    cv=10,
    random_state=42,
    n_iter=10,
    n_jobs=8,
    verbose=2,
    scoring='accuracy',
)
search = clf.fit(X, y)
# y_pred = rf.predict(x_test)
print(search)
