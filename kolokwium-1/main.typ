#import "lib.typ": *

// ============================================================
//  USTAWIENIA DOKUMENTU
// ============================================================
#set document(
  title: "ALGT 2025Z — kolokwium 1 (grupa T2): rozwiązania i notatki",
  author: "opracowanie",
)

#set page(
  paper: "a4",
  margin: (x: 2.0cm, top: 1.75cm, bottom: 1.85cm),
  numbering: "1",
  header: context {
    set text(size: 7.6pt, fill: rgb("#8595a5"))
    grid(
      columns: (1fr, auto),
      align: (left, right),
      [ALGT 2025Z · kolokwium 1 · grupa T2],
      [rozwiązania zadań 1--6 · notatki do zadań 5 i 6],
    )
    v(-0.55em)
    line(length: 100%, stroke: 0.35pt + rgb("#c8d6e2"))
  },
)

#set text(lang: "pl", font: "New Computer Modern", size: 10.2pt)
#set par(justify: true, leading: 0.72em, spacing: 1.1em)

#set heading(numbering: none)
#show heading.where(level: 1): it => block(above: 1.7em, below: 1.0em, {
  set text(size: 14.5pt, weight: "bold")
  it
  v(-0.75em)
  line(length: 100%, stroke: 0.75pt + accent)
})
#show heading.where(level: 2): it => block(above: 1.35em, below: 0.5em, {
  set text(size: 11.8pt, weight: "bold")
  it
})
#show heading.where(level: 3): it => block(above: 1.1em, below: 0.4em, {
  set text(size: 10.5pt, weight: "bold", style: "italic")
  it
})

#set math.equation(numbering: none)
#show math.equation.where(block: true): set block(above: 0.8em, below: 0.8em)

#set list(indent: 1.0em, spacing: 0.5em)
#set enum(indent: 1.0em, spacing: 0.5em)

#set figure(supplement: [Rysunek], numbering: "1.", gap: 0.6em)
#show figure.caption: set text(size: 8.8pt)
#show figure.caption: set par(justify: false)
#show figure.where(kind: table): set figure.caption(position: top)

// ============================================================
//  STRONA TYTUŁOWA
// ============================================================
#page(numbering: none, header: none)[
#align(center)[
  #v(2.2cm)
  #text(size: 9.5pt, tracking: 0.18em, fill: rgb("#6b7c8d"))[ALGEBRA LINIOWA I GEOMETRIA ANALITYCZNA]
  #v(0.5em)
  #text(size: 24pt, weight: "bold")[Kolokwium 1]
  #v(0.15em)
  #text(size: 13pt)[semestr zimowy 2025/2026 · grupa T2]
  #v(1.5cm)
  #line(length: 40%, stroke: 0.6pt + rgb("#98a8b8"))
  #v(1.5cm)
  #text(size: 15pt, weight: "bold")[Pełne rozwiązania zadań 1–6]
  #v(0.35em)
  #text(size: 11.5pt)[wraz z notatkami teoretycznymi do zadań 5 i 6]
  #v(3.2cm)
]

#block(width: 100%, fill: boxbg, stroke: (left: 3pt + accent), inset: 14pt, radius: (right: 3pt))[
  #set par(justify: true)
  #text(size: 9.3pt)[
    *Zawartość dokumentu.* Zbiór zawiera kompletny arkusz kolokwium (zadania 1--6,
    razem 16 punktów) oraz szczegółowe rozwiązania każdego z nich. Rozwiązania
    zadań 5 i 6 poprzedzono notatkami teoretycznymi: dla zadania 5 -- o rodzinach
    zbiorów, sumie i przekroju uogólnionym oraz o własnościach geometrycznych
    rodzin indeksowanych; dla zadania 6 -- o kwantyfikatorach, funktorach zdaniowych,
    prawach rachunku kwantyfikatorów, zaprzeczaniu zdań z kwantyfikatorami
    i o implikacji. Każde rozwiązanie zamyka jednoznacznie sformułowana odpowiedź.
  ]
]

#v(2.0cm)
#align(center)[
  #text(size: 8.6pt, fill: rgb("#7b8b9b"))[
    Dokument przygotowany w systemie Typst. Rysunki wykonano wektorowo.\
    Liczby zespolone zapisujemy w postaci $a + b j$ (jednostka urojona $j$, $j^2 = -1$).
  ]
]
]

// ============================================================
//  TREŚĆ ARKUSZA
// ============================================================
#pagebreak()

#align(center)[
  #text(size: 15.5pt, weight: "bold")[Treść arkusza]
]
#v(0.2em)

