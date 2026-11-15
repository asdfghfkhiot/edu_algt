// ============================================================
//  NOTATKA TEORETYCZNA do zadania 5
//  Rodziny zbiorów, suma i przekrój uogólniony, granice ciągów zbiorów
// ============================================================

#import "lib.typ": *

#notatka[Rodziny zbiorów, suma i przekrój uogólniony]

W zadaniu 5 trzeba opisać dwa zbiory: sumę i przekrój *nieskończonej* rodziny
trójkątów. Aby zrobić to bez błędów, trzeba jasno rozumieć trzy rzeczy:
czym jest rodzina indeksowana (a czym nie jest), jak definiuje się sumę
i przekrój uogólniony oraz jak „zachowują się” one przy przejściu do
nieskończoności. Temu poświęcone są kolejne punkty notatki.

// ------------------------------------------------------------
#podtem[1. Zbiór indeksów i rodzina indeksowana]

#defn[
  Niech $T$ będzie niepustym zbiorem, zwanym *zbiorem indeksów*. Jeżeli każdemu
  elementowi $t in T$ przyporządkowano dokładnie jeden zbiór $A_t$, to mówimy, że
  dana jest *rodzina zbiorów* $(A_t)_(t in T)$ indeksowana zbiorem $T$. Formalnie
  jest to funkcja
  $ T arrow.r cal(P)(X), quad t |-> A_t , $
  gdzie $cal(P)(X)$ oznacza rodzinę wszystkich podzbiorów przestrzeni $X$
  (zbiór potęgowy).
]

Trzeba odróżnić rodzinę od zwykłego zbioru zbiorów:

#list(
  [W rodzinie każdy zbiór jest *otagowany* indeksem. Jeżeli $A_1 = A_2 = [0,1]$,
   to rodzina $(A_t)_(t in {1,2})$ ma *dwa* elementy — różne jako pozycje
   indeksowane — podczas gdy zbiór ${A_1, A_2} = {[0,1]}$ ma jeden element.
   W zadaniach rachunkowych ta różnica bywa nieistotna, ale w definicjach jest
   zasadnicza: np. $(A_t)$ może być rodziną stałą, $A_t = RR$ dla wszystkich $t$.],
  [Rodzina może być zadana *wzorem* ($A_t = [0, t)$), *przepisem geometrycznym*
   ($nabla_t$ — wypełniony trójkąt o danych wierzchołkach) albo *rekurencyjnie*.
   W każdym przypadku dla każdego konkretnego $t$ zbiór $A_t$ jest zwykłym
   zbiorem, do którego stosują się wszystkie zwykłe pojęcia: suma, przekrój,
   dopełnienie, brzeg, wnętrze, domknięcie.],
  [Zbiór indeksów może być skończony ($T = {1, 2, 3}$), przeliczalny
   ($T = NN$, $T = ZZ$) lub nieprzeliczalny ($T = RR$, $T = RR_+$, $T = [0,1]$).
   W zadaniu 5 występują *oba* rodzaje nieskończoności: $t in RR_+$ (continuum)
   oraz $t in NN$ (zbiór przeliczalny) — i to nie jest kosmetyczna różnica,
   bo daje różne odpowiedzi.],
)

#przyklad[
  Dla $A_n = [0, 1\/n]$, $n in NN$, mamy $A_1 = [0,1]$, $A_2 = [0, 1/2]$,
  $A_3 = [0, 1/3]$, $dots$ — rodzina malejąca, w której każdy zbiór jest
  przedziałem domkniętym, ale „granica” $inter.big_n A_n = {0}$ jest
  zbiorem jednoelementowym, a nie przedziałem o dodatniej długości.
  Żaden ze zbiorów rodziny nie jest równy przekrojowi.
]

// ------------------------------------------------------------
#podtem[2. Suma i przekrój uogólniony]

#defn(nazwa: "suma", [
  $ union.big_(t in T) A_t := { x in X : exists t in T quad x in A_t } . $
  Należą tu dokładnie te elementy, które należą *do co najmniej jednego* zbioru
  rodziny.
])

