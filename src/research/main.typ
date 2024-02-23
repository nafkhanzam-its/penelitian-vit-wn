#import "/research/globals.typ": *

#show: template.with(
  ref-style: "apa",
  appendices: [
    #include "sections/a0-appendices.typ"; #pagebreak(weak: true);
  ],
)

#include "sections/0-0-cover.typ"; #pagebreak(weak: true);
#set page(numbering: "i")
#include "/common/outline.typ"; #pagebreak(weak: true);
#include "sections/0-1-abstract.typ"; #pagebreak(weak: true);
#set page(numbering: "1")
#counter(page).update(1)
#include "sections/1-introduction.typ"; #pagebreak(weak: true);
#include "sections/2-literature-review.typ"; #pagebreak(weak: true);
#include "sections/3-method.typ"; #pagebreak(weak: true);
#include "sections/4-output.typ"; #pagebreak(weak: true);
#include "sections/5-schedule.typ"; #pagebreak(weak: true);
#include "sections/6-budget-plan.typ"; #pagebreak(weak: true);
#include "/common/references.typ"; #pagebreak(weak: true);
#include "sections/7-team.typ"; #pagebreak(weak: true);
