#import "lib.typ": *

// ============================================================
//  ZADANIE 3 -- rozwiązanie: pierwiastki zespolone
// ============================================================

#zadanie("3", "[4 p.]", [
  Znaleźć wszystkie rozwiązania równania $(z + 2 j)^3 = 64 j$ i zaznaczyć je na
  płaszczyźnie zespolonej. Rozwiązania podać w postaci kanonicznej.
])

#rozwiazanie[
  #krok("1", "Podstawienie", [
    Równanie ma postać $u^3 = 64 j$, gdzie $u := z + 2 j$.
    Obliczymy wszystkie pierwiastki trzeciego stopnia z liczby $64 j$, a następnie
    wrócimy do $z = u - 2 j$. Przesunięcie o wektor $-2 j$ nie zmienia liczby
    rozwiązań ani ich wzajemnego położenia — przesuwa tylko całą konfigurację.
  ])

  #krok("2", "Postać trygonometryczna prawej strony", [
    $
      64 j = 64 (cos(pi/2) + j sin(pi/2)) = 64 e^(pi/2 j),
      quad |64 j| = 64, quad arg(64 j) = pi/2 .
    $
  ])

  #krok("3", "Wzór na pierwiastki", [
    Pierwiastki $n$-tego stopnia z liczby $w = |w| e^(j theta)$ dane są wzorem
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
  ])

  #krok("4", [Trzy pierwiastki $u_k$], [
    $
      u_0 &= 4 e^(pi/6 j) = 4(cos(pi/6) + j sin(pi/6)) = 4(sqrt(3)/2 + 1/2 j) = 2 sqrt(3) + 2 j, \
      u_1 &= 4 e^(5 pi/6 j) = 4(-sqrt(3)/2 + 1/2 j) = -2 sqrt(3) + 2 j, \
      u_2 &= 4 e^(3 pi\/2 j) = 4(cos(3 pi\/2) + j sin(3 pi\/2)) = 4(0 - j) = -4 j.
    $
  ])

  #krok("5", [Powrót do $z$ ($z = u - 2j$)], [
    $
      z_0 = 2 sqrt(3) + 2 j - 2 j = 2 sqrt(3), quad
      z_1 = -2 sqrt(3) + 2 j - 2 j = -2 sqrt(3), quad
      z_2 = -4 j - 2 j = -6 j.
    $
  ])

  #krok("6", "Sprawdzenie", [
    Dla $z_0 = 2 sqrt(3)$ mamy $z_0 + 2 j = 2 sqrt(3) + 2 j = u_0$, a
    $
      u_0^3 = 4^3 e^(3 dot pi\/6 j) = 64 e^(pi\/2 j) = 64 j .
    $
    Analogicznie $u_1^3 = 64 e^(5 pi/2 j) = 64 e^(pi/2 j) = 64 j$ oraz
    $u_2^3 = 64 e^(9 pi/2 j) = 64 e^(pi/2 j) = 64 j$, gdyż $e^(2 pi j) = 1$.
    Warto podkreślić, że sześcian samego $z_0$ nie jest równy $64j$:
    $(2 sqrt(3))^3 = 24 sqrt(3)$ — równanie dotyczy bowiem $u = z + 2j$, a nie $z$.
  ])

  #align(center)[
    #box(width: 12cm, height: 9.6cm, {
      import "lib.typ": cplot, kropka, kolko, etykieta, luk, odcinek
      cplot(
        w: 12cm, h: 9.6cm, unit: 0.85cm, ox: 5.9cm, oy: 3.3cm,
        body: (X, Y, P) => {
          let R = 4.0
          // okrąg |u| = 4, środek -2j
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
  o środku w punkcie przesunięcia — dla $u$ jest to środek $0$, dla $z$ — środek
  $-2j$. Pamiętaj też, żeby po wyliczeniu $u_k$ *wrócić* do zmiennej $z$;
  pominięcie przesunięcia $-2j$ jest najczęstszym błędem w tym zadaniu.
]
