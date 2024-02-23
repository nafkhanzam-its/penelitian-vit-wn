#import "@nafkhanzam/drpm-template:0.0.1": template
#import "/abmas/globals.typ": *

#show: enable-todo-hl
#show: template.with(
  ref-style: "ieee",
  appendices: [
    #include "sections/a1-statement-letter.typ"; #pagebreak(weak: true);
    #include "sections/a2-tech-imagery.typ"; #pagebreak(weak: true);
    #include "sections/a3-location.typ"; #pagebreak(weak: true);
    #include "sections/a4-biodata.typ"; #pagebreak(weak: true);
  ]
)
#set document(title: data.title)

#include "sections/cover.typ"; #pagebreak(weak: true);
#set page(numbering: "i")
#include "sections/summary.typ"; #pagebreak(weak: true);
#include "/common/outline.typ"; #pagebreak(weak: true);
#set page(numbering: "1")
#counter(page).update(1)
#include "sections/1-introduction.typ"; #pagebreak(weak: true);
#include "sections/2-solution.typ"; #pagebreak(weak: true);
#include "sections/3-method.typ"; #pagebreak(weak: true);
#include "sections/4-output.typ"; #pagebreak(weak: true);
#include "sections/5-budget.typ"; #pagebreak(weak: true);
#include "sections/6-schedule.typ"; #pagebreak(weak: true);
#include "/common/references.typ"; #pagebreak(weak: true);
