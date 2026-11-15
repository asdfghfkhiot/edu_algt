#import "lib.typ": *

// ============================================================
//  ZADANIA 1--2 -- rozwiązania (uzupełnienie kompletu arkusza)
// ============================================================

#zadanie("1", "[3 p.]", [
  Liczbę $(5 sqrt(3) - 5 j)^2 dot e^((5 pi)/4 j)$ zapisać w postaci kanonicznej oraz
  trygonometrycznej.
])

#komentarz[
  Najprostsza droga to sprowadzić oba czynniki do postaci wykładniczej: mnożenie
  liczb zespolonych jest wtedy dodawaniem argumentów i mnożeniem modułów.
  Warto jednak (dla kontroli) wykonać też rachunek bezpośrednio w postaci
  kanonicznej — tak jak w rozwiązaniu poniżej, w ostatnim kroku.
]

#rozwiazanie[
  #krok("1", "Kwadrat pierwszego czynnika", [
    Korzystamy ze wzoru skróconego mnożenia i z tego, że $j^2 = -1$:
    $
      (5 sqrt(3) - 5 j)^2
        &= (5 sqrt(3))^2 - 2 dot 5 sqrt(3) dot 5 j + (5 j)^2 \
        &= 75 - 50 sqrt(3) j + 25 dot (-1)
        = 50 - 50 sqrt(3) j.
    $
  ])

  #krok("2", "Postać wykładnicza obu czynników", [
    Dla $z = 50 - 50 sqrt(3) j$ mamy
    $
      |z| = sqrt(50^2 + (50 sqrt(3))^2) = 50 sqrt(1 + 3) = 100,
      quad
      cos phi = 1/2, quad sin phi = -sqrt(3)/2,
    $
    skąd $phi = -pi/3$ (punkt leży w czwartej ćwiartce), czyli
    $z = 100 e^(-pi/3 j)$. Z kolei
    $
      e^((5 pi)/4 j) = cos((5 pi)/4) + j sin((5 pi)/4)
        = -sqrt(2)/2 - sqrt(2)/2 j
    $
    ma moduł $1$ i argument $(5 pi)/4$.
  ])

  #krok("3", "Mnożenie (moduły się mnożą, argumenty dodają)", [
    $
      w = (5 sqrt(3) - 5 j)^2 dot e^((5 pi)/4 j)
        &= 100 e^(-pi/3 j) dot e^((5 pi)/4 j) \
        &= 100 e^((-pi/3 + (5 pi)/4) j)
         = 100 e^((11 pi)/12 j).
    $
    Argument $(11 pi)/12$ leży już w przedziale $(-pi, pi]$, więc jest to argument
    główny — nie trzeba dodawać ani odejmować $2 pi$.
  ])

  #krok("4", "Postać kanoniczna", [
    Ze wzoru Eulera
    $
      w = 100 (cos((11 pi)/12) + j sin((11 pi)/12)).
    $
    Ponieważ $cos((11 pi)/12) = -cos(pi/12) = -(sqrt(6) + sqrt(2))/4$ oraz
    $sin((11 pi)/12) = sin(pi/12) = (sqrt(6) - sqrt(2))/4$, otrzymujemy
    $
      w = -25 (sqrt(6) + sqrt(2)) + 25 (sqrt(6) - sqrt(2)) j.
    $
  ])

  #krok("5", "Sprawdzenie bezpośrednio w postaci kanonicznej", [
    Mnożymy czynniki:
    $
      (50 - 50 sqrt(3) j)(-sqrt(2)/2 - sqrt(2)/2 j)
        &= -25 sqrt(2) - 25 sqrt(6) dot j^2 - 25 sqrt(2) j + 25 sqrt(6) j \
        &= -25 sqrt(2) + 25 sqrt(6) + 25(sqrt(6) - sqrt(2)) j ,
    $
    co potwierdza wynik (część rzeczywista $-25(sqrt(6)+sqrt(2))$, część urojona
    $25(sqrt(6)-sqrt(2))$). Liczbowo: $w approx -96.59 + 25.88 j$.
  ])
]

#odpowiedz[
  Postać kanoniczna: $w = -25(sqrt(6) + sqrt(2)) + 25(sqrt(6) - sqrt(2)) j$. \
  Postać trygonometryczna: $w = 100(cos((11 pi)/12) + j sin((11 pi)/12))$,
  równoważnie $w = 100 e^((11 pi)/12 j)$, $|w| = 100$, $arg w = (11 pi)/12$.
]