#let arkusz = (
  ("1", "3 p.", [Liczbę $(5 sqrt(3) - 5 j)^2 dot e^((5 pi)/4 j)$ zapisać w postaci
    kanonicznej oraz trygonometrycznej.]),
  ("2", "2 p.", [Zaznaczyć na płaszczyźnie zespolonej zbiór liczb $z$ spełniających warunki
    #box[$|z + 1 - j| <= sqrt(2)$] oraz
    #box[$-pi/4 < arg(z + 1 - j) <= (3 pi)/4$].]),
  ("3", "4 p.", [Znaleźć wszystkie rozwiązania równania $(z + 2 j)^3 = 64 j$ i zaznaczyć je
    na płaszczyźnie zespolonej. Rozwiązania podać w postaci kanonicznej.]),
  ("4", "2 p.", [Zapisać funkcję wymierną
    #box[$f(x) = (x^3 + 1) / ((x^2 + 4 x + 29)(x^2 - 3 x)^2)$]
    jako sumę ułamków prostych nad $RR$ i nad $CC$ (bez wyznaczania współczynników).]),
  ("5", "3 p.", [Dana jest rodzina trójkątów (wypełnionych) $(nabla_t)_(t in RR_+)$
    o wierzchołkach $A = (0, 0)$, $B_t = (1, t)$, $C_t = (-1, t)$. Narysować zbiory
    #box[$union.big_(t in RR_+) nabla_t$] oraz #box[$inter.big_(t in NN) nabla_t$].]),
  ("6", "2 p.", [Czy prawdziwe jest następujące zdanie:
    $exists x in RR (sin x > x ==> x > 7)$?
    Odpowiedź uzasadnić. Zapisać zaprzeczenie tego zdania bez użycia symbolu negacji.]),
)

#block(width: 100%, inset: (left: 12pt, right: 8pt, top: 8pt, bottom: 8pt),
  stroke: (left: 2pt + rgb("#b8c6d4")))[
  #set par(justify: true)
  #set text(size: 9.6pt)
  #for (nr, pts, t) in arkusz {
    grid(
      columns: (1.05em, 1fr),
      column-gutter: 0.45em,
      row-gutter: 0.62em,
      align: (right + top, left + top),
      text(weight: "bold")[#nr.],
      [#t #h(0.35em)#text(size: 8.8pt, fill: rgb("#6b7c8d"))[#pts]],
    )
  }
]
#v(-0.2em)
#align(right)[#text(size: 9pt, fill: rgb("#6b7c8d"))[razem: 16 punktów]]

#pagebreak()
#outline(title: [Spis treści], depth: 2)
#v(0.4em)

// ============================================================
//  ROZWIĄZANIA
// ============================================================
#pagebreak()
#align(center)[#text(size: 15.5pt, weight: "bold")[Rozwiązania zadań 1--4]]
#v(0.3em)
#include "zadania_1_4.typ"

#pagebreak()
#align(center)[#text(size: 15.5pt, weight: "bold")[Zadanie 5 wraz z notatką teoretyczną]]
#v(0.3em)
#include "zadanie_5.typ"

#pagebreak()
#align(center)[#text(size: 15.5pt, weight: "bold")[Zadanie 6 wraz z notatką teoretyczną]]
#v(0.3em)
#include "zadanie_6.typ"

#v(1.4em)
#align(center)[#text(size: 14pt, weight: "bold")[Zestawienie odpowiedzi]]
#v(0.5em)

#table(
  columns: (2.2em, 1fr),
  stroke: 0.4pt + rgb("#b8c6d4"),
  inset: (x: 7pt, y: 5pt),
  align: (center + horizon, left + horizon),
  table.header([#text(weight: "bold")[Zad.]], [#text(weight: "bold")[Odpowiedź]]),
  [1], [$w = -25(sqrt(6)+sqrt(2)) + 25(sqrt(6)-sqrt(2)) j
    = 100(cos((11pi)/12) + j sin((11pi)/12))$],
  [2], [Wycinek koła o środku $-1+j$, promieniu $sqrt(2)$ i kącie $pi$],
  [3], [$z in {2sqrt(3), thin -2sqrt(3), thin -6j}$],
  [4], [Nad $RR$ pięć ułamków prostych (z trójmianem $x^2+4x+29$ w mianowniku);
    nad $CC$ sześć ułamków liniowych, z parami współczynników sprzężonych],
  [5], [$union.big_t nabla_t = ([-1,1] times (0,infinity)) union {(0,0)}$,
    $inter.big_(t in NN) nabla_t = {0} times [0,1]$],
  [6], [Zdanie prawdziwe (świadek $x = 0$); zaprzeczenie:
    $forall x in RR (sin x > x and x <= 7)$],
)
