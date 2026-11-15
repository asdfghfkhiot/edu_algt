// ============================================================
//  NOTATKA TEORETYCZNA do zadań 1--3
//  Liczby zespolone: postaci, argument, potęgowanie, pierwiastki
// ============================================================

#import "lib.typ": *

#notatka[Liczby zespolone: od postaci kanonicznej do pierwiastków]

Zadania 1--3 to trzy różne spojrzenia na tę samą strukturę: ciało liczb
zespolonych $CC$. W zadaniu 1 mnożymy liczby w postaci wykładniczej, w zadaniu 2
opisujemy zbiór warunkami na moduł i argument, a w zadaniu 3 rozwiązujemy
równanie $w^n = z$. Poniżej zebrane są definicje, twierdzenia i techniki,
z których korzystają wszystkie trzy rozwiązania.

// ------------------------------------------------------------
#podtem[1. Ciało liczb zespolonych]

#defn[
  Zbiorem liczb zespolonych nazywamy $CC = { a + b j : a, b in RR }$, gdzie $j$
  jest *jednostką urojoną*, $j^2 = -1$. Liczbę $a$ nazywamy *częścią rzeczywistą*
  ($a = upright("Re") z$), a $b$ — *częścią urojoną* ($b = upright("Im") z$).
  Postać $a + b j$ nazywamy *kanoniczną* (algebraiczną).
]

Dodawanie i mnożenie są określone wzorami
$ (a + b j) + (c + d j) = (a + c) + (b + d) j, quad
  (a + b j)(c + d j) = (a c - b d) + (a d + b c) j , $
a dzielenie — przez pomnożenie licznika i mianownika przez sprzężenie:
$ (a + b j)/(c + d j) = ((a + b j)(c - d j))/(c^2 + d^2) . $

#defn[
  *Sprzężeniem* liczby $z = a + b j$ nazywamy $overline(z) = a - b j$.
  Zachodzą wzory:
  $ z dot overline(z) = |z|^2, quad
    upright("Re") z = (z + overline(z))/2, quad
    upright("Im") z = (z - overline(z))/(2 j) . $
]

#uwaga[
  W notacji wykładowej używa się $j$ (nie $i$), aby nie mylić jednostki urojonej
  z natężeniem prądu — to standard w elektrotechnice i w wielu podręcznikach
  algebry. Formalnie $j$ i $i$ oznaczają to samo; w tym dokumencie konsekwentnie
  piszemy $j$.
]

// ------------------------------------------------------------
#podtem[2. Postać trygonometryczna, wykładnicza, moduł, argument]

#defn(nazwa: "postać trygonometryczna i wykładnicza", [
  Dla $z = a + b j != 0$ oznaczamy $r = |z| = sqrt(a^2 + b^2) > 0$ oraz
  $phi = arg z$ — kąt spełniający $cos phi = a/r$, $sin phi = b/r$. Wtedy
  $ z = r(cos phi + j sin phi) = r e^(j phi) . $
])

#defn(nazwa: "argument główny", [
  Każda liczba $z != 0$ ma nieskończenie wiele argumentów, różniących się
  o całkowite wielokrotności $2 pi$. *Argumentem głównym* nazywamy ten
  z przedziału $(-pi, pi]$ i oznaczamy $arg z$ (bez indeksu). Zatem
  $ upright("Arg") z = arg z + 2 k pi$, $k in ZZ$.
])

#tw(nazwa: "własności modułu i argumentu")[
  Dla $z, w in CC$, $z, w != 0$, zachodzą wzory:
  $ |z w| = |z| dot |w|, quad |z/w| = |z|/|w|, quad
    arg(z w) = arg z + arg w mod 2 pi, $
  $ |z + w| <= |z| + |w| quad "(nierówność trójkąta)", quad
    |overline(z)| = |z|, quad z dot overline(z) = |z|^2 . $
]

#dowod[
  Postać wykładnicza natychmiast daje własności multiplikatywne:
  $z w = r_1 r_2 e^(j(phi_1 + phi_2))$, więc moduły się mnożą, a argumenty
  dodają. Nierówność trójkąta wynika geometrycznie z tego, że $z + w$ jest
  przekątną równoległoboku o bokach $|z|$ i $|w|$; algebraicznie — z nierówności
  Cauchy'ego–Schwarza.
]

#uwaga[
  Równość $arg(z w) = arg z + arg w$ *nie* jest równością w sensie ścisłym,
  gdyż $arg in (-pi, pi]$. Trzeba ją rozumieć „modulo $2 pi$”: jeśli suma
  wypadnie poza $(-pi, pi]$, odejmujemy (lub dodajemy) $2 pi$. W zadaniu 1
  suma $-pi/3 + 5pi/4 = 11pi/12$ mieści się w przedziale, więc korekta nie jest
  potrzebna — ale trzeba to *sprawdzić*, a nie założyć.
]

#tw(nazwa: "wzór de Moivre'a")[
  Dla $n in NN$ i $phi in RR$:
  $ (cos phi + j sin phi)^n = cos(n phi) + j sin(n phi), quad
    "(równoważnie)" quad (e^(j phi))^n = e^(j n phi) . $
]