#uwaga[
  Kolejność działań ma znaczenie tylko pozornie: potęgowanie i mnożenie w $CC$
  są łączne, więc można też najpierw uprościć $e^((5 pi)/4 j)$, a potem podnieść
  wynik do kwadratu. Zawsze jednak trzeba pamiętać o sprowadzeniu argumentu
  do przedziału $(-pi, pi]$ — tu suma $-pi/3 + (5pi)/4 = (11 pi)/12$ już w nim leży,
  ale np. dla argumentu $(19 pi)/12$ należałoby odjąć $2 pi$.
]

// ------------------------------------------------------------
#zadanie("2", "[2 p.]", [
  Zaznaczyć na płaszczyźnie zespolonej zbiór liczb $z$ spełniających warunki
  $|z + 1 - j| <= sqrt(2) and -pi/4 < arg(z + 1 - j) <= (3 pi)/4$.
])

#rozwiazanie[
  #krok("1", "Podstawienie", [
    Niech
    $ w := z + 1 - j, quad "czyli" quad z = w - (1 - j). $
    Odwzorowanie $z |-> w$ jest *przesunięciem* płaszczyzny o wektor $(1, -1)$,
    czyli o $1$ w prawo i $1$ w dół; zbiór $W$ opisany samymi warunkami na $w$
    wystarczy więc narysować i przesunąć o wektor $-(1 - j) = -1 + j$.
    Warunki przyjmują postać
    $
      |w| <= sqrt(2) quad and quad -pi/4 < arg w <= (3 pi)/4 .
    $
  ])

  #krok("2", [Analiza geometryczna zbioru $W$], [
    #list(
      [Nierówność $|w| <= sqrt(2)$ opisuje *domknięte* koło o środku $w = 0$
       i promieniu $sqrt(2)$; brzeg (okrąg) należy do zbioru.],
      [Warunek na argument opisuje wycinek kątowy o wierzchołku $0$ rozpięty między
       promieniami o kątach $-pi/4$ i $3 pi/4$: promień o kącie $3 pi/4$ *należy*
       do zbioru (nierówność słaba), promień o kącie $-pi/4$ — *nie należy*
       (nierówność ostra). Kąt wycinka to $3pi/4 - (-pi/4) = pi$.],
      [Część wspólna to wycinek koła (półkole kątowe) o promieniu $sqrt(2)$.
       Punkt $w = 0$ leży w części wspólnej obwarunków $|w| <= sqrt(2)$, ale
       $arg 0$ jest nieokreślony — punkt ten *nie należy* do zbioru.],
    )
  ])

  #krok("3", [Przesunięcie o wektor $-1 + j$], [
    Środek koła przechodzi w $z_0 = -1 + j$. Końce łuku okręgu obliczamy wprost:
    $
      w = sqrt(2) e^(3 pi/4 j) = sqrt(2)(-sqrt(2)/2 + sqrt(2)/2 j) = -1 + j
        quad ==> quad z = (-1 + j) + (-1 + j) = -2 + 2j,
    $
    $
      w = sqrt(2) e^(-pi/4 j) = sqrt(2)(sqrt(2)/2 - sqrt(2)/2 j) = 1 - j
        quad ==> quad z = (1 - j) + (-1 + j) = 0 .
    $
    Widzimy więc, że promień otwarty (o kącie $-pi/4$) kończy się dokładnie
    w *początku układu* $z = 0$ — i właśnie ten punkt, jako leżący na otwartym
    brzegu, nie należy do zbioru.
  ])

  #krok("4", "Które punkty należą do zbioru", [
    #list(
      [łuk okręgu $|z - z_0| = sqrt(2)$ dla kątów $(-pi/4, 3 pi/4]$ — *należy*,
       ale bez końca odpowiadającego kątowi $-pi/4$ (czyli bez $z = 0$);],
      [odcinek od $z_0$ do $-2 + 2j$ (kierunek $3 pi/4$) — *należy*;],
      [odcinek od $z_0$ do $0$ (kierunek $-pi/4$) — *nie należy*
       (poza punktem $z_0$, który i tak nie należy);],
      [środek $z_0 = -1 + j$ — *nie należy* ($arg 0$ nie istnieje);],
      [punkty wewnątrz wycinka, np. $z = j$ ($w = 1$, $arg w = 0$, $|w| = 1$)
       — *należą*.],
    )
  ])

  #align(center)[
    #box(width: 12cm, height: 7.8cm, {
      import "lib.typ": cplot, kropka, kolko, etykieta, luk, odcinek, wielokat

      cplot(
        w: 12cm, h: 7.8cm, unit: 1.55cm, ox: 6.3cm, oy: 5.5cm,
        body: (X, Y, P) => {
          let cx = -1.0
          let cy = 1.0
          let R = calc.sqrt(2)
          let a0 = -calc.pi/4
          let a1 = 3 * calc.pi/4
          // wypełniony wycinek
          let arcp = P(cx, cy, R, a0, a1)
          place(path(closed: true, fill: figur.transparentize(84%), stroke: none,
            (X(cx), Y(cy)), ..arcp))
          // łuk -- brzeg należący
          place(path(stroke: figur + 1.15pt, ..arcp))
          // promień 3pi/4 -- należący
          place(path(stroke: figur + 1.15pt, (X(cx), Y(cy)), (X(-2), Y(2))))
          // promień -pi/4 -- nie należący (przerywany)
          place(path(stroke: (paint: accent2, dash: "dashed", thickness: 1pt),
            (X(cx), Y(cy)), (X(0), Y(0))))
          // punkty
          kropka(X, Y, -2, 2, c: figur)
          kolko(X, Y, 0, 0)
          kolko(X, Y, cx, cy)
          // opisy
          etykieta(X, Y, -2, 2, dx: -1.62cm, dy: -0.30cm)[$-2 + 2j$]
          etykieta(X, Y, 0, 0, dx: -0.34cm, dy: 0.14cm)[$0$]
          etykieta(X, Y, cx, cy, dx: -1.90cm, dy: -0.12cm)[$z_0 = -1 + j$]
          // osie: podpisy jednostek
          place(dx: X(1) - 0.12cm, dy: Y(0) + 0.07cm, text(size: 7.6pt, fill: rgb("#5b6b7b"))[$1$])
          place(dx: X(-1) - 0.18cm, dy: Y(0) + 0.07cm, text(size: 7.6pt, fill: rgb("#5b6b7b"))[$-1$])
          place(dx: X(0) + 0.07cm, dy: Y(2) - 0.38cm, text(size: 7.6pt, fill: rgb("#5b6b7b"))[$2$])
          // kąty przy wierzchołku
          place(dx: X(-0.72) - 0.10cm, dy: Y(0.72) + 0.05cm, text(size: 7.4pt, fill: accent2)[$-pi\/4$])
          place(dx: X(-1.52) - 0.80cm, dy: Y(1.52) + 0.08cm, text(size: 7.4pt, fill: accent)[$3pi\/4$])
        },
      )
    })
  ]
  #podpis[
    Zbiór z zadania 2. Linia ciągła — fragmenty brzegu należące do zbioru;
    linia przerywana — brzeg, który nie należy; puste kółka — punkty wyłączone.
  ]
]

#odpowiedz[
  Szukany zbiór to (domknięty poza wskazanymi fragmentami brzegu) wycinek koła
  $
    { z in CC : |z - (-1 + j)| <= sqrt(2), thin -pi/4 < arg(z + 1 - j) <= (3 pi)/4 },
  $
  czyli wycinek o środku $-1 + j$, promieniu $sqrt(2)$ i kącie $pi$, rozpięty między
  promieniami o kierunkach $-pi/4$ i $3 pi/4$. Do zbioru należą: łuk okręgu
  (bez punktu dla kąta $-pi/4$) i promień o kierunku $3pi/4$ (do punktu $-2 + 2j$).
  Nie należą: promień o kierunku $-pi/4$ (do punktu $0$) oraz sam środek $-1 + j$.
]

#uwaga[
  Typowy błąd to zapominanie o przesunięciu: warunek dotyczy $z + 1 - j$, a nie $z$.
  Drugi typowy błąd to potraktowanie nierówności $|z + 1 - j| <= sqrt(2)$ jako
  okręgu — jest to *koło* (z wnętrzem), a $arg$ wycina z niego wycinek.
]
