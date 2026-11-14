// ============================================================
//  ZADANIA 1--4
// ============================================================

#import "lib.typ": *

// ------------------------------------------------------------
#zadanie("1", "[3 p.]", [
  Liczbę $(5 sqrt(3) - 5 j)^2 dot e^((5 pi)/4 j)$ zapisać w postaci kanonicznej oraz
  trygonometrycznej.
])

#rozwiazanie[
  *Krok 1 (kwadrat pierwszego czynnika).* Korzystamy ze wzoru skróconego mnożenia
  i z tego, że $j^2 = -1$:
  $
    (5 sqrt(3) - 5 j)^2
      &= (5 sqrt(3))^2 - 2 dot 5 sqrt(3) dot 5 j + (5 j)^2 \
      &= 75 - 50 sqrt(3) j + 25 dot (-1)
      = 50 - 50 sqrt(3) j.
  $

  *Krok 2 (postać wykładnicza obu czynników).* Dla $z = 50 - 50 sqrt(3) j$ mamy
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

  *Krok 3 (mnożenie).* Moduły się mnożą, argumenty dodają:
  $
    w = (5 sqrt(3) - 5 j)^2 dot e^((5 pi)/4 j)
      = 100 e^(-pi/3 j) dot e^((5 pi)/4 j)
      = 100 e^((-pi/3 + (5 pi)/4) j)
      = 100 e^((11 pi)/12 j).
  $
  Argument $(11 pi)/12$ leży już w przedziale $(-pi, pi]$, więc jest to argument główny.

  *Krok 4 (postać kanoniczna).* Ze wzoru Eulera
  $
    w = 100 (cos((11 pi)/12) + j sin((11 pi)/12)).
  $
  Ponieważ $cos((11 pi)/12) = -cos(pi/12) = -(sqrt(6) + sqrt(2))/4$ oraz
  $sin((11 pi)/12) = sin(pi/12) = (sqrt(6) - sqrt(2))/4$, otrzymujemy
  $
    w = -25 (sqrt(6) + sqrt(2)) + 25 (sqrt(6) - sqrt(2)) j.
  $

  *Sprawdzenie bezpośrednio w postaci kanonicznej.* Mnożymy czynniki:
  $
    (50 - 50 sqrt(3) j)(-sqrt(2)/2 - sqrt(2)/2 j)
      &= -25 sqrt(2) - 25 sqrt(6) dot j^2 - 25 sqrt(2) j + 25 sqrt(6) j \
      &= -25 sqrt(2) + 25 sqrt(6) + 25(sqrt(6) - sqrt(2)) j ,
  $
  co potwierdza wynik (część rzeczywista $-25(sqrt(6)+sqrt(2))$, część urojona
  $25(sqrt(6)-sqrt(2))$). Liczbowo: $w approx -96.59 + 25.88 j$.
]

#odpowiedz[
  Postać kanoniczna: $w = -25(sqrt(6) + sqrt(2)) + 25(sqrt(6) - sqrt(2)) j$.\
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
  *Podstawienie.* Niech
  $
    w := z + 1 - j, quad "czyli" quad z = w - (1 - j).
  $
  Odwzorowanie $z |-> w$ jest *przesunięciem* płaszczyzny o wektor $(1, -1)$,
  czyli o $1$ w prawo i $1$ w dół w stosunku do $z$; zbiór $W$ opisany samymi
  warunkami na $w$ wystarczy więc narysować i przesunąć o wektor $-(1 - j) = -1 + j$.
  Warunki przyjmują postać
  $
    |w| <= sqrt(2) quad and quad -pi/4 < arg w <= (3 pi)/4 .
  $

  *Analiza geometryczna zbioru $W$.*
  #list(
    [Nierówność $|w| <= sqrt(2)$ opisuje *domknięte* koło o środku $w = 0$
     i promieniu $sqrt(2)$; brzeg (okrąg) należy do zbioru.],
    [Warunek na argument opisuje wycinek kątowy o wierzchołku $0$ rozpięty między
     promieniami o kątach $-pi/4$ i $3 pi/4$: promień o kącie $3 pi/4$ *należy*
     do zbioru (nierówność słaba), promień o kącie $-pi/4$ — *nie należy*
     (nierówność ostra). Kąt wycinka to $3pi/4 - (-pi/4) = pi$.],
    [Część wspólna to wycinek koła (półkole kątowe) o promieniu $sqrt(2)$.
     Punkt $w = 0$ leży w części wspólnej obu warunków $|w| <= sqrt(2)$, ale
     $arg 0$ jest nieokreślony — punkt ten *nie należy* do zbioru.],
  )

  *Przesunięcie o wektor $-1 + j$.* Środek koła przechodzi w $z_0 = -1 + j$.
  Końce łuku okręgu obliczamy wprost:
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

  *Które punkty należą do zbioru.*
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

