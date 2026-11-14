// ============================================================
//  ZADANIE 5 -- rodziny zbiorów, suma i przekrój uogólniony
// ============================================================

#import "lib.typ": *

#let notatka(tytul) = block(above: 1.35em, below: 0.45em, width: 100%)[
  #text(size: 8.3pt, weight: "bold", tracking: 0.1em, fill: accent2)[NOTATKA TEORETYCZNA]
  #v(-0.15em)
  #text(size: 11.2pt, weight: "bold")[#tytul]
  #v(-0.55em)
  #line(length: 100%, stroke: 0.5pt + rgb("#d8c3b0"))
]

#let podtem(tytul) = block(above: 0.95em, below: 0.3em)[
  #text(size: 10.1pt, weight: "bold", fill: ink)[#tytul]
]

#let defn(body) = block(
  width: 100%, inset: (left: 9pt, right: 6pt, top: 2pt, bottom: 2pt),
  stroke: (left: 1.6pt + rgb("#7b8fa3")), above: 0.7em, below: 0.8em,
)[#text(size: 9.6pt)[#body]]

// ------------------------------------------------------------
#zadanie("5", "[3 p.]", [
  Dana jest rodzina trójkątów (wypełnionych) $(nabla_t)_(t in RR_+)$ o wierzchołkach
  $A = (0, 0)$, $B_t = (1, t)$, $C_t = (-1, t)$. Narysować zbiory
  $union.big_(t in RR_+) nabla_t$ oraz $inter.big_(t in NN) nabla_t$.
])

// ------------------------------------------------------------
#notatka[Rodziny zbiorów; suma i przekrój uogólniony]

#podtem[1. Rodzina indeksowana]

#defn[
  *Definicja.* Niech $T$ będzie niepustym zbiorem, zwanym zbiorem indeksów.
  Jeśli każdemu elementowi $t in T$ przyporządkowany jest dokładnie jeden zbiór
  $A_t$, to mówimy, że dana jest *rodzina zbiorów* $(A_t)_(t in T)$ indeksowana
  zbiorem $T$ (mówimy też: rodzina ${A_t : t in T}$).
]

Rodzina indeksowana różni się od zwykłego zbioru zbiorów tym, że każdy element
jest *otagowany* indeksem — ten sam zbiór może wystąpić w rodzinie wielokrotnie
(np. $A_1 = A_2 = [0,1]$), a w zbiorze ${A_1, A_2} = {[0,1]}$ już nie.
W zastosowaniach wygodnie jest myśleć o rodzinie jak o funkcji $T arrow.r cal(P)(X)$,
$t |-> A_t$.

#podtem[2. Suma i przekrój uogólniony]

#defn[
  *Definicja (suma).* $union.big_(t in T) A_t := { x : exists t in T, thin x in A_t }$ —
  zbiór tych elementów, które należą *do co najmniej jednego* zbioru rodziny.

  *Definicja (przekrój).* $inter.big_(t in T) A_t := { x : forall t in T, thin x in A_t }$ —
  zbiór tych elementów, które należą *do każdego* zbioru rodziny.
]

Dla $T = {1, 2}$ dostajemy zwykłe działania: $union.big_(t in {1,2}) A_t = A_1 union A_2$
oraz $inter.big_(t in {1,2}) A_t = A_1 inter A_2$. Tak więc suma i przekrój uogólniony
to naturalne rozszerzenie $union$ i $inter$ na dowolną (także nieskończoną) liczbę
zbiorów i mają te same własności algebraowe.

#podtem[3. Podstawowe własności (z uzasadnieniami)]