#defn(nazwa: "przekrój", [
  $ inter.big_(t in T) A_t := { x in X : forall t in T quad x in A_t } . $
  Należą tu dokładnie te elementy, które należą *do każdego* zbioru rodziny
  (równoważnie: do wszystkich zbiorów jednocześnie).
])

Oba pojęcia są zdefiniowane za pomocą kwantyfikatorów, a nie za pomocą skończonej
listy działań — właśnie dlatego stosują się do dowolnej, także nieprzeliczalnej,
rodziny. Dla $T = {1, 2}$ dostajemy zwykłe działania
$union.big_(t in {1,2}) A_t = A_1 union A_2$ i
$inter.big_(t in {1,2}) A_t = A_1 inter A_2$,
więc suma i przekrój uogólniony są naturalnym rozszerzeniem znanych działań
i dziedziczą ich własności algebraiczne.

#podpodtem[Przykłady, na których widać istotę nieskończoności]

#list(
  [$union.big_(t in (0, infinity)) (0, t) = (0, infinity)$, ale
   $inter.big_(t in (0, infinity)) (0, t) = emptyset$ — żadna liczba
   dodatnia nie jest mniejsza od *wszystkich* $t > 0$.],
  [$union.big_(t > 0) [0, t] = [0, infinity)$, zaś
   $inter.big_(t > 0) [0, t] = {0}$: zero jest jedynym elementem
   wspólnym wszystkim przedziałom, bo dla każdego $t > 0$ mamy $0 in [0,t]$.],
  [$union.big_(n in NN) [1\/n, 1] = (0, 1]$ — jedynka należy (dla $n = 1$),
   a $0$ nie należy, bo $0 < 1\/n$ dla każdego $n$; mimo to $0$ jest
   „granicą” lewych końców. To klasyczny przykład zbioru, który jest sumą
   przedziałów domkniętych, a sam nie jest domknięty.],
  [$inter.big_(n in NN) (0, 1\/n) = emptyset$ — dla każdego $x > 0$
   istnieje $n$ z $1\/n < x$, więc $x$ wypada z któregoś zbioru rodziny.
   Zauważ, że zamiana nawiasów na domknięte daje inny wynik:
   $inter.big_(n in NN) [0, 1\/n] = {0}$.],
)

#wniosek[
  Przy przejściu od skończonej do nieskończonej rodziny *domkniętość* i
  *otwartość* nie „dziedziczą się” automatycznie: suma nieskończenie wielu
  zbiorów domkniętych nie musi być domknięta, a przekrój nieskończenie wielu
  zbiorów otwartych nie musi być otwarty. Dlatego w zadaniach z nieskończoną
  rodziną trzeba *udowodnić* przynależność każdego brzegu osobno, a nie
  „przepisać” ją z rysunku.
]

// ------------------------------------------------------------
#podtem[3. Własności algebraiczne i ich dowody]

#tw(nazwa: "ograniczanie")[
  Dla dowolnego $t_0 in T$:
  $ inter.big_(t in T) A_t subset.eq A_(t_0) subset.eq union.big_(t in T) A_t . $
]

#dowod[
  Jeśli $x in inter.big_t A_t$, to z definicji $x in A_t$ dla *każdego*
  $t in T$, więc w szczególności $x in A_(t_0)$. Jeśli zaś $x in A_(t_0)$, to
  istnieje $t in T$ (mianowicie $t_0$) takie, że $x in A_t$, czyli
  $x in union.big_t A_t$. Obie inkluzje są ostre na ogół — patrz przykład
  z $A_n = [0, 1\/n]$: przekrój ${0}$ jest istotnie mniejszy od $A_1 = [0,1]$,
  a suma $[0,1]$ jest istotnie większa od przekroju.
]

