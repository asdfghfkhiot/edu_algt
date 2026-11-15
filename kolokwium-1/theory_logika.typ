// ============================================================
//  NOTATKA TEORETYCZNA do zadania 6
//  Funktory zdaniowe, kwantyfikatory, implikacja, zaprzeczanie
// ============================================================

#import "lib.typ": *

#notatka[Funktory zdaniowe, kwantyfikatory i implikacja]

Zadanie 6 jest krótkie, ale dotyka najczęstszego źródła błędów w całym kursie:
mylenia *implikacji* z *koniunkcją*, *zaprzeczenia implikacji* z implikacją
z zaprzeczoną tezą oraz *zasięgu* kwantyfikatora. Poniższa notatka porządkuje
te pojęcia od podstaw, ze szczególnym naciskiem na to, jak poprawnie
zaprzeczać zdania z kwantyfikatorami i jak uzasadniać ich prawdziwość.

// ------------------------------------------------------------
#podtem[1. Zdanie, funktor zdaniowy, zmienne związane i wolne]

#defn[
  *Zdaniem* nazywamy wyrażenie, któremu można przypisać jedną z dwóch wartości
  logicznych: prawdę ($1$) lub fałsz ($0$). *Funktorem zdaniowym* (formą zdaniową)
  $phi(x)$ nazywamy wyrażenie z niewiadomą $x$, które staje się zdaniem po
  podstawieniu za $x$ konkretnego elementu z dziedziny $X$; dla każdej wartości
  $x$ ma ono określoną wartość logiczną.
]

#przyklad[
  $phi(x) : quad x^2 < 4$ jest funktorem zdaniowym na $RR$; $phi(1)$ jest zdaniem
  prawdziwym, $phi(3)$ — fałszywym. Natomiast $sin x > x$ jest funktorem
  zdaniowym, a $sin 0 > 0$ — zdaniem (fałszywym). Zapis $sin x > x$ sam nie jest
  zdaniem, dopóki $x$ nie zostanie związane kwantyfikatorem albo nie podstawimy
  konkretnej liczby.
]

#defn[
  *Zbiór prawdziwości* funktora $phi(x)$ na przestrzeni $X$ to
  $ { x in X : phi(x) } $. Dwa funktory są *równoważne*, gdy mają ten sam zbiór
  prawdziwości na $X$; wtedy oznaczamy $phi <=> psi$.
]

#uwaga[
  Kwantyfikator *wiąże* zmienną: w wyrażeniu $forall x in X colon phi(x)$ zmienna
  $x$ jest *związana* i nie można jej „podstawić” z zewnątrz. Zmienna, która nie
  jest związana żadnym kwantyfikatorem, jest *wolna* (jak $x$ w $sin x > x$).
  Mylenie tych pojęć prowadzi do zdań niepoprawnych składniowo, np.
  $exists x (forall x colon phi(x))$ — tu pierwszy kwantyfikator wiąże zmienną,
  która już została związana przez drugi, więc jest zbędny i wprowadza zamęt.
]

// ------------------------------------------------------------
#podtem[2. Kwantyfikator ogólny i egzystencjalny]

#defn(nazwa: "kwantyfikatory", [
  $ forall x in X colon phi(x) $ — „dla każdego $x in X$ zachodzi $phi(x)$”;
  prawdziwe, gdy *każdy* element $X$ spełnia $phi$.
  $ exists x in X colon phi(x) $ — „istnieje $x in X$, dla którego zachodzi
  $phi(x)$”; prawdziwe, gdy *co najmniej jeden* element $X$ spełnia $phi$.
])

Kluczowa asymetria w sposobach uzasadniania:

#list(
  [Aby wykazać $forall x colon phi(x)$, trzeba podać *dowód* dla dowolnego $x$
   (rozmowanie ogólne: „niech $x$ będzie dowolne…”). Nie wystarczy żadna liczba
   przykładów.],
  [Aby *obalić* $forall x colon phi(x)$, wystarczy *jeden kontrprzykład* — jedna
   wartość $x$, dla której $phi$ jest fałszywe.],
  [Aby wykazać $exists x colon phi(x)$, wystarczy podać *jednego świadka*
   (konkretne $x$) i sprawdzić $phi$ dla niego. Nie trzeba szukać „wszystkich”
   ani „najlepszego” przykładu.],
  [Aby *obalić* $exists x colon phi(x)$, trzeba udowodnić $forall x colon not phi(x)$
   — czyli pokazać, że *żaden* $x$ nie spełnia $phi$. Pojedynczy nieudany
   przykład niczego nie dowodzi.],
)

#defn(nazwa: "kwantyfikator a zbiory", [
  Związki z sumą i przekrojem uogólnionym są bezpośrednie:
  $ union.big_(x in X) A_x = { y : exists x in X, thin y in A_x }, quad
    inter.big_(x in X) A_x = { y : forall x in X, thin y in A_x } . $
  To ta sama konstrukcja, którą stosujemy w zadaniu 5 — kwantyfikatory
  i sumy/przekroje uogólnione to dwa języki opisu tego samego zjawiska.
])

// ------------------------------------------------------------
#podtem[3. Prawa rachunku kwantyfikatorów]

#tw(nazwa: "prawa de Morgana dla kwantyfikatorów")[
  Dla dowolnego funktora $phi(x)$ na przestrzeni $X$:
  $ not (forall x in X colon phi(x)) quad <=> quad exists x in X colon not phi(x), $
  $ not (exists x in X colon phi(x)) quad <=> quad forall x in X colon not phi(x). $
]

#dowod[
  Pierwsza równoważność. Lewa strona mówi: „nie jest tak, że wszystkie elementy
  spełniają $phi$” — czyli istnieje co najmniej jeden element, który $phi$ nie
  spełnia. To dokładnie prawa strona. Formalnie, gdyby prawa strona była
  fałszywa, to $forall x colon not not phi(x)$, czyli $forall x colon phi(x)$,
  wbrew lewej stronie. Druga równoważność analogicznie: „nie istnieje element
  spełniający $phi$” znaczy tyle, co „każdy element $phi$ nie spełnia”.
]

Wniosek praktyczny: *zaprzeczając zdaniu z kwantyfikatorem, zmieniamy rodzaj
kwantyfikatora (odwracamy go) i negujemy funktor*. Kwantyfikator jest jak
„duże działanie”: przy przechodzeniu przez negację zamienia się na przeciwny,
tak jak $union$ i $inter$ w prawach de Morgana dla zbiorów.

#tw(nazwa: "rozdzielność kwantyfikatorów i spójników")[
  Zachodzą następujące równoważności (przy założeniu, że $psi$ nie zawiera $x$):
  $ forall x (phi(x) and psi) <=> (forall x phi(x)) and psi, quad
    exists x (phi(x) or psi) <=> (exists x phi(x)) or psi, $
  $ forall x (phi(x) and psi(x)) <=> (forall x phi(x)) and (forall x psi(x)), $
  $ exists x (phi(x) or psi(x)) <=> (exists x phi(x)) or (exists x psi(x)). $
  Natomiast *nie* są na ogół prawdziwe:
  $ forall x (phi(x) or psi(x)) <=> (forall x phi(x)) or (forall x psi(x)), $
  $ exists x (phi(x) and psi(x)) <=> (exists x phi(x)) and (exists x psi(x)). $
]

#dowod[
  Dla pierwszej „złej” równoważności kontrprzykład: $X = NN$, $phi(x)$:
  „$x$ jest parzyste”, $psi(x)$: „$x$ jest nieparzyste”. Wtedy lewa strona jest
  prawdziwa (każda liczba naturalna jest parzysta lub nieparzysta), a prawa
  fałszywa (nie wszystkie są parzyste i nie wszystkie nieparzyste).
  Dla drugiej: $phi(x)$: „$x > 0$”, $psi(x)$: „$x < 0$” na $RR$ — prawa strona
  jest prawdziwa (istnieje liczba dodatnia i istnieje ujemna), a lewa fałszywa
  (nie istnieje liczba jednocześnie dodatnia i ujemna).
]

