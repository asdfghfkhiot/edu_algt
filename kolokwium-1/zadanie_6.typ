// ============================================================
//  ZADANIE 6 -- rozwiązanie: kwantyfikator egzystencjalny z implikacją
// ============================================================

#import "lib.typ": *

#let prawda = text(fill: rgb("#2f6b3f"), weight: "bold")[prawdziwe]

// ------------------------------------------------------------
#zadanie("6", "[2 p.]", [
  Czy prawdziwe jest następujące zdanie:
  $ exists x in RR (sin x > x ==> x > 7) ? $
  Odpowiedź uzasadnić. Zapisać zaprzeczenie tego zdania bez użycia symbolu negacji.
])

#komentarz[
  To zadanie jest *testem na rozumienie implikacji i zasięgu kwantyfikatora*,
  a nie na trygonometrię. Trygonometria potrzebna jest tylko po to, by opisać
  zbiór prawdziwości poprzednika. Kluczowa obserwacja: kwantyfikator wiąże
  *całą* implikację, więc wystarczy jedna liczba $x$, dla której implikacja
  jest prawdziwa — a implikacja z fałszywym poprzednikiem jest prawdziwa
  *zawsze*. Wystarczy więc znaleźć choć jeden $x$ z $sin x <= x$; takich liczb
  jest nieskończenie wiele (wszystkie $x >= 0$).
]

