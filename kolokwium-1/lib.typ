// ============================================================
//  ALGT 2025Z, kolokwium 1 (grupa T2)
//  Pomocniki: kolory, ramki, rysunki na płaszczyźnie zespolonej
// ============================================================

// ---------- paleta ----------
#let ink       = rgb("#1d2733")
#let accent    = rgb("#2c5f8a")
#let accent2   = rgb("#8a4b2c")
#let boxbg     = rgb("#eef2f7")
#let boxstroke = rgb("#c8d6e2")
#let figur     = rgb("#3a6ea5")
#let fillblue  = rgb("#3a6ea5")

// ---------- nagłówek części (pojawia się w spisie treści) ----------
#let czesc(tytul) = heading(level: 1, numbering: none, outlined: true,
  bookmarked: true)[#tytul]

// ---------- ramki ----------
#let rozwiazanie(body) = block(
  width: 100%,
  fill: boxbg,
  stroke: (left: 2.2pt + accent),
  inset: (left: 10pt, right: 10pt, top: 8pt, bottom: 9pt),
  above: 0.7em,
  below: 1em,
)[
  #text(size: 8.2pt, weight: "bold", fill: accent, tracking: 0.09em)[ROZWIĄZANIE]
  #v(0.45em)
  #body
]

#let uwaga(body) = block(
  width: 100%,
  stroke: (left: 2.2pt + rgb("#b07b12")),
  inset: (left: 10pt, right: 4pt, top: 1pt, bottom: 2pt),
  above: 0.8em, below: 0.9em,
)[
  #text(size: 9.3pt)[#strong[Uwaga.] #body]
]

#let odpowiedz_zwarta(body) = block(
  width: 100%,
  breakable: false,
  fill: rgb("#f1f6f1"),
  stroke: (left: 2.2pt + rgb("#3f7d3f")),
  inset: (left: 10pt, right: 10pt, top: 4pt, bottom: 4pt),
  above: 0.6em, below: 0.6em,
)[
  #text(size: 8.9pt)[#strong[Odpowiedź.] #body]
]

#let odpowiedz(body) = block(
  width: 100%,
  breakable: false,
  fill: rgb("#f1f6f1"),
  stroke: (left: 2.2pt + rgb("#3f7d3f")),
  inset: (left: 10pt, right: 10pt, top: 6pt, bottom: 7pt),
  above: 0.8em, below: 1em,
)[
  #text(size: 9.3pt)[#strong[Odpowiedź.] #body]
]

// ---------- tytuł zadania ----------
#let zadanie(nr, punkty, tresc) = block(breakable: false, above: 1.1em, below: 0.3em)[
  #heading(level: 2, numbering: none, bookmarked: true, outlined: true)[Zadanie #nr
    #h(0.5em)
    #text(size: 9.4pt, weight: "regular", fill: rgb("#5b6b7b"))[#punkty]]
  #v(0.12em)
  #tresc
]

// ============================================================
//  Rysunki
// ============================================================

