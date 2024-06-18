#import "@preview/oxifmt:0.2.1": strfmt
#import "./data.typ": *

#let metric-fns = (
  "OA": v => v.at("ListOA").sum() / v.at("ListOA").len(),
  "AA": v => v.at("ListAA").sum() / v.at("ListAA").len(),
  "Kappa": v => v.at("ListKappa").sum() / v.at("ListKappa").len(),
  "F-mean": v => v.at("List-F-mean").sum() / v.at("List-F-mean").len(),
)
#let metrics = metric-fns.keys()

#let data = {
  let data = (:)
  for (model, value) in d {
    data.insert(model, (:))
    for (key, fn) in metric-fns {
      data.at(model).insert(key, fn(value))
    }
  }
  data
}

#let maximums = {
  let maximums = (:)
  for metric in metrics {
    let res = 0
    for (model, value) in data {
      res = calc.max(res, value.at(metric))
    }
    maximums.insert(metric, res)
  }
  maximums
}

#set page(width: auto, height: auto)

#table(
  columns: 1 + metric-fns.len(),
  fill: (x, y) => if y == 0 {
    blue.lighten(50%)
  } else if x == 0 {
    yellow.lighten(70%)
  },
  ..("Model", ..metrics).map(v => align(center)[*#v*]),
  ..data.pairs().map(((key, value)) => (
    key,
    metrics.map(metric => {
      let v = value.at(metric)
      let disp = strfmt("{:.4}", v)
      set align(center)
      if (v == maximums.at(metric)) {
        underline[*#disp*]
      } else {
        [#disp]
      }
    }),
  )).flatten(),
)
