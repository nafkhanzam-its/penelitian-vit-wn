#import "/research/globals.typ": *

#set document(title: data.title)
#show: enable-todo-hl
#show: template.with(
  data,
  ref-style: "apa-id.csl",
)

#include "sections/0-0-cover.typ"; #pagebreak(weak: true);
#set page(numbering: "1")
#counter(page).update(1)
#include "sections/logbook.typ"; #pagebreak(weak: true);