// Układ współrzędnych w bloku o wymiarach w x h.
// X(x), Y(y) -- pozycja punktu (x,y) w bloku; P(cx,cy,r,a0,a1) -- łamana
// przybliżająca łuk okręgu (lista punktów).
#let cplot(
  w: 9cm, h: 7cm, unit: 1cm, ox: 4.4cm, oy: 3.4cm,
  xlab: $upright("Re")$, ylab: $upright("Im")$,
  arrow: true,
  body: (X, Y, P) => none,
) = block(width: w, height: h, {
  let X(x) = ox + x * unit
  let Y(y) = oy - y * unit
  let P(cx, cy, r, a0, a1, n: 90) = {
    let pts = ()
    for i in range(0, n + 1) {
      let a = a0 + (a1 - a0) * i / n
      pts.push((X(cx + r * calc.cos(a)), Y(cy + r * calc.sin(a))))
    }
    pts
  }
  // oś Re
  place(path(stroke: 0.65pt + ink, (0.15cm, oy), (w - 0.05cm, oy)))
  if arrow {
    place(polygon((w - 0.2cm, oy - 0.062cm), (w, oy), (w - 0.2cm, oy + 0.062cm), fill: ink))
  }
  place(dx: w - 0.48cm, dy: oy - 0.47cm, text(size: 8.4pt, fill: ink)[#xlab])
  // oś Im
  place(path(stroke: 0.65pt + ink, (ox, h - 0.05cm), (ox, 0.15cm)))
  if arrow {
    place(polygon((ox - 0.062cm, 0.2cm), (ox, 0pt), (ox + 0.062cm, 0.2cm), fill: ink))
  }
  place(dx: ox + 0.13cm, dy: 0.3cm, text(size: 8.4pt, fill: ink)[#ylab])
  body(X, Y, P)
})

// kropka (punkt należący do zbioru)
#let kropka(X, Y, x, y, r: 0.072cm, c: none) = {
  let col = if c == none { ink } else { c }
  place(dx: X(x) - r, dy: Y(y) - r, circle(width: 2 * r, height: 2 * r, fill: col))
}

// kółko (punkt nie należący do zbioru)
#let kolko(X, Y, x, y, r: 0.075cm) = {
  place(dx: X(x) - r, dy: Y(y) - r,
    circle(width: 2 * r, height: 2 * r, fill: white, stroke: 0.8pt + ink))
}

// podpis przy punkcie; (dx, dy) -- przesunięcie względem punktu
#let etykieta(X, Y, x, y, dx: 0.1cm, dy: -0.45cm, size: 8.4pt, body) = {
  place(dx: X(x) + dx, dy: Y(y) + dy, text(size: size, fill: ink)[#body])
}

// łuk / okrąg zadany środkiem i promieniem (w jednostkach układu)
#let luk(X, Y, cx, cy, r, a0: 0, a1: 2 * calc.pi, stroke: 0.65pt + gray, fill: none, closed: false) = {
  let pts = ()
  let n = 120
  for i in range(0, n + 1) {
    let a = a0 + (a1 - a0) * i / n
    pts.push((X(cx + r * calc.cos(a)), Y(cy + r * calc.sin(a))))
  }
  if fill == none {
    place(path(stroke: stroke, ..pts))
  } else {
    place(path(stroke: stroke, fill: fill, closed: true, ..pts))
  }
}

// odcinek
#let odcinek(X, Y, x1, y1, x2, y2, stroke: 0.65pt + ink) = {
  place(path(stroke: stroke, (X(x1), Y(y1)), (X(x2), Y(y2))))
}

// wielokąt (lista par); fill: none | kolor
#let wielokat(X, Y, pts, fill: none, stroke: 0.7pt + ink, closed: true) = {
  let q = pts.map(p => (X(p.at(0)), Y(p.at(1))))
  if fill == none {
    place(path(closed: closed, stroke: stroke, ..q))
  } else {
    place(path(closed: closed, stroke: stroke, fill: fill, ..q))
  }
}

// podpis pod rysunkiem umieszczonym wewnątrz ramki (wyśrodkowany, mniejszy)
#let podpis(body) = block(width: 100%, above: 0.3em, below: 0.85em, {
  set align(center)
  set text(size: 8.6pt, fill: rgb("#54687c"))
  body
})

#let rysunek(body, caption) = figure(
  align(center, box(body)),
  caption: caption,
  gap: 0.6em,
)

// wyróżnienie nazwy pojęcia w tekście
#let pojecie(body) = text(weight: "bold", fill: accent)[#body]

// ============================================================
//  Otoczenia notatki teoretycznej
// ============================================================

#let tw-counter = counter("twierdzenie")

// nagłówek notatki teoretycznej
#let notatka(tytul) = block(above: 1.35em, below: 0.45em, width: 100%)[
  #text(size: 8.3pt, weight: "bold", tracking: 0.1em, fill: accent2)[NOTATKA TEORETYCZNA]
  #v(-0.15em)
  #text(size: 11.2pt, weight: "bold")[#tytul]
  #v(-0.55em)
  #line(length: 100%, stroke: 0.5pt + rgb("#d8c3b0"))
]

// podrozdział notatki (pojawia się w spisie treści)
#let podtem(tytul) = heading(level: 3, numbering: none, outlined: true, bookmarked: true)[#tytul]

