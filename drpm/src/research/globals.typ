#import "/globals.typ": *
#import "preprocess.typ": preprocess-data

#let data = preprocess-data(data-unproc)
#let entry = (
  "proposal": (
    cover-title: [PROPOSAL],
  ),
  "progress": (
    cover-title: [LAPORAN KEMAJUAN],
  ),
  "logbook": (
    cover-title: [CATATAN HARIAN],
  ),
).at(sys.inputs.ENTRY)
