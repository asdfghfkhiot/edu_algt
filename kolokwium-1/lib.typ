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