#list(
  [*(a) Ograniczanie.* Dla każdego $t_0 in T$:
   $inter.big_(t in T) A_t subset.eq A_(t_0) subset.eq union.big_(t in T) A_t.$
   #emph[Dowód.] Jeśli $x in inter A_t$, to $x in A_t$ dla każdego $t$, więc i dla $t_0$.
   Jeśli $x in A_(t_0)$, to $x$ należy do co najmniej jednego zbioru rodziny. $square$],
  [*(b) Monotoniczność.* Jeśli $A_t subset.eq B_t$ dla wszystkich $t in T$, to
   $union.big_t A_t subset.eq union.big_t B_t$ oraz $inter.big_t A_t subset.eq inter.big_t B_t$.
   #emph[Dowód.] Dla każdego $t$ zbiór $A_t$ jest podzbiorem $B_t$, więc element
   należący do któregoś $A_t$ należy też do odpowiedniego $B_t$ (pierwsza inkluzja);
   element należący do wszystkich $B_t$ należy w szczególności do wszystkich $A_t$
   (druga inkluzja). $square$],
  [*(c) Prawa de Morgana.* Dla $X$ — przestrzeni, w której leżą wszystkie $A_t$:
   $ (union.big_(t in T) A_t)^c = inter.big_(t in T) A_t^c, quad
     (inter.big_(t in T) A_t)^c = union.big_(t in T) A_t^c . $
   #emph[Dowód (pierwsza równość).]  $x in (union A_t)^c <=> not (exists t: x in A_t)
   <=> forall t: not (x in A_t) <=> forall t: x in A_t^c <=> x in inter A_t^c$.
   Druga równość analogicznie. $square$],
  [*(d) Prawa rozdzielcze.* Dla dowolnego zbioru $B$:
   $ B inter union.big_t A_t = union.big_t (B inter A_t), quad
     B union inter.big_t A_t = inter.big_t (B union A_t) . $
   #emph[Dowód.] $x in B inter union A_t <=> x in B and exists t: x in A_t
   <=> exists t: (x in B and x in A_t) <=> x in union (B inter A_t)$. $square$],
  [*(e) Rodzina próżna.* Umawiamy się, że
   $union.big_(t in emptyset) A_t = emptyset$ oraz $inter.big_(t in emptyset) A_t = X$
   (przekrój po pustym zbiorze indeksów jest całą przestrzenią — własność ta jest
   wygodna, ale bywa zaskakująca). W naszym zadaniu $T != emptyset$, więc nie
   korzystamy z tego umownego przypadku.],
  [*(f) Rozszerzanie zbioru indeksów.* Jeśli $T_0 subset.eq T$, to
   $union.big_(t in T_0) A_t subset.eq union.big_(t in T) A_t$ oraz
   $inter.big_(t in T) A_t subset.eq inter.big_(t in T_0) A_t$. Dodanie indeksów
   może tylko *powiększyć* sumę i *zmniejszyć* przekrój.],
)

#podtem[4. Rodziny monotoniczne: jak liczyć sumę i przekrój bez rachunku]

Najczęściej w zadaniach rodzina jest *monotoniczna*, a wtedy odpowiedź daje się
odczytać geometrycznie.

#list(
  [Rodzina *rosnąca*: $A_s subset.eq A_t$ dla $s <= t$. Jeśli w rodzinie istnieje
   zbiór „największy” $A_(t^*)$ (taki, że $A_t subset.eq A_(t^*)$ dla wszystkich
   $t in T$), to $union.big_(t in T) A_t = A_(t^*)$. Przekroju na ogół *nie* można
   utożsamić z żadnym z $A_t$: to zbiór punktów należących do wszystkich zbiorów
   rodziny, czyli „granica od dołu”.],
  [Rodzina *malejąca*: $A_s supset.eq A_t$ dla $s <= t$. Jeśli istnieje zbiór
   „najmniejszy” $A_(t^*)$, to $inter.big_(t in T) A_t = A_(t^*)$; suma natomiast
   może być istotnie większa od każdego $A_t$ (jest „granicą od góry”).],
  [*Przykład.* Dla $A_t = [0, 1 - 1/t]$, $t in NN$, rodzina jest rosnąca i
   $union.big_(t in NN) A_t = [0, 1)$, ale $inter.big_(t in NN) A_t = {0}$ —
   przekrój jest więc istotnie mniejszy od *każdego* zbioru rodziny. Analogicznie
   dla $B_t = (0, 1\/t]$, $t in NN$, mamy $inter.big_(t in NN) B_t = emptyset$
   (żaden punkt nie należy do wszystkich $B_t$ jednocześnie).],
  [*Uwaga o nieskończoności.* Jeżeli żaden zbiór rodziny nie jest największy
   (najmniejszy), to sumy (przekroju) *nie wolno* utożsamiać z żadnym z $A_t$ —
   trzeba napisać warunek „istnieje $t$” („dla wszystkich $t$”) i rozwiązać go
   jak zwykłą nierówność. Dokładnie ta sytuacja występuje w naszym zadaniu:
   dla rodziny $(nabla_t)$ suma po $t in RR_+$ nie jest żadnym pojedynczym
   trójkątem, a przekrój po $t in NN$ nie jest żadnym $nabla_t$.],
)

#podtem[5. Zbiory na płaszczyźnie: jak je opisywać i rysować]

