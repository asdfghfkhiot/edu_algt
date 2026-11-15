#import "lib.typ": *

// ============================================================
//  ZADANIE 4 -- rozwiązanie: ułamki proste nad R i nad C
// ============================================================

#zadanie("4", "[2 p.]", [
  Zapisać funkcję wymierną
  $ f(x) = (x^3 + 1) / ((x^2 + 4 x + 29)(x^2 - 3 x)^2) $
  jako sumę ułamków prostych nad $RR$ oraz nad $CC$ (bez wyznaczania współczynników).
])

#rozwiazanie[
  #krok("1", "Stopnie i rozkład mianownika", [
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
  ])

  #krok("2", [Kształt rozkładu nad $RR$], [
    Czynnikowi liniowemu $(x - a)$ w mianowniku odpowiada ułamek
    $A/(x - a)$; czynnikowi $(x - a)^k$ — suma $A_1/(x-a) + dots.c + A_k/(x-a)^k$;
    nierozkładalnemu czynnikowi kwadratowemu odpowiada ułamek $(A x + B) \/ ("ten czynnik")$
    (a jego $l$-tej potędze — $l$ ułamków z licznikami liniowymi). Uwzględniając
    krotności, otrzymujemy
    $
      f(x) = (A x + B) / (x^2 + 4 x + 29)
             + C/x + D/x^2
             + E/(x - 3) + F/(x - 3)^2 .
    $
    Jest tu $2 + 2 + 2 = 6$ nieznanych współczynników, czyli dokładnie tyle, ile
    wynosi stopień mianownika ($6$) — to potwierdza poprawność rozkładu
    (por. notatka, punkt 4: liczba współczynników = stopień mianownika).
  ])

  #krok("3", [Kształt rozkładu nad $CC$], [
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
  ])
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

#uwaga[
  Dwa błędy zdarzają się tu najczęściej: (1) pominięcie jednego z ułamków dla
  krotności $x^2$ — wtedy liczba współczynników nie zgadza się z $deg Q$;
  (2) zapisanie nad $CC$ ułamka z trójmianem kwadratowym w mianowniku — nad $CC$
  trójmian zawsze się rozkłada, więc taki składnik jest niepoprawny. Warto
  pamiętać, że nad $CC$ mamy tyle samo współczynników co nad $RR$ ($6$):
  dwa „zespolone” $A_1, A_2$ zastępują dwa rzeczywiste $A, B$.
]
