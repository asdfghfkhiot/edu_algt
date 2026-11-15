// ============================================================
//  NOTATKA TEORETYCZNA do zadania 4
//  Wielomiany, rozkład nad $RR$ i nad $CC$, ułamki proste
// ============================================================

#import "lib.typ": *

#notatka[Wielomiany, rozkład na czynniki i ułamki proste]

Zadanie 4 polega na zapisaniu funkcji wymiernej w postaci sumy ułamków prostych
*bez wyznaczania współczynników*. Aby to zrobić poprawnie, trzeba wiedzieć:
jak rozkłada się wielomian nad $RR$, a jak nad $CC$, dlaczego te rozkłady się
różnią i jak z postaci rozkładu mianownika odczytać *kształt* rozkładu na ułamki
proste. Te trzy rzeczy omawiamy poniżej.

// ------------------------------------------------------------
#podtem[1. Wielomiany i dzielenie z resztą]

#defn[
  *Wielomianem* stopnia $n$ nad ciałem $K$ (tu: $K = RR$ lub $K = CC$)
  nazywamy funkcję
  $ W(x) = a_n x^n + a_(n-1) x^(n-1) + dots.c + a_1 x + a_0, quad a_n != 0, thin a_i in K . $
  Stopień oznaczamy $deg W = n$. Wielomian zerowy nie ma stopnia (lub ma
  stopień $-infinity$, co bywa wygodne w rachunkach).
]

#tw(nazwa: "dzielenie z resztą")[
  Dla wielomianów $A, B$, $B != 0$, istnieją jednoznacznie wyznaczone wielomiany
  $Q$ (iloraz) i $R$ (reszta), dla których
  $ A = Q dot B + R, quad "przy czym" quad deg R < deg B quad "(lub " R = 0")" . $
]

#wniosek[
  *Funkcja wymierna* $f = A/B$ jest *właściwa*, gdy $deg A < deg B$. Każdą funkcję
  wymierną można zapisać jako sumę wielomianu i funkcji właściwej:
  $ A/B = Q + R/B, quad deg R < deg B . $
  W rozkładzie na ułamki proste *tylko część właściwa* daje ułamki proste;
  część wielomianowa $Q$ zostaje jako składnik osobny. W zadaniu 4 mamy
  $deg(x^3 + 1) = 3 < 6 = deg$ mianownika, więc funkcja jest właściwa
  i części wielomianowej nie ma.
]

// ------------------------------------------------------------
#podtem[2. Zasadnicze twierdzenie algebry i rozkład nad $CC$]

#tw(nazwa: "zasadnicze twierdzenie algebry")[
  Każdy wielomian $W$ stopnia $n >= 1$ o współczynnikach zespolonych ma
  co najmniej jeden pierwiastek zespolony. W konsekwencji rozkłada się
  jednoznacznie (z dokładnością do kolejności i stałej) na czynniki liniowe:
  $ W(x) = a_n (x - z_1)^(k_1) (x - z_2)^(k_2) dots.c (x - z_m)^(k_m), quad
    sum_(i=1)^m k_i = n , $
  gdzie $z_i$ są pierwiastkami zespolonymi, a $k_i$ — ich krotnościami.
]

#wniosek[
  *Nad ciałem $CC$ nie ma wielomianów nierozkładalnych stopnia $>= 2$.*
  Wszystkie czynniki nierozkładalne są liniowe. Dlatego rozkład na ułamki proste
  nad $CC$ zawiera *wyłącznie* mianowniki postaci $(x - z)^k$ — nie ma tam
  „ułamków z trójmianem kwadratowym”.
]

#wniosek[
  *Czynnik nierozkładalny nad $RR$ ma stopień $1$ lub $2$.* Istotnie, jeśli
  $W$ ma współczynniki rzeczywiste i $z_0$ jest jego pierwiastkiem, to
  $overline(z_0)$ też jest pierwiastkiem (sprzężenie jest automorfizmem $CC$
  nad $RR$), i to tej samej krotności. Parze pierwiastków sprzężonych
  $alpha plus.minus beta j$ odpowiada w $RR[x]$ czynnik
  $ (x - alpha - beta j)(x - alpha + beta j) = (x - alpha)^2 + beta^2 , $
  czyli trójmian kwadratowy o wyróżniku $Delta = -4 beta^2 < 0$.
]