#list(
  [Zbiór na płaszczyźnie najwygodniej opisać *nierównościami* — wtedy suma
   i przekrój sprowadzają się do kwantyfikatorów na nierównościach.
   Wypełniony trójkąt o wierzchołkach $A = (0,0)$, $B = (1,t)$, $C = (-1,t)$ to
   $
     nabla_t = { (x,y) in RR^2 : |x| <= 1, thin t |x| <= y <= t } .
   $
   _Uzasadnienie._ Górna krawędź to odcinek #box[$y = t$] dla #box[$|x| <= 1$];
   dolne krawędzie to #box[$y = t |x|$] (proste $A B$ i $A C$). Dla każdego
   $x in #box[$[-1,1]$]$ pionowy przekrój trójkąta jest odcinkiem #box[$[t|x|, thin t]$].],
  [Na rysunku rozróżniamy *brzeg należący* do zbioru (linia ciągła) i *brzeg nie
   należący* (linia przerywana), a punkty wyłączone oznaczamy pustym kółkiem.
   Zbiór może mieć też *punkty izolowane* — pojedyncze punkty, które nie mają
   otoczenia zawartego w zbiorze (tak będzie z punktem $A$ w sumie z zadania).],
  [Nierówność #box[$y > 0$] opisuje *półpłaszczyznę otwartą* (bez prostej $y = 0$),
   a #box[$y >= 0$] — półpłaszczyznę domkniętą. Podobnie: #box[$|x| <= 1$] to pas
   domknięty, a #box[$|x| < 1$] — pas otwarty. Zbiór #box[$[-1,1] times (0, infinity)$]
   jest więc pasem *bez* dolnej krawędzi, ale *z* pionowymi bokami #box[$x = plus.minus 1$].],
)

// ------------------------------------------------------------
#rozwiazanie[
  #text(weight: "bold", fill: accent)[Krok 1. Opis trójkąta nierównościami.]
  Zgodnie z notatką (punkt 5):
  $
    nabla_t = { (x,y) in RR^2 : |x| <= 1, thin t |x| <= y <= t } .
  $
  Rodzina jest *rosnąca*: dla $0 < s <= t$ mamy $nabla_s subset.eq nabla_t$, bo warunki
  $s|x| <= y <= s$ pociągają $t|x| <= y <= t$ (wszystkie nierówności są jednorodne
  względem $t$). Rysunek poniżej pokazuje kilka trójkątów rodziny.

  #align(center)[
    #box(width: 11.6cm, height: 7.4cm, {
      import "lib.typ": cplot, kropka, etykieta
      cplot(
        w: 11.6cm, h: 7.4cm, unit: 1.35cm, ox: 5.8cm, oy: 6.55cm,
        xlab: $x$, ylab: $y$,
        body: (X, Y, P) => {
          for (t, col) in ((3.6, rgb("#e4edf6")), (2.6, rgb("#ccdcee")), (1.7, rgb("#b3cbe4")), (0.8, rgb("#9bbcd9"))) {
            place(path(closed: true, fill: col, stroke: (paint: accent, thickness: 0.7pt),
              (X(0), Y(0)), (X(1), Y(t)), (X(-1), Y(t))))
          }
          // wierzchołki
          kropka(X, Y, 0, 0, r: 0.06cm)
          etykieta(X, Y, 0, 0, dx: -0.58cm, dy: 0.14cm)[$A$]
          etykieta(X, Y, 1, 3.6, dx: 0.12cm, dy: -0.34cm)[$B_t$]
          etykieta(X, Y, -1, 3.6, dx: -0.86cm, dy: -0.34cm)[$C_t$]
          // etykieta rodziny
          place(dx: X(-0.50), dy: Y(1.95), text(size: 8.4pt)[$nabla_t$])
          // podzialka
          place(dx: X(1) - 0.10cm, dy: Y(0) + 0.09cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$1$])
          place(dx: X(-1) - 0.20cm, dy: Y(0) + 0.09cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-1$])
          // adnotacja o wzroscie t
          place(dx: X(1.30), dy: Y(1.0), text(size: 7.4pt, fill: rgb("#6b7c8d"))[$t$ rośnie])
          place(path(stroke: (paint: rgb("#8fa3b6"), thickness: 0.8pt, dash: "dashed"),
            (X(1.16), Y(0.30)), (X(1.16), Y(3.30))))
          place(polygon((X(1.18) - 0.06cm, Y(3.4) + 0.14cm), (X(1.18), Y(3.4)),
            (X(1.18) + 0.06cm, Y(3.4) + 0.14cm), fill: rgb("#8fa3b6")))
        },
      )
    })
  ]
  #v(-0.25em)
  #podpis[Rodzina $(nabla_t)_(t in RR_+)$: trójkąty są włożone jeden w drugi
    (rodzina rosnąca), wspólny wierzchołek $A = (0,0)$, podstawa $B_t C_t$ przesuwa
    się w górę wraz ze wzrostem $t$.]

  #text(weight: "bold", fill: accent)[Krok 2. Suma $union.big_(t in RR_+) nabla_t$.]
  Punkt $(x,y)$ należy do sumy wtedy i tylko wtedy, gdy
  $
    exists t > 0: quad |x| <= 1 quad and quad t |x| <= y <= t .
  $
  #list(
    [Jeśli $|x| < 1$ i $y > 0$, to warunki $t|x| <= y$ i $y <= t$ znaczą
     $t in [y, thin y/|x|]$. Ponieważ $|x| < 1$, mamy $y <= y/|x|$, więc przedział
     ten jest niepusty (np. $t = y/|x|$ jest dobrym wyborem: $t|x| = y <= y <= t$).
     Cały pas $(-1,1) times (0, infinity)$ leży zatem w sumie.],
    [Jeśli $|x| = 1$ i $y > 0$: wystarczy $t := y$, wtedy $t|x| = y <= y <= t$. Punkty
     $(plus.minus 1, y)$, $y > 0$, należą więc do sumy (są to wierzchołki $B_t$, $C_t$
     trójkątów).],
    [Jeśli $y = 0$: warunek $t|x| <= 0$ wymusza $x = 0$. Jedyny punkt o rzędnej $0$,
     który należy do sumy, to $A = (0,0)$ — i rzeczywiście $A in nabla_t$ dla każdego $t$.],
    [Jeśli $y < 0$: sprzeczność z $y >= t|x| >= 0$. Żaden punkt poniżej osi $O x$ nie należy.],
  )
  Ostatecznie
  $
    union.big_(t in RR_+) nabla_t = ([-1, 1] times (0, infinity)) union {(0,0)} .
  $
  Jest to *pas domknięty* (z pionowymi bokami) rozciągający się w górę nieograniczenie,
  z *dziurą* wzdłuż dolnej krawędzi poza punktem $A$; punkt $A$ jest punktem izolowanym
  w sumie, ale należy do niej, bo jest wierzchołkiem każdego trójkąta.

  #text(weight: "bold", fill: accent)[Krok 3. Przekrój $inter.big_(t in NN) nabla_t$.]
  Punkt $(x,y)$ należy do przekroju, gdy należy do *każdego* $nabla_t$, $t in NN = {1,2,3,...}$:
  $
    forall t in NN: quad |x| <= 1 quad and quad t |x| <= y <= t .
  $
  #list(
    [Z nierówności $t|x| <= y$, prawdziwej dla wszystkich $t in NN$, wynika
     $|x| <= y/t$ dla każdego $t$; przy $t -> infinity$ dostajemy $|x| = 0$, czyli $x = 0$.],
    [Z nierówności $y <= t$, prawdziwej dla wszystkich $t in NN$, dla $t = 1$ dostajemy
     $y <= 1$.],
    [Z $t|x| <= y$ dla $x = 0$ dostajemy $0 <= y$, czyli $y >= 0$.],
    [I odwrotnie: każdy punkt $(0,y)$ z $0 <= y <= 1$ spełnia oba warunki dla wszystkich
     $t in NN$ (bo $t dot 0 = 0 <= y$ oraz $y <= 1 <= t$).],
  )
  Ostatecznie
  $
    inter.big_(t in NN) nabla_t = {0} times [0,1] ,
  $
  czyli *domknięty pionowy odcinek* o końcach $(0,0)$ i $(0,1)$ — leży on w każdym
  trójkącie rodziny. Zauważmy, że przekrój nie jest żadnym ze zbiorów rodziny:
  jest istotnie mniejszy nawet od najmniejszego z nich, $nabla_1$ (trójkąta).

  #grid(
    columns: (1fr, 1fr),
    column-gutter: 0.6cm,
    [
      #align(center)[
        #box(width: 7.6cm, height: 5.55cm, {
          import "lib.typ": cplot, kropka, kolko, etykieta
          cplot(
            w: 7.6cm, h: 5.55cm, unit: 1.22cm, ox: 3.8cm, oy: 4.72cm,
            xlab: $x$, ylab: $y$,
            body: (X, Y, P) => {
              let ytop = 4.15
              // pas [-1,1] x (0, ytop) -- z dziurą na dolnej krawędzi
              place(path(closed: true, fill: figur.transparentize(86%), stroke: none,
                (X(-1), Y(0.06)), (X(-1), Y(ytop)), (X(1), Y(ytop)), (X(1), Y(0.06))))
              // pionowe boki (należą)
              place(path(stroke: accent + 1.1pt, (X(-1), Y(0)), (X(-1), Y(ytop))))
              place(path(stroke: accent + 1.1pt, (X(1), Y(0)), (X(1), Y(ytop))))
              // punkt izolowany A
              kropka(X, Y, 0, 0, r: 0.08cm)
              place(dx: X(0) + 0.09cm, dy: Y(0) + 0.22cm, text(size: 8.4pt)[$A$])
              // konce bokow -- punkty wylaczone
              kolko(X, Y, -1, 0)
              kolko(X, Y, 1, 0)
              // strzalka "w gore" (zbior nieograniczony) po prawej stronie pasa
              place(path(stroke: (paint: accent, thickness: 0.8pt),
                (X(1.42), Y(1.4)), (X(1.42), Y(ytop - 0.35))))
              place(polygon((X(1.42) - 0.055cm, Y(ytop - 0.5)), (X(1.42), Y(ytop - 0.28)),
                (X(1.42) + 0.055cm, Y(ytop - 0.5)), fill: accent))
              place(dx: X(1.42) + 0.13cm, dy: Y(ytop - 0.72), text(size: 8pt, fill: accent)[$infinity$])
              place(dx: X(1) - 0.10cm, dy: Y(0) + 0.18cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$1$])
              place(dx: X(-1) - 0.20cm, dy: Y(0) + 0.18cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-1$])
            },
          )
        })
      ]
      #v(-0.2em)
      #podpis[Suma $union.big_(t in RR_+) nabla_t = [-1,1] times (0, infinity) union {(0,0)}$]
    ],
    [
      #align(center)[
        #box(width: 7.6cm, height: 5.55cm, {
          import "lib.typ": cplot, kropka, etykieta
          cplot(
            w: 7.6cm, h: 5.55cm, unit: 1.22cm, ox: 3.8cm, oy: 4.72cm,
            xlab: $x$, ylab: $y$,
            body: (X, Y, P) => {
              // podklad: trojkat nabl_1
              place(path(closed: true, fill: rgb("#e6eef6"),
                stroke: (paint: rgb("#9fb6cb"), thickness: 0.7pt, dash: "dashed"),
                (X(0), Y(0)), (X(1), Y(1)), (X(-1), Y(1))))
              // odcinek {0} x [0,1]
              place(path(stroke: accent + 2.2pt, (X(0), Y(0)), (X(0), Y(1))))
              kropka(X, Y, 0, 0, r: 0.075cm)
              kropka(X, Y, 0, 1, r: 0.075cm)
              etykieta(X, Y, 0, 0, dx: -0.55cm, dy: 0.10cm)[$(0,0)$]
              etykieta(X, Y, 0, 1, dx: 0.16cm, dy: -0.26cm)[$(0,1)$]
              place(dx: X(1) + 0.10cm, dy: Y(1) - 0.20cm, text(size: 7.4pt, fill: rgb("#6b7c8d"))[$nabla_1$])
              place(dx: X(1) - 0.10cm, dy: Y(0) + 0.18cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$1$])
              place(dx: X(-1) - 0.20cm, dy: Y(0) + 0.18cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-1$])
            },
          )
        })
      ]
      #v(-0.2em)
      #podpis[Przekrój $inter.big_(t in NN) nabla_t = {0} times [0,1]$ (na tle $nabla_1$)]
    ],
  )
]