#rozwiazanie[
  #krok("1", "Analiza zdania i jego zasięgu", [
    Zdanie ma postać $exists x in RR colon Phi(x)$, gdzie
    $ Phi(x) : quad sin x > x ==> x > 7 . $
    Kwantyfikator egzystencjalny obejmuje *całą* implikację $Phi(x)$, a nie tylko
    poprzednik $sin x > x$. Zdanie jest więc prawdziwe wtedy i tylko wtedy, gdy
    zbiór prawdziwości implikacji
    $ { x in RR : Phi(x) } = RR without { x in RR : sin x > x and x <= 7 } $
    jest niepusty. Wystarczy zatem wskazać *jedną* liczbę rzeczywistą $x_0$
    taką, że $Phi(x_0)$ jest prawdą.
  ])

  #krok("2", "Kiedy implikacja jest fałszywa", [
    Z tabeli prawdy (notatka, punkt 5): implikacja jest fałszywa wyłącznie wtedy,
    gdy poprzednik jest prawdziwy, a następnik fałszywy. Tutaj znaczy to, że
    $Phi(x)$ jest fałszywe $<=> sin x > x$ *oraz* $x <= 7$. Zatem:
    $ { x : Phi(x) } = RR without { x : sin x > x and x <= 7 } . $
    Aby wykazać prawdziwość zdania $exists x colon Phi(x)$, wystarczy znaleźć $x$,
    które *nie* należy do zbioru ${sin x > x and x <= 7}$ — czyli $x$, dla
    którego $sin x <= x$ (wtedy poprzednik jest fałszywy, a implikacja prawdziwa)
    albo $x > 7$ przy prawdziwym poprzedniku.
  ])

  #krok("3", "Opis zbioru prawdziwości poprzednika", [
    Wyznaczamy zbiór $P = { x in RR : sin x > x }$. Kluczowa nierówność:
    dla każdego $x in RR$ zachodzi $|sin x| <= |x|$, przy czym równość
    $|sin x| = |x|$ ma miejsce tylko dla $x = 0$. Stąd:
    #list(
      [dla $x > 0$: $sin x <= x$, a wobec $sin x < 1 <= x$ dla $x >= 1$,
       poprzednik jest fałszywy na całym $(0, infinity)$;],
      [dla $x = 0$: $sin 0 = 0$, więc $sin 0 > 0$ jest fałszywe;],
      [dla $x < 0$: $sin x > x$, bo $sin x = sin(-x)$ ze znakiem przeciwnym, a dla
       $u = -x > 0$ mamy $sin u < u$, czyli $-sin u > -u$; poprzednik jest więc
       *prawdziwy* dla wszystkich $x < 0$, np. dla $x = -1$:
       $sin(-1) approx -0.841 > -1$.],
    )
    Ostatecznie $P = (-infinity, 0)$, a zbiór $Q = { x : x > 7 } = (7, infinity)$.
    Zbiór fałszywości implikacji to
    $ P without Q = (-infinity, 0) without (7, infinity) = (-infinity, 0) , $
    gdyż żadna liczba ujemna nie jest większa od $7$.

    #align(center)[
      #box(width: 11.4cm, height: 6.6cm, {
        import "lib.typ": cplot
        cplot(
          w: 11.4cm, h: 6.6cm, unit: 1.02cm, ox: 5.1cm, oy: 4.15cm,
          xlab: $x$, ylab: $y$,
          body: (X, Y, P) => {
            let xmin = -5.0
            let xmax = 6.0
            // obszar x >= 0 -- implikacja prawdziwa
            place(rect(width: 11.4cm - X(0), height: 6.6cm,
              fill: rgb("#2f6b3f").transparentize(93%), stroke: none), dx: X(0), dy: 0pt)
            // obszar x < 0 -- poprzednik prawdziwy, implikacja falszywa
            place(rect(width: X(0), height: 6.6cm,
              fill: rgb("#8a4b2c").transparentize(93%), stroke: none), dx: 0pt, dy: 0pt)
            // prosta y = x
            place(path(stroke: (paint: rgb("#9aa9b8"), dash: "dashed", thickness: 0.85pt),
              (X(xmin), Y(xmin)), (X(xmax), Y(xmax))))
            // wykres sin x
            let pts = ()
            for i in range(0, 320) {
              let xx = xmin + (xmax - xmin) * i / 320
              pts.push((X(xx), Y(calc.sin(xx))))
            }
            place(path(stroke: rgb("#2c5f8a") + 1.2pt, ..pts))
            // świadek x = 0
            place(circle(width: 0.17cm, height: 0.17cm, fill: white, stroke: 1.3pt + rgb("#b0562c")),
              dx: X(0) - 0.085cm, dy: Y(0) - 0.085cm)
            place(dx: X(0) + 0.16cm, dy: Y(0) + 0.10cm,
              text(size: 8pt, fill: rgb("#b0562c"))[świadek $x_0 = 0$])
            place(dx: X(1.7), dy: Y(-1.75), text(size: 8.2pt, fill: rgb("#1e4b74"))[$y = sin x$])
            place(dx: X(3.3), dy: Y(3.35), text(size: 8pt, fill: rgb("#6b7c8d"))[$y = x$])
            place(dx: X(0.55), dy: Y(-2.15), text(size: 7.4pt, fill: rgb("#2f6b3f"))[
              poprzednik fałszywy $=>$ implikacja prawdziwa])
            place(dx: X(-4.85), dy: Y(1.05), text(size: 7.4pt, fill: rgb("#8a4b2c"))[
              poprzednik prawdziwy,])
            place(dx: X(-4.85), dy: Y(0.62), text(size: 7.4pt, fill: rgb("#8a4b2c"))[
              teza fałszywa $=>$ implikacja fałszywa])
            place(dx: X(0) + 0.06cm, dy: Y(0) + 0.09cm, text(size: 7.2pt, fill: rgb("#5b6b7b"))[$0$])
          },
        )
      })
    ]
    #v(-0.1em)
    #podpis[Wykresy $y = sin x$ i $y = x$. Poprzednik $sin x > x$ jest prawdziwy tylko
      dla $x < 0$; tam teza $x > 7$ jest fałszywa, więc implikacja jest fałszywa.
      Dla $x >= 0$ poprzednik jest fałszywy, więc implikacja jest prawdziwa —
      wystarczy więc jeden taki punkt, np. $x_0 = 0$.]
  ])

  #krok("4", "Świadek", [
    Bierzemy $x_0 = 0$. Wtedy:
    #list(
      [poprzednik: $sin 0 > 0$, czyli $0 > 0$ — *fałsz*;],
      [następnik: $0 > 7$ — *fałsz*;],
      [implikacja: $0 ==> 0$, czyli $1$ — *prawda* (fałszywy poprzednik).],
    )
    Zatem $Phi(0)$ jest prawdziwe, a więc zdanie $exists x in RR colon Phi(x)$ jest
    #prawda. Co więcej, świadkiem jest *każda* liczba $x >= 0$, bo dla nich poprzednik
    jest fałszywy. Zbiór prawdziwości implikacji to
    $[0, infinity)$ — zbiór niepusty, a nawet nieskończony.
  ])

  #krok("5", "Zaprzeczenie zdania", [
    Zaprzeczamy systematycznie, krok po kroku, i na końcu usuwamy wszystkie
    symbole negacji:
    $
      not exists x in RR (sin x > x ==> x > 7)
        &<=> forall x in RR thin not (sin x > x ==> x > 7)
          &&("de Morgan dla " exists) \
        &<=> forall x in RR thin (sin x > x and not (x > 7))
          &&("zaprzeczenie implikacji") \
        &<=> forall x in RR thin (sin x > x and x <= 7) .
          &&("zaprzeczenie nierówności") \
    $
    Zapis słowny: *dla każdej liczby rzeczywistej $x$ zachodzi jednocześnie
    $sin x > x$ oraz $x <= 7$*.

    Sprawdzenie: zaprzeczenie powinno być fałszywe (bo zdanie wyjściowe jest
    prawdziwe). Istotnie, dla $x = 8$ mamy $sin 8 <= 1 < 8$, więc pierwszy człon
    koniunkcji jest fałszywy — a to kontrprzykład dla zdania ogólnego.
    Otrzymaliśmy więc zdanie fałszywe, zgodnie z oczekiwaniem.
  ])

  #krok("6", "Dlaczego to działa — interpretacja zbiorowa", [
    Oznaczmy $P = {sin x > x} = (-infinity, 0)$ i $Q = {x > 7} = (7, infinity)$.
    Wtedy:
    #list(
      [zdanie wyjściowe: $P without Q != emptyset$ — prawda, bo $P without Q = P != emptyset$;],
      [zaprzeczenie: „każdy $x$ należy do $P without Q$”, czyli $P without Q = RR$
       — fałsz, bo $0 in.not P$.],
    )
    Widać, jak rzadko zdanie $exists x (p ==> q)$ jest fałszywe: musiałoby
    zachodzić $P without Q = RR$, czyli poprzednik prawdziwy *wszędzie*,
    a następnik fałszywy *wszędzie*. To sytuacja bardzo nietypowa.
  ])
]