#tw(nazwa: "monotoniczność")[
  Jeśli $A_t subset.eq B_t$ dla wszystkich $t in T$, to
  $ union.big_(t in T) A_t subset.eq union.big_(t in T) B_t quad "oraz" quad
    inter.big_(t in T) A_t subset.eq inter.big_(t in T) B_t . $
]

#dowod[
  Niech $x in union.big_t A_t$. Wtedy $x in A_(t_1)$ dla pewnego $t_1$, a ponieważ
  $A_(t_1) subset.eq B_(t_1)$, mamy $x in B_(t_1) subset.eq union.big_t B_t$.
  Podobnie, jeśli $x in inter.big_t A_t$, to $x in A_t$ dla każdego $t$,
  więc $x in B_t$ dla każdego $t$, czyli $x in inter.big_t B_t$.
]

#tw(nazwa: "prawa de Morgana")[
  Niech wszystkie $A_t$ będą podzbiorami ustalonej przestrzeni $X$. Wtedy
  $ (union.big_(t in T) A_t)^c = inter.big_(t in T) A_t^c, quad
    (inter.big_(t in T) A_t)^c = union.big_(t in T) A_t^c . $
]

#dowod[
  Dla pierwszej równości:
  $ x in (union.big_t A_t)^c
      <=> not (exists t in T: x in A_t)
      <=> forall t in T: not (x in A_t)
      <=> forall t in T: x in A_t^c
      <=> x in inter.big_t A_t^c . $
  Druga równość dowodzi się analogicznie, korzystając z
  $not (forall t: x in A_t) <=> exists t: not (x in A_t)$ (zaprzeczanie
  kwantyfikatorom omawiamy szczegółowo w nocie do zadania 6).
]

#tw(nazwa: "prawa rozdzielcze")[
  Dla dowolnego zbioru $B subset.eq X$:
  $ B inter union.big_(t in T) A_t = union.big_(t in T) (B inter A_t),
    quad
    B union inter.big_(t in T) A_t = inter.big_(t in T) (B union A_t) . $
]

#dowod[
  $ x in B inter union.big_t A_t
      <=> x in B and exists t: x in A_t
      <=> exists t: (x in B and x in A_t)
      <=> x in union.big_t (B inter A_t) . $
  W trzecim kroku korzystamy z tego, że warunek $x in B$ nie zależy od $t$,
  więc można go wciągnąć pod kwantyfikator. Druga równość — analogicznie,
  z $or$ w miejsce $and$.
]

#tw(nazwa: "absorpcja i rozszerzanie zbioru indeksów")[
  Jeśli $T_0 subset.eq T$, to
  $ union.big_(t in T_0) A_t subset.eq union.big_(t in T) A_t, quad
    inter.big_(t in T) A_t subset.eq inter.big_(t in T_0) A_t . $
  Ponadto dla dowolnego zbioru $C$:
  $ union.big_t (A_t union C) = (union.big_t A_t) union C, quad
    inter.big_t (A_t inter C) = (inter.big_t A_t) inter C . $
]

#dowod[
  Pierwsza część jest natychmiastowa: warunek „istnieje $t in T_0$” implikuje
  „istnieje $t in T$”, a warunek „dla wszystkich $t in T$” implikuje
  „dla wszystkich $t in T_0$”. Druga część wynika z praw rozdzielczych,
  zastosowanych do zbioru $C$ (przy $B = C$).
]

#uwaga[
  *Dodanie indeksów do zbioru indeksów może tylko powiększyć sumę i tylko
  zmniejszyć przekrój.* Dlatego suma po większym zbiorze indeksów bywa istotnie
  większa — i tak jest w zadaniu 5: suma po $RR_+$ jest istotnie większa niż
  suma po $NN$ (np. punkt $(0.9, 0.1)$ należy do pierwszej, a nie do drugiej).
]

// ------------------------------------------------------------
#podtem[4. Rodzina pusta i umowy graniczne]

#defn[
  Umawiamy się, że
  $ union.big_(t in emptyset) A_t = emptyset, quad
    inter.big_(t in emptyset) A_t = X . $
]