#tw(nazwa: "zmiana kolejności kwantyfikatorów")[
  Zawsze zachodzi implikacja
  $ exists y forall x colon phi(x,y) quad ==> quad forall x exists y colon phi(x,y), $
  ale implikacja odwrotna *nie* jest prawdziwa.
]

#dowod[
  Jeśli istnieje $y_0$ takie, że $phi(x, y_0)$ dla wszystkich $x$, to dla każdego
  $x$ wystarczy wziąć $y := y_0$, by dostać $phi(x,y)$. W drugą stronę:
  $forall x exists y colon y > x$ jest prawdziwe na $RR$ (dla każdego $x$
  istnieje większe $y$), ale $exists y forall x colon y > x$ jest fałszywe
  (nie ma liczby większej od wszystkich liczb).
]

#uwaga[
  Kolejność kwantyfikatorów ma znaczenie *praktyczne*: w zadaniu 5 pytanie
  o sumę to „istnieje $t$” (kwantyfikator egzystencjalny, po którym łatwo
  wskazać świadka), a pytanie o przekrój to „dla wszystkich $t$” (kwantyfikator
  ogólny, wymagający dowodu). Suma bywa więc łatwiejsza, a przekrój — trudniejszy.
]

// ------------------------------------------------------------
#podtem[4. Spójniki: tabela prawdy i prawa]

#align(center)[
  #table(
    columns: 6, align: center, stroke: 0.5pt + rgb("#9fb2c4"),
    inset: (x: 9pt, y: 3.2pt),
    table.header([$p$], [$q$], [$p and q$], [$p or q$], [$p ==> q$], [$p <=> q$]),
    [0], [0], [0], [0], [1], [1],
    [1], [0], [0], [1], [0], [0],
    [0], [1], [0], [1], [1], [0],
    [1], [1], [1], [1], [1], [1],
  )
]

#tw(nazwa: "prawa rachunku zdań")[
  Dla dowolnych zdań $p, q, r$:
  $ p ==> q <=> not p or q, quad
    p ==> q <=> not q ==> not p quad "(kontrapozycja)", $
  $ not (p and q) <=> not p or not q, quad
    not (p or q) <=> not p and not q quad "(de Morgan)", $
  $ p <=> q <=> (p ==> q) and (q ==> p) . $
]

#dowod[
  Każdą równoważność sprawdza się bezpośrednio tabelą prawdy (osiem wierszy dla
  trzech zmiennych). Np. dla kontrapozycji: gdy $p ==> q$ jest prawdziwe, to
  nie może zajść $q = 0$ i $p = 1$, więc nie może też zajść
  $not q = 1$ i $not p = 0$, czyli $not q ==> not p$ jest prawdziwe.
]

// ------------------------------------------------------------
#podtem[5. Implikacja — znaczenie, prawda pusta, błędy]

Implikacja $p ==> q$ („jeśli $p$, to $q$”; $p$ — poprzednik, $q$ — następnik)
jest *jedynym* spójnikiem, którego tabela prawdy bywa zaskakująca. Jest
fałszywa *wyłącznie* w jednym przypadku: gdy $p$ jest prawdziwe, a $q$ fałszywe.

#defn(nazwa: "zbiór prawdziwości implikacji", [
  Dla funktorów $p(x)$, $q(x)$ na przestrzeni $X$:
  $ { x in X : p(x) ==> q(x) } = X without { x in X : p(x) and not q(x) } . $
  Zbiór fałszywości implikacji to więc $P without Q$, gdzie $P$ i $Q$ są zbiorami
  prawdziwości poprzednika i następnika.
])

To „rachunkowe” ujęcie jest bardzo wygodne w zadaniach: zamiast rozumować
słownie, wyznaczamy $P$ i $Q$, a następnie $P without Q$. Jeśli $P without Q$
jest pusty, implikacja jest prawdziwa dla wszystkich $x$; jeśli nie jest pusty,
to jego elementy są kontrprzykładami.