#przyklad[
  Dla $x^2 + 4x + 29$ mamy $Delta = 16 - 116 = -100 < 0$, więc wielomian jest
  nierozkładalny nad $RR$. Po dopełnieniu do kwadratu:
  $x^2 + 4x + 29 = (x+2)^2 + 25$, a pierwiastki zespolone to $-2 plus.minus 5j$.
  Nad $CC$: $x^2 + 4x + 29 = (x + 2 - 5j)(x + 2 + 5j)$.
]

// ------------------------------------------------------------
#podtem[3. Twierdzenie o rozkładzie na ułamki proste]

#defn[
  *Ułamkami prostymi* nad ciałem $K$ nazywamy funkcje wymierne postaci
  $ A/(x - a)^k quad "oraz" quad (A x + B)/((x - alpha)^2 + beta^2)^k , $
  gdzie $A, B, a, alpha, beta in RR$, $k in NN$, $beta != 0$ (druga postać tylko
  nad $RR$; nad $CC$ występuje wyłącznie pierwsza).
]

#tw(nazwa: "rozkład na ułamki proste")[
  Niech $f = P/Q$ będzie funkcją wymierną właściwą, a $Q$ — wielomianem
  unormowanym rozłożonym na czynniki nierozkładalne nad $K$:
  $ Q(x) = (x - a_1)^(k_1) dots.c (x - a_r)^(k_r) dot
           ((x - alpha_1)^2 + beta_1^2)^(l_1) dots.c ((x - alpha_s)^2 + beta_s^2)^(l_s) . $
  Wtedy $f$ można *jednoznacznie* przedstawić w postaci sumy
  $ f(x) = sum_(i=1)^r sum_(p=1)^(k_i) A_(i p)/((x - a_i)^p)
         + sum_(j=1)^s sum_(q=1)^(l_j) (B_(j q) x + C_(j q))/(((x - alpha_j)^2 + beta_j^2)^q) . $
  Liczba nieznanych współczynników jest równa $deg Q$.
]

#dowod[szkic.] {
  Dowód opiera się na dwóch faktach. Po pierwsze, dla względnie pierwszych
  wielomianów $Q_1, Q_2$ istnieją $U, V$ takie, że $U Q_1 + V Q_2 = 1$
  (rozszerzony algorytm Euklidesa — odpowiednik twierdzenia Bézouta), co pozwala
  rozłożyć $P/(Q_1 Q_2)$ na sumę $P_1/Q_1 + P_2/Q_2$. Po drugie, dla potęgi
  czynnika nierozkładalnego $Q_0^k$ można kolejno „odejmować” składniki
  z coraz niższymi potęgami $Q_0$ w mianowniku; proces kończy się po skończonej
  liczbie kroków, bo stopień reszty maleje. Jednoznaczność wynika z liniowej
  niezależności ułamków prostych nad $K$.
}

#uwaga[
  Twierdzenie mówi, że *kształt* rozkładu jest z góry znany: dla czynnika
  $(x - a)^k$ piszemy $k$ ułamków z mianownikami $(x-a), (x-a)^2, dots, (x-a)^k$;
  dla czynnika $((x - alpha)^2 + beta^2)^l$ — $l$ ułamków z licznikami
  liniowymi. W zadaniu 4 nie wyznaczamy współczynników, więc wystarczy
  zastosować właśnie ten przepis.
]

// ------------------------------------------------------------
#podtem[4. Kontrola poprawności: liczba współczynników]

Prostym, a skutecznym testem jest porównanie liczby nieznanych współczynników
ze stopniem mianownika. Jeśli się nie zgadzają, w rozkładzie brakuje składnika
albo jest ich o jeden za dużo.

#tw(nazwa: "test liczby współczynników")[
  W rozkładzie funkcji właściwej $P/Q$ (z $Q$ unormowanym) liczba nieznanych
  współczynników jest równa $deg Q$. Równoważnie: suma krotności wszystkich
  czynników nierozkładalnych (liczona z wagą $2$ dla czynników kwadratowych)
  jest równa $deg Q$.
]