#dowod[
  Indukcja ze wzoru na mnożenie: dla $n = 1$ wzór jest oczywisty; jeśli
  zachodzi dla $n$, to dla $n+1$ mamy $e^(j n phi) e^(j phi) = e^(j(n+1)phi)$
  na mocy wzoru na iloczyn. Wzór zachowuje się też dla $n in ZZ$ i dla
  pierwiastków wymiernych, ale tam trzeba uważać na wieloznaczność argumentu.
]

#przyklad[
  $(1 + j)^8$: mamy $1 + j = sqrt(2) e^(j pi/4)$, więc
  $(1+j)^8 = (sqrt 2)^8 e^(j 2 pi) = 16$. Bez postaci wykładniczej trzeba by
  mnożyć cztery razy — dlatego warto zawsze przechodzić na postać wykładniczą.
]

// ------------------------------------------------------------
#podtem[3. Pierwiastki $n$-tego stopnia]

#tw(nazwa: "pierwiastki zespolone")[
  Niech $w = |w| e^(j theta) != 0$ i $n in NN$. Równanie $z^n = w$ ma dokładnie
  $n$ różnych rozwiązań zespolonych, danych wzorem
  $ z_k = root(n, |w|) thin e^(j (theta + 2 k pi)/n), quad k = 0, 1, dots, n - 1 . $
  Wszystkie mają ten sam moduł $root(n, |w|)$ i argumenty różniące się o $2pi/n$;
  tworzą więc wierzchołki $n$-kąta foremnego o środku w $0$.
]

#dowod[
  Niech $z = r e^(j alpha)$. Równanie $z^n = w$ przyjmuje postać
  $r^n e^(j n alpha) = |w| e^(j theta)$, co daje $r^n = |w|$ (bo moduły są
  nieujemne) oraz $n alpha = theta + 2 k pi$ dla pewnego $k in ZZ$. Stąd
  $r = root(n, |w|)$ i $alpha = (theta + 2k pi)/n$. Różne wartości kątów
  otrzymujemy dla $k = 0, 1, dots, n-1$; dalsze $k$ powtarzają ten sam zbiór
  punktów, bo $alpha$ różni się wtedy o wielokrotność $2 pi$.
]

#wniosek[
  Pierwiastki $n$-tego stopnia z $w$ leżą na okręgu o środku $0$ i promieniu
  $root(n, |w|)$ i są *równo rozłożone* co kąt $2pi/n$. Po przesunięciu
  $z |-> z + z_0$ (jak w zadaniu 3, gdzie $u = z + 2j$) cała konfiguracja
  przesuwa się o wektor $z_0$: okrąg ma środek $z_0$, a pierwiastki nadal tworzą
  $n$-kąt foremny.
]

#uwaga[
  $arg w$ wybieramy dowolnie — wynikowy zbiór pierwiastków nie zależy od wyboru
  argumentu, bo zmiana $theta$ o $2 pi$ tylko przemianowuje indeksy $k$.
  W praktyce wybieramy argument główny, żeby rachunki były najprostsze.
]

// ------------------------------------------------------------
#podtem[4. Zbiory na płaszczyźnie zespolonej: warunki na moduł i argument]

#list(
  [$|z - z_0| = r$ — okrąg o środku $z_0$ i promieniu $r$;],
  [$|z - z_0| <= r$ — *koło* domknięte (z brzegiem); $|z - z_0| < r$ — koło otwarte;],
  [$arg(z - z_0) = alpha$ — półprosta o początku $z_0$ i kierunku $alpha$
   (z wyłączeniem samego $z_0$, bo $arg 0$ nie istnieje);],
  [$alpha < arg(z - z_0) <= beta$ — *wycinek kątowy* o wierzchołku $z_0$;
   nierówność ostra wycina półprostą $alpha$ z brzegu, słaba zostawia $beta$;],
  [$|z - z_1| = |z - z_2|$ — symetralna odcinka $z_1 z_2$;],
  [$upright("Re") z > 0$ — prawa półpłaszczyzna; $upright("Im") z <= 0$ —
   dolna półpłaszczyzna domknięta.],
)

#uwaga[
  Dwie rzeczy najczęściej kosztują punkty w zadaniach tego typu:
  (1) *zapomnienie o przesunięciu* — warunek dotyczy $z - z_0$, a nie $z$;
  (2) *nierozstrzygnięcie brzegów* — trzeba słownie powiedzieć, które promienie
  i łuki należą do zbioru; sam rysunek nie wystarcza. Osobno trzeba też
  rozstrzygnąć, czy środek $z_0$ należy (nie należy, bo $arg 0$ nie istnieje,
  o ile warunek nie jest „$|z - z_0| = 0$”).
]

#wzory[
  *Zestawienie do zadań 1--3:*
  $ |z w| = |z||w|, quad z/|z| = e^(j arg z), quad
    z^n = |z|^n e^(j n arg z), $
  $ root(n, z) = { root(n, |z|) e^(j (arg z + 2k pi)/n) : k = 0, dots, n-1 } , $
  $ (a + b j)(c + d j) = (a c - b d) + (a d + b c) j, quad j^2 = -1 . $
]