Druga umowa bywa zaskakująca, ale jest jedyną spójną: przekrój to zbiór
elementów spełniających warunek „dla wszystkich $t in emptyset$ zachodzi
$x in A_t$”, a zdanie z kwantyfikatorem ogólnym po zbiorze pustym jest
*prawdziwe* (prawda pusta). Zatem każdy $x in X$ spełnia ten warunek.
Symetrycznie suma po pustym zbiorze indeksów jest pusta, bo zdanie
„istnieje $t in emptyset$” jest fałszywe.

W zadaniu 5 oba zbiory indeksów ($RR_+$ oraz $NN$) są niepuste, więc z tych
umów nie korzystamy — warto jednak wiedzieć, że gdyby ktoś zapisał przekrój
po $t in emptyset$, wynikiem byłaby cała płaszczyzna $RR^2$.

// ------------------------------------------------------------
#podtem[5. Rodziny monotoniczne a „włożenie w siebie”]

Najwięcej błędów w zadaniach z rodzinami bierze się z pomylenia dwóch różnych
sytuacji: *monotoniczności* (zbiory tworzą łańcuch) i *wspólnego punktu*
(zbiory mają niepuste przecięcie). To nie to samo.

#defn[
  Rodzinę $(A_t)_(t in T)$ nazywamy *rosnącą*, gdy $s <= t$ pociąga
  $A_s subset.eq A_t$, oraz *malejącą*, gdy $s <= t$ pociąga
  $A_s supset.eq A_t$. Rodzinę nazywamy *monotoniczną*, gdy jest rosnąca lub malejąca.
]

#tw(nazwa: "suma i przekrój rodziny monotonicznej")[
  Jeśli rodzina jest rosnąca i istnieje $t^*$ taki, że $A_t subset.eq A_(t^*)$
  dla wszystkich $t$, to $union.big_t A_t = A_(t^*)$. Jeśli rodzina jest malejąca
  i istnieje $t_*$ taki, że $A_(t_*) subset.eq A_t$ dla wszystkich $t$, to
  $inter.big_t A_t = A_(t_*)$. *W pozostałych przypadkach* sumy (przekroju)
  nie wolno utożsamiać z żadnym ze zbiorów rodziny.
]

#dowod[
  Dowodzimy pierwszej części. Inkluzja $A_(t^*) subset.eq union.big_t A_t$ wynika
  z ograniczania. W drugą stronę: jeśli $x in A_t$ dla pewnego $t$, to
  $x in A_(t^*)$ na mocy założenia, więc $union.big_t A_t subset.eq A_(t^*)$.
  Dla rodzin malejących rozumowanie jest symetryczne.
]

#podpodtem[Dlaczego „wspólny wierzchołek” nie daje włożenia]

Rozważmy rodzinę z zadania 5: $nabla_t$ to wypełniony trójkąt o wierzchołkach
$(0,0)$, $(1, t)$, $(-1, t)$. Wszystkie trójkąty mają wspólny wierzchołek
$A = (0,0)$, więc *żaden* przekrój nie jest pusty — ale to wcale nie znaczy,
że jeden trójkąt zawiera drugi. Istotnie, dla $0 < s < t$:

#list(
  [punkt $(epsilon, epsilon)$ przy małym $epsilon > 0$ należy do
   $nabla_s$ (bo $s epsilon <= epsilon <= s$ dla $epsilon <= s$),
   ale *nie* należy do $nabla_t$, gdy $t epsilon > epsilon$, czyli gdy
   $t > 1$ — więc $nabla_s subset.eq.not nabla_t$ dla dużych $t$;],
  [punkt $(epsilon, t epsilon)$ przy $epsilon > 0$ i dużym $t$ należy
   do $nabla_t$ (bo $t epsilon <= t epsilon <= t$), ale nie należy do
   $nabla_s$ (bo $s epsilon < t epsilon$) — więc także
   $nabla_t subset.eq.not nabla_s$.],
)

