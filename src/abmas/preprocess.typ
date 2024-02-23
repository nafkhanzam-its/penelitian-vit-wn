#import "/globals.typ": *

#let apply-member-default(member, member-default) = {
  for (key, value) in member-default.pairs() {
    if key not in member {
      member.insert(key, value)
    }
  }
  member
}

#let apply-refs(member, key, refs) = {
  member.insert(key, access-field(member, key, default: ()))
  for (i, v) in member.at(key).enumerate() {
    let ref = access-field(v, "ref")
    if ref != none {
      for (key, value) in refs.at(ref).pairs() {
        v.insert(key, value)
      }
      v.remove("ref")
    }

    let additional = access-field(v, "additional")
    if additional != none {
      for (key, value) in additional.pairs() {
        v.insert(key, value)
      }
      v.additional = none
      v.remove("additional")
    }

    member.at(key).at(i) = v
  }

  return member
}

#let BUDGET-KEYS = (
  "one-time-materials",
  "assets",
  "data-colletions",
  "reportings",
)

#let preprocess-data(d) = {
  // member defaults
  let member-default = access-field(d, "defaults", "member", default: ())
  d.members = d.members.map(member => apply-member-default(member, member-default))

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