#odpowiedz[
  *Zdanie jest #text(fill: rgb("#2f6b3f"), weight: "bold")[prawdziwe].*
  Świadkiem jest $x_0 = 0$ (a w istocie każda liczba $x >= 0$): wtedy
  $sin 0 > 0$ jest fałszywe, więc implikacja — jako implikacja z fałszywym
  poprzednikiem — jest prawdziwa.

  #v(0.25em)
  *Zaprzeczenie* (bez symbolu negacji):
  $ forall x in RR (sin x > x and x <= 7) . $
  Słownie: *dla każdej liczby rzeczywistej $x$ mamy $sin x > x$ oraz $x <= 7$*.
  Jest to zdanie fałszywe (kontrprzykład: $x = 8$), co potwierdza prawdziwość
  zdania wyjściowego.
]

#uwaga[
  Cztery typowe błędy w tym zadaniu:
  (1) *zaprzeczanie tezy zamiast implikacji* — $forall x (sin x > x and x > 7)$
  jest błędne, bo $not(x > 7)$ to $x <= 7$;
  (2) *potraktowanie zdania jako $forall$* — wtedy byłoby ono fałszywe
  (kontrprzykład $x = -1$), ale to inne zdanie;
  (3) *szukanie świadka z prawdziwym poprzednikiem* — niepotrzebne i nie da się
  (dla $x$, gdzie $sin x > x$, mamy $x < 0$, więc $x > 7$ jest fałszywe);
  (4) *uznanie, że „prawda pusta” to wybieg*. W logice implikacja z fałszywym
  poprzednikiem jest prawdziwa z definicji spójnika — to standardowa, poprawna
  odpowiedź, pod warunkiem, że zostanie wyraźnie uzasadniona.
]