Rodzina $(nabla_t)$ *nie jest więc monotoniczna*: żadne dwa jej różne elementy
nie są w relacji zawierania. Jest to rodzina „wachlarza” obracającego się wokół
wspólnego wierzchołka — intuicja geometryczna podpowiada, że zbiory się
„przecinają”, a nie „zawierają”.

#align(center)[
  #box(width: 9.6cm, height: 5.4cm, {
    import "lib.typ": cplot, kropka
    cplot(
      w: 9.6cm, h: 5.4cm, unit: 1.15cm, ox: 4.8cm, oy: 4.35cm,
      xlab: $x$, ylab: $y$,
      body: (X, Y, P) => {
        place(path(closed: true, fill: rgb("#dfe9f3"), stroke: (paint: rgb("#5d84a8"), thickness: 0.8pt),
          (X(0), Y(0)), (X(1), Y(0.4)), (X(-1), Y(0.4))))
        place(path(closed: true, fill: rgb("#a9c6e0").transparentize(35%), stroke: (paint: rgb("#3a6ea5"), thickness: 0.9pt),
          (X(0), Y(0)), (X(1), Y(2.6)), (X(-1), Y(2.6))))
        kropka(X, Y, 0, 0, r: 0.075cm)
        place(dx: X(0) + 0.10cm, dy: Y(0) + 0.16cm, text(size: 8.2pt)[$A$])
        place(dx: X(1) + 0.10cm, dy: Y(0.4) - 0.30cm, text(size: 8.2pt)[$B_s$])
        place(dx: X(1) + 0.10cm, dy: Y(2.6) - 0.30cm, text(size: 8.2pt)[$B_t$])
        place(dx: X(-0.72), dy: Y(0.75), text(size: 8.2pt)[$nabla_s$])
        place(dx: X(-0.50), dy: Y(2.05), text(size: 8.2pt, fill: rgb("#1e4b74"))[$nabla_t$])
      },
    )
  })
]
#podpis[Żaden z dwóch trójkątów nie zawiera drugiego: mają wspólny wierzchołek $A$,
  ale ich podstawy leżą na różnych wysokościach i boki mają różne nachylenia.
  Rodzina $(nabla_t)$ nie jest monotoniczna.]

#wniosek[
  Z faktu, że $inter.big_t A_t != emptyset$, *nie* wynika nic o zawieraniu.
  I odwrotnie — z zawierania $A_s subset.eq A_t$ nie wynika, że przekrój rodziny
  jest równy $A_s$; przekrój może być istotnie mniejszy (przykład $[0, 1\/n]$).
]

// ------------------------------------------------------------
#podtem[6. Przejście graniczne: ciągi zbiorów, granica dolna i górna]

W zadaniu z rodziną nieskończoną kluczowa jest umiejętność uzasadnienia, że
*żaden dodatkowy* punkt do przekroju nie należy. Najczęściej robi się to przez
„przejście graniczne” $t -> infinity$. Trzeba to robić świadomie — oto narzędzia.

#defn(nazwa: "granica dolna i górna ciągu zbiorów", [
  Dla ciągu zbiorów $(A_n)_(n in NN)$ określamy
  $ liminf_(n -> infinity) A_n := union.big_(n in NN) inter.big_(k >= n) A_k,
    quad
    limsup_(n -> infinity) A_n := inter.big_(n in NN) union.big_(k >= n) A_k . $
  $liminf$ to zbiór elementów, które należą do *prawie wszystkich* $A_n$
  (do wszystkich od pewnego miejsca), a $limsup$ — elementów należących do
  *nieskończenie wielu* $A_n$. Zawsze $liminf subset.eq limsup$; gdy zbiory
  są równe, mówimy o *granicy* ciągu zbiorów.
])

#tw(nazwa: "zstępujący ciąg zbiorów zwartych")[
  Jeżeli $(F_n)$ jest zstępującym ciągiem niepustych zbiorów zwartych
  (w $RR^k$: domkniętych i ograniczonych), to
  $inter.big_(n in NN) F_n != emptyset$.
]

