#import "/research/globals.typ": *

#set document(title: data.title)
#show: enable-todo-hl
#show: template.with(
  data,
  ref-style: "apa-id.csl",
)


#include "sections/0-0-cover-blue.typ"; #pagebreak(weak: true);
#set page(numbering: "i")
#include "/common/outline.typ"; #pagebreak(weak: true);
#include "sections/0-1-abstract.typ"; #pagebreak(weak: true);
#set page(numbering: "1")
#counter(page).update(1)
#include "sections/progress.typ"; #pagebreak(weak: true);
#include "/common/references.typ"; #pagebreak(weak: true);