#przyklad[
  Dla $Q(x) = (x^2 + 4x + 29)(x^2 - 3x)^2$ mamy $deg Q = 2 + 4 = 6$; czynniki to
  jeden trójmian nierozkładalny (waga $2$) oraz $x^2 (x-3)^2$, czyli cztery
  czynniki liniowe z krotnościami. Rozkład nad $RR$ ma więc
  $2 + 2 + 2 = 6$ współczynników: dwa w liczniku trójmianu i po dwa
  w $x^2$ oraz $(x-3)^2$ z $x$ i $(x-3)$.
]

// ------------------------------------------------------------
#podtem[5. Metody wyznaczania współczynników (dla porządku)]

Zadanie 4 tego nie wymaga, ale warto znać trzy standardowe metody — przydają się
w kolejnych kolokwiach i na egzaminie.

#list(
  [*Metoda „przez podstawianie pierwiastków”.* Po pomnożeniu przez $Q$ obie
   strony są wielomianami; podstawiając $x = a_i$ (pierwiastek mianownika)
   natychmiast wyznaczamy część współczynników.],
  [*Metoda porównywania współczynników.* Przyrównujemy współczynniki przy
   kolejnych potęgach $x$ po obu stronach i rozwiązujemy układ liniowy
   (kwadratowy o rozmiarze $deg Q$).],
  [*Metoda granic i pochodnych.* Dla czynnika $(x-a)^k$ współczynnik przy
   najwyższej potędze otrzymujemy z granicy $lim_(x -> a) (x-a)^k f(x)$;
   kolejne — z pochodnych. Wygodna, gdy krotność jest duża.],
)

// ------------------------------------------------------------
#podtem[6. Liczby zespolone w rozkładzie — dlaczego współczynniki są sprzężone]

#tw(nazwa: "sprzężenie współczynników")[
  Jeśli $f$ ma współczynniki rzeczywiste, a $x^2 + p x + q$ jest nierozkładalny
  nad $RR$ z pierwiastkami $z_0, overline(z_0)$, to w rozkładzie nad $CC$
  $ f(x) = A/(x - z_0) + overline(A)/(x - overline(z_0)) + dots.c , $
  przy czym współczynniki przy ułamkach odpowiadających sprzężonym pierwiastkom
  są sprzężone.
]

#dowod[
  Funkcja $x |-> f(x)$ przyjmuje wartości rzeczywiste dla rzeczywistych $x$, więc
  jej rozkład nad $CC$ jest niezmienniczy przy sprzężeniu współczynników.
  Sprzężenie zamienia ułamek $1/(x - z_0)$ na $1/(x - overline(z_0))$, więc
  sprzężenie całej sumy daje sumę z $overline(A_i)$ przy sprzężonych mianownikach.
  Z jednoznaczności rozkładu wynika $A_2 = overline(A_1)$.
]

#uwaga[
  To wyjaśnia, dlaczego nad $RR$ dwa ułamki „sklejają się” w jeden:
  $ A/(x - z_0) + overline(A)/(x - overline(z_0))
    = ((A + overline(A)) x - (A overline(z_0) + overline(A) z_0))/(x^2 + p x + q) , $
  a licznik jest rzeczywisty i liniowy — dokładnie postaci $(B x + C)$. Zatem
  rozkład nad $RR$ jest „zespolonym rozkładem z posklejanymi parami”.
]

#wzory[
  *Zestawienie do zadania 4:*
  $ deg(A/B) "właściwa" <=> deg A < deg B, quad
    Q(x) = a_n product (x - z_i)^(k_i) " nad " CC, $
  $ (x - alpha - beta j)(x - alpha + beta j) = (x - alpha)^2 + beta^2 " nad " RR, $
  $ (x - a)^k arrow.r A_1/(x-a) + dots.c + A_k/(x-a)^k, quad
    ((x - alpha)^2 + beta^2)^l arrow.r sum_(q=1)^l (B_q x + C_q)/(((x-alpha)^2 + beta^2)^q) . $
]
