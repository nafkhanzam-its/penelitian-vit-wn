#import "/globals.typ": *
#import "preprocess.typ": preprocess-data

#let data = preprocess-data(data-unproc)
#let entry = (
  "proposal": (
    cover-title: [
      PROPOSAL \
      SKEMA PENELITIAN #upper(data.schema) \
      SUMBER DANA #upper(data.funding-source) \
      TAHUN #display-year
    ],
  ),
  "progress": (
    cover-title: [
      LAPORAN KEMAJUAN \
      SKEMA PENELITIAN #upper(data.schema) \
      SUMBER DANA #upper(data.funding-source) \
      TAHUN #display-year
    ],
  ),
  "logbook": (
    cover-title: [
      #text(size: 24pt)[CATATAN HARIAN] \
      PENELITIAN #upper(data.schema) \
      DANA #upper(data.funding-source) \
      TAHUN #display-year
    ],
  ),
).at(sys.inputs.ENTRY)