#dowod[
  Wybierzmy $x_n in F_n$ dla każdego $n$. Ciąg $(x_n)$ leży w zwartym $F_1$,
  więc ma podciąg zbieżny $x_(n_j) -> x$. Dla ustalonego $m$ prawie wszystkie
  $x_(n_j)$ leżą w $F_m$ (bo $F_m$ zawiera $F_(n_j)$ dla $n_j >= m$), a $F_m$ jest
  domknięty, więc $x in F_m$. Zatem $x$ należy do wszystkich $F_m$.
]

#uwaga[
  Założenia są istotne. Dla $F_n = [n, infinity)$ (zbiory domknięte, ale
  nieograniczone) przekrój jest pusty. Dla $G_n = (0, 1\/n)$ (zbiory otwarte,
  a więc nie zwarte) również przekrój jest pusty, choć każdy $G_n$ jest niepusty.
  Właśnie dlatego w zadaniu 5 „przejście $t -> infinity$” trzeba uzasadnić
  *nierównością*, a nie powoływaniem się na obrazek.
]

#podpodtem[Przykład rachunkowy: jak działa przejście graniczne]

Niech $A_n = [0, 1 + 1\/n]$. Wtedy $inter.big_n A_n = [0,1]$: inkluzja
$[0,1] subset.eq inter$ jest oczywista, a dla $x > 1$ istnieje $n$
z $1 + 1\/n < x$, więc $x$ wypada. Ten sam schemat stosujemy do przekroju
$nabla_t$: dowodzimy, że jeśli $t|x| <= y$ dla *wszystkich* $t in NN$, to
przy $t -> infinity$ dostajemy $|x| = 0$. Zdanie „dla wszystkich $t$” jest tu
kluczowe — pojedyncze $t$ nic nie ogranicza.

// ------------------------------------------------------------
#podtem[7. Jak opisywać zbiory na płaszczyźnie]

#defn[
  Zbiór $S subset.eq RR^2$ najwygodniej opisać *nierównościami*:
  $ S = { (x,y) in RR^2 : phi(x,y) } , $
  gdzie $phi$ jest koniunkcją (rzadziej alternatywą) nierówności. Wtedy
  przynależność punktu sprawdza się rachunkiem, a suma i przekrój rodziny
  sprowadzają się do kwantyfikatorów na nierównościach z parametrem $t$.
]

Podstawowe „klocki” i ich interpretacja geometryczna:

#list(
  [$|x| <= 1$ — pas pionowy domknięty; $|x| < 1$ — pas otwarty;
   $|y| <= 2$ — pas poziomy;],
  [$y >= t |x|$ — stożek („daszek”) nad osią $O x$ o nachyleniu $t$;
   $y <= t$ — półpłaszczyzna pozioma;],
  [$|x| <= 1 and t|x| <= y <= t$ — wypełniony trójkąt o wierzchołkach
   $(0,0)$, $(1,t)$, $(-1,t)$; dokładnie taki zbiór występuje w zadaniu 5;],
  [zbiór opisany jako ${(x,y) : a(x) <= y <= b(x), thin x in I}$ to
   „pionowa rodzina odcinków” — wygodny sposób rysowania: dla każdego $x$
   rysujemy pionowy odcinek od $y = a(x)$ do $y = b(x)$.],
)

#tw(nazwa: "opis przez przekroje pionowe")[
  Jeżeli $S = {(x,y) : x in I, thin a(x) <= y <= b(x)}$, to
  $S$ jest domknięty wtedy i tylko wtedy, gdy $I$ jest domknięty, a funkcje
  $a$, $b$ są ciągłe i przyjmują wartości rzeczywiste na $I$. Jeżeli któraś
  nierówność jest ostra, odpowiedni fragment brzegu nie należy do $S$.
]