// ------------------------------------------------------------
#zadanie("3", "[4 p.]", [
  Znaleźć wszystkie rozwiązania równania $(z + 2 j)^3 = 64 j$ i zaznaczyć je na
  płaszczyźnie zespolonej. Rozwiązania podać w postaci kanonicznej.
])

#rozwiazanie[
  *Podstawienie.* Równanie ma postać $u^3 = 64 j$, gdzie $u := z + 2 j$.
  Obliczymy wszystkie pierwiastki trzeciego stopnia z liczby $64 j$, a następnie
  wrócimy do $z = u - 2 j$. Przesunięcie o wektor $-2 j$ nie zmienia liczby
  rozwiązań ani ich wzajemnego położenia — przesuwa tylko całą konfigurację.

  *Postać trygonometryczna prawej strony.*
  $
    64 j = 64 (cos(pi/2) + j sin(pi/2)) = 64 e^(pi/2 j),
    quad |64 j| = 64, quad arg(64 j) = pi/2 .
  $

  *Wzór na pierwiastki.* Pierwiastki $n$-tego stopnia z liczby $w = |w| e^(j theta)$
  dane są wzorem
  $
    z_k = root(n, |w|) e^((theta + 2 k pi)/n j), quad k = 0, 1, ..., n - 1 .
  $
  Dla $n = 3$, $|w| = 64$, $theta = pi/2$:
  $
    u_k = root(3, 64) e^((pi/2 + 2 k pi)/3 j) = 4 e^((pi/6 + 2k pi/3) j),
    quad k = 0, 1, 2 .
  $
  Pierwiastki leżą więc na okręgu o promieniu $4$, w wierzchołkach trójkąta
  równobocznego, w równych odstępach kąta $2pi/3$.

  *Trzy pierwiastki $u_k$.*
  $
    u_0 &= 4 e^(pi/6 j) = 4(cos(pi/6) + j sin(pi/6)) = 4(sqrt(3)/2 + 1/2 j) = 2 sqrt(3) + 2 j, \
    u_1 &= 4 e^(5 pi/6 j) = 4(-sqrt(3)/2 + 1/2 j) = -2 sqrt(3) + 2 j, \
    u_2 &= 4 e^(3 pi\/2 j) = 4(cos(3 pi\/2) + j sin(3 pi\/2)) = 4(0 - j) = -4 j.
  $

  *Powrót do $z$ ($z = u - 2j$).*
  $
    z_0 = 2 sqrt(3) + 2 j - 2 j = 2 sqrt(3), quad
    z_1 = -2 sqrt(3) + 2 j - 2 j = -2 sqrt(3), quad
    z_2 = -4 j - 2 j = -6 j.
  $

  *Sprawdzenie.* Dla $z_0 = 2 sqrt(3)$ mamy $z_0 + 2 j = 2 sqrt(3) + 2 j = u_0$, a
  $
    u_0^3 = 4^3 e^(3 dot pi\/6 j) = 64 e^(pi\/2 j) = 64 j .
  $
  Analogicznie $u_1^3 = 64 e^(5 pi/2 j) = 64 e^(pi/2 j) = 64 j$ oraz
  $u_2^3 = 64 e^(9 pi/2 j) = 64 e^(pi/2 j) = 64 j$, gdyż $e^(2 pi j) = 1$.
  Warto podkreślić, że sześcian samego $z_0$ nie jest równy $64j$:
  $(2 sqrt(3))^3 = 24 sqrt(3)$ — równanie dotyczy bowiem $u = z + 2j$, a nie $z$.

  #align(center)[
    #box(width: 12cm, height: 9.6cm, {
      import "lib.typ": cplot, kropka, kolko, etykieta, luk, odcinek
      cplot(
        w: 12cm, h: 9.6cm, unit: 0.85cm, ox: 5.9cm, oy: 3.3cm,
        body: (X, Y, P) => {
          let R = 4.0
          // okrąg |u| = 4, środek -2j (dla u = z + 2j)
          place(path(stroke: (paint: rgb("#9aa9b8"), dash: "dashed", thickness: 0.7pt),
            ..P(0, -2, R, 0, 2 * calc.pi)))
          // trójkąt równoboczny o wierzchołkach w pierwiastkach
          place(path(closed: true, stroke: (paint: rgb("#8fb2cf"), dash: "dashed", thickness: 0.8pt),
            (X(3.4641), Y(0)), (X(-3.4641), Y(0)), (X(0), Y(-6))))
          // promienie od środka -2j do pierwiastków
          for q in ((3.4641, 0.0), (-3.4641, 0.0), (0.0, -6.0)) {
            place(path(stroke: (paint: figur.transparentize(30%), thickness: 0.7pt),
              (X(0), Y(-2)), (X(q.at(0)), Y(q.at(1)))))
          }
          kropka(X, Y, 0, -2, c: rgb("#7f8c9b"), r: 0.05cm)
          kropka(X, Y, 3.4641, 0, c: figur)
          kropka(X, Y, -3.4641, 0, c: figur)
          kropka(X, Y, 0, -6, c: figur)
          // opisy punktów
          etykieta(X, Y, 3.4641, 0, dx: 0.14cm, dy: -0.42cm)[$z_0 = 2 sqrt(3)$]
          etykieta(X, Y, -3.4641, 0, dx: -2.42cm, dy: -0.42cm)[$z_1 = -2 sqrt(3)$]
          etykieta(X, Y, 0, -6, dx: -1.62cm, dy: -0.20cm)[$z_2 = -6j$]
          // podziałka osi Im
          place(dx: X(0) + 0.10cm, dy: Y(2) - 0.40cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$2$])
          place(dx: X(0) + 0.10cm, dy: Y(-2) - 0.40cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-2$])
          place(dx: X(0) + 0.10cm, dy: Y(-6) - 0.40cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-6$])
          // podziałka osi Re
          // adnotacja o okręgu
          place(dx: X(0) + 1.45cm, dy: Y(2) - 0.10cm,
            text(size: 7.2pt, fill: rgb("#68798a"))[okrąg $|u| = 4$])
        },
      )
    })
  ]
  #podpis[
    Pierwiastki $z_0, z_1, z_2$ leżą w wierzchołkach trójkąta równobocznego
    wpisanego w okrąg o środku $-2j$ i promieniu $4$.
  ]
]