// mniejszy podrozdział -- bez wpisu w spisie treści
#let podpodtem(tytul) = block(above: 0.8em, below: 0.22em)[
  #text(size: 9.7pt, weight: "bold", style: "italic", fill: rgb("#3d5266"))[#tytul]
]

// ramka definicji
#let defn(nazwa: none, body) = {
  let et = if nazwa == none { [Definicja.] } else { [Definicja (#nazwa).] }
  block(
    width: 100%, inset: (left: 9pt, right: 6pt, top: 3pt, bottom: 3pt),
    stroke: (left: 1.6pt + rgb("#7b8fa3")), above: 0.75em, below: 0.85em,
  )[
    #text(size: 9.6pt)[
      #text(weight: "bold", fill: rgb("#33506b"))[#et]#h(0.3em)#body
    ]
  ]
}

// ramka twierdzenia (numeracja ciągła w całym dokumencie)
#let tw(nazwa: none, body) = {
  tw-counter.step()
  block(
    width: 100%, fill: rgb("#fbf7f0"), stroke: (left: 2pt + accent2),
    inset: (left: 10pt, right: 8pt, top: 6pt, bottom: 7pt),
    above: 0.85em, below: 0.9em,
  )[
    #context {
      let dop = if nazwa == none { "" } else { " (" + nazwa + ")" }
      text(size: 8.1pt, weight: "bold", tracking: 0.08em, fill: accent2)[
        TWIERDZENIE #tw-counter.display()#dop]
    }
    #v(0.35em)
    #body
  ]
}

// dowód
#let dowod(body) = block(
  width: 100%, inset: (left: 10pt, right: 2pt), above: 0.45em, below: 0.65em,
)[
  #set par(justify: true)
  #text(size: 9.4pt)[#emph[Dowód.] #body #h(0.12em)#$square$]
]

// przykład
#let przyklad(body) = block(
  width: 100%, inset: (left: 10pt, right: 6pt, top: 3pt, bottom: 3pt),
  stroke: (left: 1.6pt + rgb("#3f7d3f")), above: 0.75em, below: 0.85em,
)[
  #set par(justify: true)
  #text(size: 9.5pt)[
    #text(weight: "bold", fill: rgb("#2f6b3f"))[Przykład.]#h(0.3em)#body
  ]
]

// wniosek / obserwacja
#let wniosek(body) = block(
  width: 100%, inset: (left: 10pt, right: 6pt, top: 2pt, bottom: 2pt),
  stroke: (left: 1.6pt + rgb("#b07b12")), above: 0.6em, below: 0.7em,
)[
  #set par(justify: true)
  #text(size: 9.5pt)[#strong[Wniosek.]#h(0.3em)#body]
]

// krok rozwiązania
#let krok(nr, tytul, body) = block(above: 0.85em, below: 0.2em)[
  #text(weight: "bold", fill: accent)[Krok #nr.#h(0.35em)#tytul]
  #v(0.15em)
  #body
]

// ramka komentarza (dyskusja, kontekst, "dlaczego")
#let komentarz(body) = block(
  width: 100%, fill: rgb("#f5f2f9"), stroke: (left: 2.2pt + rgb("#6b4f8a")),
  inset: (left: 10pt, right: 9pt, top: 7pt, bottom: 8pt),
  above: 0.9em, below: 1em,
)[
  #text(size: 8.2pt, weight: "bold", tracking: 0.09em, fill: rgb("#6b4f8a"))[KOMENTARZ]
  #v(0.4em)
  #set par(justify: true)
  #text(size: 9.4pt)[#body]
]

// ramka "najważniejsze wzory"
#let wzory(body) = block(
  width: 100%, fill: rgb("#eef2f7"), stroke: 0.5pt + boxstroke,
  inset: (x: 10pt, y: 8pt), above: 0.9em, below: 1em,
)[
  #text(size: 8.2pt, weight: "bold", tracking: 0.09em, fill: accent)[DO ZAPAMIĘTANIA]
  #v(0.4em)
  #set text(size: 9.4pt)
  #body
]