#uwaga[
  Rysunek jest *ilustracją*, nie dowodem. W rozwiązaniu trzeba słownie
  rozstrzygnąć przynależność każdego fragmentu brzegu: pionowych boków,
  górnej podstawy, ukośnych boków i punktów narożnych. Punkty izolowane
  (jeśli występują) trzeba zaznaczyć i uzasadnić, że rzeczywiście należą.
  W zadaniu 5 takim punktem jest $A = (0,0)$ — leży w każdym trójkącie
  rodziny, więc należy do sumy, mimo że sam nie tworzy żadnego „obszaru”.
]

// ------------------------------------------------------------
#podtem[8. Metoda: jak liczyć sumę i przekrój rodziny zadanej geometrycznie]

#enum[
  [*Zapisz $A_t$ nierównościami.* Wtedy „należy do sumy” znaczy
   „istnieje $t$, dla którego wszystkie nierówności zachodzą”, a „należy do
   przekroju” — „dla wszystkich $t$ zachodzą wszystkie nierówności”.],
  [*Rozdziel warunki na te niezależne od $t$* (np. $|x| <= 1$) i te zależne od $t$
   (np. $t|x| <= y <= t$). Warunki niezależne od $t$ wchodzą do wyniku bez zmian
   — w sumie i w przekroju.],
  [*Dla sumy: rozwiąż układ ze względu na istnienie $t$.* Zamiast zgadywać,
   wyznacz zbiór dopuszczalnych $t$: $t|x| <= y <= t$ daje
   $t in [y, y/|x|]$ (dla $x != 0$); pytanie „czy ten przedział jest niepusty
   i przecina $RR_+$?” daje warunek na $(x,y)$.],
  [*Dla przekroju: rozwiąż układ dla wszystkich $t$.* Warunek „dla wszystkich
   $t in NN$” sprowadza się zwykle do wzięcia $t -> infinity$ oraz $t$ minimalnego;
   trzeba to jednak uzasadnić nierównościami, a nie odwołaniem do rysunku.],
  [*Sprawdź przypadki osobne:* $x = 0$ (dzielenie przez $|x|$!), $y = 0$,
   $|x| = 1$ — tam wzory się degenerują i właśnie tam „giną” lub „pojawiają się”
   punkty brzegowe.],
  [*Zapisz wynik jako sumę rozłącznych kawałków* (np. pas plus punkt izolowany)
   i opisz słownie, które fragmenty brzegu należą.],
]

// ------------------------------------------------------------
#podtem[9. Najczęstsze błędy]

#list(
  [*Utożsamianie sumy z największym zbiorem rodziny* mimo braku monotoniczności.
   W zadaniu 5 suma po $RR_+$ jest istotnie większa od każdego $nabla_t$.],
  [*Pomijanie punktów o $y = 0$.* Warunek $t|x| <= y$ przy $y = 0$ wymusza
   $x = 0$; dolna krawędź pasa w ogóle nie należy do sumy poza punktem $A$.],
  [*Dzielenie przez $|x|$ bez rozważenia $x = 0$.* Dla $x = 0$ warunek
   $t|x| <= y$ redukuje się do $0 <= y$ i daje całą pionową półprostą —
   to nie jest „przypadek graniczny” wzoru $t in [y, y/|x|]$.],
  [*Mieszanie $t in RR_+$ z $t in NN$.* Dla $t = 0.5$ trójkąt $nabla_(0.5)$
   sięga tylko do wysokości $0.5$, więc suma po $RR_+$ zawiera punkty, których
   suma po $NN$ nie zawiera.],
  [*Traktowanie brzegu jako „zawsze należącego”.* Ostra nierówność wycina brzeg:
   w przekroju po $NN$ odcinek ${0} times [0,1]$ jest domknięty tylko dlatego,
   że oba warunki okazały się słabe.],
  [*„Dowód przez rysunek”.* Za rysunek nie ma punktów; potrzebne jest
   uzasadnienie, że każdy punkt spełnia warunki (dla sumy: wskazanie $t$;
   dla przekroju: rachunek dla dowolnego $t$).],
)