#podpodtem[Trzy sposoby rozumienia implikacji]

#list(
  [*Warunkowe („gwarancja”).* $p ==> q$ znaczy: „jeśli tylko zajdzie $p$, to
   na pewno zajdzie $q$”. Nie mówi nic o sytuacjach, gdy $p$ nie zachodzi.
   Dlatego implikacja z fałszywym poprzednikiem jest prawdziwa — nie ma
   sytuacji, w której zostałaby złamana. Mówimy, że jest spełniona *pusto*
   (vacuously true).],
  [*Zbiorowe („zawieranie”).* $p ==> q$ to tyle, co $P subset.eq Q$: zbiór
   spełniający poprzednik zawiera się w zbiorze spełniającym następnik.
   Ta interpretacja natychmiast wyjaśnia, dlaczego $p$ fałszywe nic nie psuje:
   zbiór pusty zawiera się w każdym zbiorze.],
  [*Klauzulowe („alternatywa”).* $p ==> q <=> not p or q$ — implikacja to
   alternatywa „albo poprzednik nie zachodzi, albo następnik zachodzi”. W tej
   postaci wygodnie się ją zaprzecza: $not (not p or q) <=> p and not q$.],
)

#uwaga[
  Na wykładzie z algebry implikacja pojawia się w sformułowaniach twierdzeń
  („jeśli $A$ jest odwracalna, to $det A != 0$”). Zawsze trzeba pamiętać, że
  *twierdzenie odwrotne* ($det A != 0 ==> A$ odwracalna) wymaga osobnego dowodu,
  a *kontrapozycja* ($det A = 0 ==> A$ nieodwracalna) jest równoważna twierdzeniu
  wyjściowemu i często łatwiejsza do udowodnienia.
]

#podpodtem[Najczęstsze błędy z implikacją]

#list(
  [*Zaprzeczanie implikacji przez zaprzeczenie tezy:*
   $not(p ==> q) <=> p and not q$, a *nie* $p ==> not q$ ani $not p ==> not q$.
   Przykład: zaprzeczeniem „jeśli $x$ jest podzielne przez $4$, to jest parzyste”
   jest „istnieje $x$ podzielne przez $4$, które nie jest parzyste” — a nie
   „jeśli $x$ nie jest podzielne przez $4$, to jest nieparzyste”.],
  [*Odwracanie implikacji:* $p ==> q$ i $q ==> p$ to różne zdania.],
  [*Traktowanie implikacji jak równoważności:* $p ==> q$ nie mówi, że $q$
   pociąga $p$; z $q$ nie wynika $p$.],
  [*Szukanie świadka „z tezą”.* W zdaniu $exists x (p(x) ==> q(x))$ najłatwiejszym
   świadkiem jest zwykle $x$ z fałszywym $p(x)$ — i to jest w pełni poprawne
   rozwiązanie, nie „wybieg”.],
)

// ------------------------------------------------------------
#podtem[6. Zasięg kwantyfikatora — najważniejsza pułapka tego zadania]

#defn[
  *Zasięgiem* kwantyfikatora nazywamy tę część formuły, do której kwantyfikator
  się odnosi. W zapisie $exists x in X (phi(x) ==> psi(x))$ kwantyfikator obejmuje
  *całą implikację*, a nie tylko poprzednik. Nawiasy są tu istotne: zapis
  $(exists x in X thin phi(x)) ==> psi(x)$ znaczy coś zupełnie innego (i przy
  wolnym $x$ w $psi$ w ogóle nie jest poprawny).
]

Zestawmy trzy podobnie wyglądające zdania i ich wartości na $RR$:

#align(center)[
  #table(
    columns: (auto, 1fr, auto),
    align: (left, left, center),
    stroke: 0.5pt + rgb("#9fb2c4"),
    inset: (x: 8pt, y: 4pt),
    table.header([Zapis], [Czytamy], [Wartość]),
    [$exists x (p(x) ==> q(x))$], [istnieje $x$, dla którego zachodzi *implikacja*],
      [na ogół prawdziwe],
    [$(exists x thin p(x)) ==> q(x)$], [„istnieje $x$ z $p(x)$” pociąga $q(x)$],
      [zależy od $q$],
    [$forall x (p(x) ==> q(x))$], [dla każdego $x$, jeśli $p(x)$, to $q(x)$],
      [na ogół fałszywe],
  )
]

#tw(nazwa: [o prawdziwości $exists x (p(x) ==> q(x))$])[
  Zdanie $exists x in X (p(x) ==> q(x))$ jest *fałszywe* wtedy i tylko wtedy, gdy
  $forall x in X (p(x) and not q(x))$; jest więc fałszywe tylko wtedy, gdy
  poprzednik jest prawdziwy dla *każdego* $x$, a następnik fałszywy dla każdego
  $x$. W szczególności: jeśli zbiór prawdziwości poprzednika jest pusty
  (poprzednik nigdy nie zachodzi), to zdanie jest *prawdziwe*.
]

#dowod[
  $ not exists x (p(x) ==> q(x)) <=> forall x not (p(x) ==> q(x))
    <=> forall x (p(x) and not q(x)) . $
  Jeśli zbiór $P$ jest pusty, to koniunkcja $p(x) and not q(x)$ jest fałszywa dla
  każdego $x$, więc jej zaprzeczenie — a z nim wyjściowe zdanie — jest prawdziwe.
]

#wniosek[
  Zdania typu $exists x (p(x) ==> q(x))$ są „łatwe do uznania za fałszywe”,
  a w rzeczywistości *prawie zawsze prawdziwe* — wystarczy jeden $x$,
  dla którego poprzednik jest fałszywy. To dokładnie sytuacja z zadania 6.
]

// ------------------------------------------------------------
#podtem[7. Jak uzasadniać prawdziwość i fałszywość zdań z kwantyfikatorami]

#enum[
  [*Ustal dziedzinę i zasięg kwantyfikatora.* Sprawdź, czy kwantyfikator obejmuje
   całą formułę, czy tylko jej fragment, i jaka jest dziedzina ($RR$, $NN$,
   przedział).],
  [*Zapisz warunki jako nierówności i wyznacz zbiory prawdziwości.*
   Np. dla $p(x)$: „$sin x > x$” i $q(x)$: „$x > 7$” wyznacz $P$ i $Q$; to
   zamienia logikę na rachunek.],
  [*Dla $exists$: wskaż świadka.* Wybierz możliwie najprostszy $x$ (często $0$,
   $1$, $-1$ lub liczbę z fałszywym poprzednikiem) i *sprawdź rachunkiem*, że
   forma zdaniowa jest dla niego prawdziwa.],
  [*Dla $forall$: przeprowadź rozumowanie ogólne* („niech $x$ będzie dowolne”)
   albo podaj kontrprzykład, jeśli zdanie jest fałszywe.],
  [*Zaprzeczaj systematycznie.* Najpierw prawo de Morgana dla kwantyfikatorów,
   potem zaprzeczenie implikacji, potem zaprzeczenia nierówności; na końcu
   usuń wszystkie symbole negacji, zamieniając $not (a > b)$ na $a <= b$ itd.],
  [*Sprawdź poprawność zaprzeczenia.* Zdanie i jego zaprzeczenie muszą mieć
   *przeciwne* wartości logiczne — jeśli oba wydają się prawdziwe lub oba
   fałszywe, w rachunku jest błąd.],
]

#wzory[
  *Zestawienie praw użytych w zadaniu 6:*
  $ not (exists x colon phi) <=> forall x colon not phi, quad
    not (forall x colon phi) <=> exists x colon not phi, $
  $ not (p ==> q) <=> p and not q, quad
    p ==> q <=> not q ==> not p, $
  $ not (sin x > x) <=> sin x <= x, quad not (x > 7) <=> x <= 7 . $
]