#odpowiedz_zwarta[
  #text(weight: "bold")[Suma:]
  #box[$union.big_(t in RR_+) nabla_t = ([-1,1] times (0, infinity)) union {(0,0)}$]
  — domknięty pas nieograniczony ku górze (z pionowymi bokami) wraz z izolowanym
  punktem $A = (0,0)$; dolna krawędź poza $A$ nie należy do zbioru.
  #h(0.4em)
  #text(weight: "bold")[Przekrój:]
  #box[$inter.big_(t in NN) nabla_t = {0} times [0,1]$]
  — domknięty pionowy odcinek o końcach $(0,0)$ i $(0,1)$.
]

#uwaga[
  Trzy rzeczy, na których łatwo stracić punkty: (1) w sumie trzeba *osobno* rozważyć
  punkty o $y = 0$ — dolna krawędź nie należy do sumy, poza punktem $A$;
  (2) w przekroju nie wolno „brać $t -> infinity$” bez uzasadnienia — należy
  powołać się na to, że $|x| <= y/t$ dla *wszystkich* $t in NN$, więc $x = 0$;
  (3) $t in RR_+$ oznacza tu wszystkie $t > 0$ (rodzina ciągła), natomiast $t in NN$
  to rodzina przeliczalna — odpowiedzi są istotnie różne i nie można ich mieszać.
]