#odpowiedz[
  $z_0 = 2 sqrt(3), quad z_1 = -2 sqrt(3), quad z_2 = -6 j$. \
  Trzy rozwiązania są wierzchołkami trójkąta równobocznego o środku $-2j$,
  wpisanego w okrąg o promieniu $4$.
]

#uwaga[
  Pierwiastki $n$-tego stopnia z liczby zespolonej zawsze tworzą $n$-kąt foremny
  o środku w początku układu — i tu właśnie dlatego rozwiązania leżą na okręgu,
  a nie, jak czasem błędnie się sądzi, na prostej. Pamiętaj też, żeby po wyliczeniu
  $u_k$ *wrócić* do zmiennej $z$; pominięcie przesunięcia $-2j$ jest najczęstszym
  błędem w tym zadaniu.
]

// ------------------------------------------------------------
#zadanie("4", "[2 p.]", [
  Zapisać funkcję wymierną
  $ f(x) = (x^3 + 1) / ((x^2 + 4 x + 29)(x^2 - 3 x)^2) $
  jako sumę ułamków prostych nad $RR$ oraz nad $CC$ (bez wyznaczania współczynników).
])

#rozwiazanie[
  #text(weight: "bold", fill: accent)[Krok 1. Stopnie i rozkład mianownika.]
  Licznik ma stopień $3$, mianownik
  $(x^2 + 4x + 29)(x^2 - 3x)^2$ — stopień $2 + 4 = 6$. Ponieważ
  $3 < 6$, funkcja jest *właściwa*: w rozkładzie nie występuje część wielomianowa.

  Mianownik rozkładamy na czynniki nierozkładalne:
  $
    x^2 - 3 x = x (x - 3) quad ==> quad (x^2 - 3x)^2 = x^2 (x - 3)^2,
  $
  $
    x^2 + 4 x + 29 = (x + 2)^2 + 25, quad Delta = 16 - 116 = -100 < 0 .
  $
  Czynnik $x^2 + 4 x + 29$ jest więc nierozkładalny nad $RR$ (jego pierwiastki
  $x = -2 plus.minus 5 j$ są zespolone, sprzężone), natomiast nad $CC$ rozkłada się na
  dwa czynniki liniowe:
  $
    x^2 + 4 x + 29 = (x + 2 - 5 j)(x + 2 + 5 j).
  $

  #text(weight: "bold", fill: accent)[Krok 2. Rozkład nad $RR$.]
  Czynnikowi liniowemu $(x - a)$ w mianowniku odpowiada ułamek
  $A/(x - a)$; czynnikowi $(x - a)^k$ — suma $A_1/(x-a) + dots.c + A_k/(x-a)^k$;
  nierozkładalnemu czynnikowi kwadratowemu odpowiada ułamek $(A x + B) \/ ("ten czynnik")$.
  Uwzględniając krotności, otrzymujemy
  $
    f(x) = (A x + B) / (x^2 + 4 x + 29)
           + C/x + D/x^2
           + E/(x - 3) + F/(x - 3)^2 .
  $
  Jest tu $1 + 2 + 2 = 5$ nieznanych współczynników, czyli dokładnie tyle, ile
  wynosi stopień mianownika ($6$) minus jeden — to potwierdza poprawność rozkładu.

  #text(weight: "bold", fill: accent)[Krok 3. Rozkład nad $CC$.]
  Nad ciałem liczb zespolonych każdy wielomian rozkłada się
  na czynniki liniowe, więc w mianowniku mamy wyłącznie czynniki postaci
  $(x - a)^k$: $x^2$, $(x-3)^2$ oraz dwa czynniki pojedyncze. Stąd
  $
    f(x) = A_1/(x + 2 - 5 j) + A_2/(x + 2 + 5 j)
           + C/x + D/x^2
           + E/(x - 3) + F/(x - 3)^2 .
  $
  Ponieważ współczynniki $f$ są rzeczywiste, a czynniki odpowiadające
  $x + 2 - 5j$ i $x + 2 + 5j$ są sprzężone, zachodzi $A_2 = overline(A_1)$
  — to właśnie dlatego nad $RR$ te dwa ułamki „sklejają się” w jeden ułamek
  z nierozkładalnym trójmianem w mianowniku.
]

