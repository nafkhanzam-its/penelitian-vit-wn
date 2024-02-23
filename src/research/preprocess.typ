#import "/globals.typ": *

#let BUDGET-KEYS = (
  "one-time-materials",
  "assets",
  "data-colletions",
  "reportings",
)

#let preprocess-data(d) = {
  // member defaults
  let member-default = access-field(d, "defaults", "member", default: ())
  d.members = d.members.map(member => apply-defaults(member, member-default))

  // ref defaults
  let apply-entries(members, ref-key) = members.map(
    member => apply-refs(
      member,
      ref-key,
      access-field(d, "entries", ref-key, default: ())
    )
  )
  d.members = apply-entries(d.members, "abmas-history")
  d.members = apply-entries(d.members, "publication-history")
  d.members = apply-entries(d.members, "intellectual-property-history")

  // calculate budget
  d.budget.total = 0
  for key in BUDGET-KEYS {
    let sub-total = 0
    for (i, item) in d.budget.at(key).items.enumerate() {
      let sub-sub-total = int(item.price * item.volume)
      d.budget.at(key).items.at(i).total = sub-sub-total
      sub-total += sub-sub-total
    }
    d.budget.at(key).insert("total", sub-total)
    d.budget.total += sub-total
  }

  d
}