#odpowiedz[
  Nad $RR$:
  $
    f(x) = (A x + B)/(x^2 + 4 x + 29) + C/x + D/x^2 + E/(x - 3) + F/(x - 3)^2,
  $
  nad $CC$:
  $
    f(x) = A_1/(x + 2 - 5 j) + A_2/(x + 2 + 5 j) + C/x + D/x^2 + E/(x - 3) + F/(x - 3)^2,
  $
  przy czym $A_2 = overline(A_1)$.
]

#block(width: 100%, stroke: (left: 2.2pt + rgb("#5b7f5b")), inset: (left: 10pt, right: 6pt),
  above: 0.8em, below: 1em)[
  #text(size: 9.2pt)[
    *Kontrola (nadobowiązkowa).* Zadanie nie wymaga wyznaczania współczynników,
    ale dla sprawdzenia podajemy wartości: $A = -1703/210250$,
    $B = -24531/210250$, $C = 46/22707$, $D = 1/261$, $E = 41/6750$,
    $F = 14/225$; nad $CC$:
    $A_1 = overline(A_2) = -1703/420500 + 169/16820 j$. Podstawienie tych liczb
    do prawej strony odtwarza $f(x)$ dla wszystkich $x != 0, thin 3, thin -2 plus.minus 5j$.
  ]
]
