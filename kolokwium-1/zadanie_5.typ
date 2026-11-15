// ============================================================
//  ZADANIE 5 -- rozwiązanie: suma i przekrój rodziny trójkątów
// ============================================================

#import "lib.typ": *

// ------------------------------------------------------------
#zadanie("5", "[3 p.]", [
  Dana jest rodzina trójkątów (wypełnionych) $(nabla_t)_(t in RR_+)$ o wierzchołkach
  $A = (0, 0)$, $B_t = (1, t)$, $C_t = (-1, t)$. Narysować zbiory
  $union.big_(t in RR_+) nabla_t$ oraz $inter.big_(t in NN) nabla_t$.
])

#komentarz[
  Zadanie sprawdza jedno: czy umiemy *liczyć* sumę i przekrój nieskończonej
  rodziny zbiorów, a nie tylko „domyślać się” ich z rysunku. Rodzina trójkątów
  jest dobrana przewrotnie: wszystkie trójkąty mają wspólny wierzchołek
  $A = (0,0)$, więc intuicja podpowiada „zbiory się zawierają, będzie trójkąt”.
  Tymczasem *żaden* trójkąt nie zawiera innego, suma jest pasem, a przekroje
  degenerują się do odcinka i do punktu. Poniżej rozwiązanie krok po kroku,
  z uzasadnieniem każdego fragmentu brzegu.
]

#rozwiazanie[
  #krok("1", "Opis trójkąta nierównościami", [
    Zaczynamy od zapisania $nabla_t$ w postaci
    $ nabla_t = { (x,y) in RR^2 : |x| <= 1 quad and quad t |x| <= y <= t } . $
    Uzasadnienie: wierzchołki $A$, $B_t$, $C_t$ leżą na prostych $y = t x$
    (dla $x >= 0$) oraz $y = -t x$ (dla $x <= 0$), czyli na prostych
    $y = t|x|$; podstawą jest odcinek $y = t$ dla $x in [-1, 1]$. Trójkąt to
    część wspólna półpłaszczyzny *nad* „daszkiem” $y = t|x|$ i półpłaszczyzny
    *pod* prostą $y = t$, obcięta pasem $|x| <= 1$. Dla każdego ustalonego
    $x in [-1,1]$ pionowy przekrój trójkąta jest odcinkiem $[t|x|, t]$.

    Wszystkie nierówności są *słabe* i wszystkie zbiory są domknięte, więc
    każdy $nabla_t$ jest zbiorem domkniętym, zwartym i wypukłym (przecięcie
    trzech półpłaszczyzn) — to się przyda przy interpretacji wyników.
  ])

  #krok("2", "Rodzina nie jest monotoniczna", [
    To najważniejsza obserwacja, która odróżnia poprawne rozwiązanie od
    „zgadywania”. Dla $0 < s < t$ mamy jednocześnie:
    #list(
      [punkt $(epsilon, epsilon)$ dla dostatecznie małego $epsilon > 0$
       należy do $nabla_s$, bo $s epsilon <= epsilon <= s$, ale dla $t > 1$
       nie należy do $nabla_t$, bo $t epsilon > epsilon$ — zatem
       $nabla_s subset.eq.not nabla_t$;],
      [punkt $(epsilon, t epsilon)$ dla $epsilon > 0$ należy do
       $nabla_t$, bo $t epsilon <= t epsilon <= t$, ale nie należy do
       $nabla_s$, bo $s epsilon < t epsilon$ — zatem
       $nabla_t subset.eq.not nabla_s$.],
    )
    Rodzina $(nabla_t)$ *nie jest więc ani rosnąca, ani malejąca*: trójkąty
    obracają się wokół wspólnego wierzchołka $A$, nie zawierając się wzajemnie.
    W konsekwencji sumy nie można utożsamić z żadnym $nabla_t$ i trzeba
    faktycznie rozwiązać warunek „istnieje $t$”; tak samo przekroju nie można
    utożsamić z najmniejszym trójkątem.

    #align(center)[
      #box(width: 12cm, height: 8.2cm, {
        import "lib.typ": cplot, kropka, etykieta
        cplot(
          w: 12cm, h: 8.2cm, unit: 1.32cm, ox: 6.0cm, oy: 6.75cm,
          xlab: $x$, ylab: $y$,
          body: (X, Y, P) => {
            // trzy trójkąty rodziny
            for (t, col, op) in ((2.6, rgb("#7fa8cd"), 55%), (1.0, rgb("#a8c6e2"), 30%), (0.6, rgb("#cfe0ef"), 15%)) {
              place(path(closed: true, fill: col.transparentize(op),
                stroke: (paint: rgb("#2c5f8a"), thickness: 0.8pt),
                (X(0), Y(0)), (X(1), Y(t)), (X(-1), Y(t))))
            }
            // punkt należący tylko do nabla_{2.6}
            kropka(X, Y, 0.78, 0.95, r: 0.075cm, c: rgb("#8a4b2c"))
            // punkt należący do wszystkich trzech
            kropka(X, Y, 0.18, 0.30, r: 0.075cm, c: rgb("#2f6b3f"))
            // wierzchołek wspólny
            kropka(X, Y, 0, 0, r: 0.085cm)
            etykieta(X, Y, 0, 0, dx: -0.55cm, dy: 0.16cm)[$A$]
            place(dx: X(1) + 0.10cm, dy: Y(2.6) - 0.30cm, text(size: 8pt)[$B_2.6$])
            place(dx: X(1) + 0.10cm, dy: Y(1.0) - 0.30cm, text(size: 8pt)[$B_1$])
            place(dx: X(1) + 0.10cm, dy: Y(0.6) - 0.30cm, text(size: 8pt)[$B_0.6$])
            place(dx: X(-0.55), dy: Y(2.62), text(size: 8pt, fill: rgb("#1e4b74"))[$nabla_2.6$])
            place(dx: X(-1) - 0.24cm, dy: Y(0) + 0.14cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-1$])
            place(dx: X(1) - 0.10cm, dy: Y(0) + 0.14cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$1$])
          },
        )
      })
    ]
    #v(-0.25em)
    #podpis[Rodzina $(nabla_t)_(t in RR_+)$ nie jest monotoniczna: trójkąty obracają
      się wokół $A$, a żaden nie zawiera innego. Zielony punkt $(0.18, 0.30)$ należy do
      wszystkich trzech narysowanych trójkątów, pomarańczowy $(0.78, 0.95)$ — tylko
      do $nabla_2.6$.]
  ])

  #krok("3", [Suma po $t in RR_+$], [
    Punkt $(x,y)$ należy do sumy wtedy i tylko wtedy, gdy istnieje $t > 0$
    spełniające układ
    $ exists t > 0: quad |x| <= 1 quad and quad t |x| <= y <= t . $
    Warunek $|x| <= 1$ nie zależy od $t$, więc wchodzi do wyniku bez zmian.
    Rozpatrujemy przypadki ze względu na $y$ i $x$:

    #list(
      [*$y < 0$.* Wtedy $t|x| >= 0 > y$, więc nierówność $t|x| <= y$ jest
       sprzeczna dla każdego $t$. Żaden punkt poniżej osi $O x$ nie należy do sumy.],
      [*$y = 0$.* Warunek $t|x| <= 0$ wymusza $|x| = 0$, czyli $x = 0$;
       wtedy $0 <= 0 <= t$ zachodzi dla każdego $t$. Jedynym punktem o rzędnej
       $0$ w sumie jest więc $A = (0,0)$ (i rzeczywiście $A in nabla_t$ dla
       każdego $t$, bo $A$ jest wierzchołkiem każdego trójkąta).],
      [*$y > 0$, $x != 0$.* Układ $t|x| <= y <= t$ jest równoważny
       $t in [y, thin y/|x|]$; przedział ten jest niepusty dokładnie wtedy, gdy
       $|x| <= 1$. Zatem dla każdego punktu pasa $|x| <= 1$, $y > 0$, $x != 0$
       istnieje $t$: wystarczy wziąć $t := y/|x| >= y$ (bo $|x| <= 1$), wtedy
       $t|x| = y$ oraz $y <= t$.],
      [*$y > 0$, $x = 0$.* Wtedy warunek $t dot 0 <= y <= t$ redukuje się do
       $t >= y$; wystarczy $t := y$. Zauważ, że *nie* wolno tu podstawiać
       $x = 0$ do wzoru $t = y/\|x\|$ — to jest miejsce, w którym studenci
       najczęściej tracą punkty.],
    )

    Otrzymujemy więc pełny opis
    $ union.big_(t in RR_+) nabla_t = ([-1, 1] times (0, infinity)) union {(0,0)} . $

    #text(weight: "bold")[Co to za zbiór.] Domknięty pas pionowy o szerokości $2$
    (z *należącymi* bokami $x = plus.minus 1$, $y > 0$), nieograniczony ku górze,
    *bez* dolnej krawędzi, plus pojedynczy punkt $A = (0,0)$. Dolna krawędź
    pasa — cały odcinek $[-1,1] times {0}$ — nie należy do sumy poza punktem $A$.

    #text(weight: "bold")[Punkt $A$ nie jest izolowany.] Warto to podkreślić, bo
    na pierwszy rzut oka $A$ wygląda jak „osamotniony” punkt pod pasem. Tak nie
    jest: dla każdego dostatecznie małego $epsilon > 0$ punkt
    $(epsilon, epsilon)$ leży w $nabla_(epsilon) subset.eq union.big_t nabla_t$
    (bo $epsilon dot epsilon <= epsilon <= epsilon$ dla
    $epsilon <= 1$), a ciąg takich punktów dąży do $A$. Zatem $A$ jest
    *punktem skupienia* sumy — należy do niej, ale nie jest izolowany.

    #text(weight: "bold")[Własności topologiczne (komentarz).] Suma jest
    #emph[niedomknięta]: punkty $(x, 0)$ dla $0 < |x| <= 1$ nie należą do sumy,
    ale są granicami punktów $(x, epsilon) in nabla_(epsilon/|x|)$. Podobnie suma
    nie jest otwarta. Dokładnie
    $ "int" (union.big_t nabla_t) = (-1,1) times (0, infinity), quad
      "cl" (union.big_t nabla_t) = [-1, 1] times [0, infinity) . $
    Jest to doskonała ilustracja wniosku z notatki (punkt 2): suma nieskończenie
    wielu zbiorów domkniętych *nie musi* być domknięta, mimo że każdy $nabla_t$
    jest domknięty, a nawet zwarty.

    #align(center)[
      #box(width: 11.6cm, height: 7.8cm, {
        import "lib.typ": cplot, kropka, kolko, etykieta
        cplot(
          w: 11.6cm, h: 7.8cm, unit: 1.32cm, ox: 5.8cm, oy: 6.85cm,
          xlab: $x$, ylab: $y$,
          body: (X, Y, P) => {
            let ytop = 4.05
            // wypełnienie pasa
            place(path(closed: true, fill: rgb("#3a6ea5").transparentize(87%), stroke: none,
              (X(-1), Y(0)), (X(-1), Y(ytop)), (X(1), Y(ytop)), (X(1), Y(0))))
            // boki pionowe -- należą
            place(path(stroke: rgb("#2c5f8a") + 1.25pt, (X(-1), Y(0)), (X(-1), Y(ytop))))
            place(path(stroke: rgb("#2c5f8a") + 1.25pt, (X(1), Y(0)), (X(1), Y(ytop))))
            // dolna krawędź -- NIE należy (przerywana)
            place(path(stroke: (paint: rgb("#8a4b2c"), thickness: 1.1pt, dash: "dashed"),
              (X(-1), Y(0)), (X(0), Y(0))))
            place(path(stroke: (paint: rgb("#8a4b2c"), thickness: 1.1pt, dash: "dashed"),
              (X(0), Y(0)), (X(1), Y(0))))
            // punkt A
            kropka(X, Y, 0, 0, r: 0.085cm)
            place(dx: X(0) + 0.10cm, dy: Y(0) + 0.20cm, text(size: 8.2pt)[$A = (0,0)$])
            // kółka na końcach dolnej krawędzi
            kolko(X, Y, -1, 0)
            kolko(X, Y, 1, 0)
            // strzałka ku górze
            place(path(stroke: (paint: rgb("#2c5f8a"), thickness: 0.9pt),
              (X(1.34), Y(1.2)), (X(1.34), Y(ytop - 0.42))))
            place(polygon((X(1.34) - 0.058cm, Y(ytop - 0.58)), (X(1.34), Y(ytop - 0.36)),
              (X(1.34) + 0.058cm, Y(ytop - 0.58)), fill: rgb("#2c5f8a")))
            place(dx: X(1.34) + 0.14cm, dy: Y(ytop - 0.80), text(size: 8.2pt, fill: rgb("#2c5f8a"))[$+infinity$])
            place(dx: X(-1) - 0.26cm, dy: Y(0) + 0.14cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$-1$])
            place(dx: X(1) - 0.10cm, dy: Y(0) + 0.14cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$1$])
            place(dx: X(-0.98), dy: Y(2.6), text(size: 7.8pt, fill: rgb("#1e4b74"))[$[-1,1] times (0, infinity)$])
            place(dx: X(-0.30), dy: Y(0) - 0.46cm,
              text(size: 7.4pt, fill: rgb("#8a4b2c"))[dolna krawędź nie należy (poza $A$)])
          },
        )
      })
    ]
    #v(-0.25em)
    #podpis[$union.big_(t in RR_+) nabla_t = ([-1,1] times (0, infinity)) union {(0,0)}$:
      pas domknięty na bokach, otwarty na dolnej krawędzi, nieograniczony ku górze,
      wraz z izolowanie wyglądającym, lecz nieizolowanym punktem $A$.]
  ])

  #krok("4", [Przekrój po $t in NN$], [
    Teraz $t$ przebiega zbiór ${1, 2, 3, dots}$, więc warunek „należy do każdego
    $nabla_t$” to
    $ forall t in NN: quad |x| <= 1 quad and quad t |x| <= y <= t . $
    Traktujemy nierówności z parametrem $t$ jak zwykłe warunki dla *wszystkich*
    $t$ — i korzystamy z obu „skrajnych” wartości $t$:

    #list(
      [*$t -> infinity$ w nierówności $t|x| <= y$.* Skoro $t |x| <= y$ dla
       wszystkich $t in NN$, to $|x| <= y/t$ dla każdego $t$. Gdy $t -> infinity$,
       prawa strona dąży do $0$, więc $|x| <= 0$, czyli $x = 0$. (Dla $x != 0$
       wystarczy wziąć $t > y/|x|$, by otrzymać sprzeczność — to ten sam argument,
       tylko zapisany wprost.)],
      [*$t = 1$ w nierówności $y <= t$.* Z $y <= t$ dla wszystkich $t in NN$
       wynika w szczególności $y <= 1$; podstawiając $x = 0$ do $t|x| <= y$
       dostajemy $0 <= y$, czyli $y >= 0$.],
      [*Sprawdzenie warunku dostatecznego.* Jeśli $x = 0$ i $0 <= y <= 1$, to dla
       każdego $t in NN$ mamy $t dot 0 = 0 <= y$ oraz $y <= 1 <= t$ — punkt
       $(0,y)$ istotnie należy do wszystkich $nabla_t$.],
    )

    Zatem
    $ inter.big_(t in NN) nabla_t = {0} times [0,1] , $
    czyli *domknięty pionowy odcinek* o końcach $(0,0)$ i $(0,1)$. Jest on istotnie
    mniejszy od *każdego* trójkąta rodziny — w szczególności od najmniejszego
    $nabla_1$, który jest trójkątem o wysokości $1$ i podstawie $2$. Przekrój
    nie jest więc żadnym ze zbiorów rodziny; to „granica od dołu” w rodzinie,
    która przecież monotoniczna nie jest.

    #text(weight: "bold")[Dlaczego akurat $[0,1]$, a nie $[0, infinity)$?]
    Bo warunek $y <= t$ musi zachodzić także dla $t = 1$; gdyby $y > 1$, punkt
    $(0,y)$ nie należałby do $nabla_1$. Widać tu, że o przekroju decydują
    *dwa różne* końce zbioru indeksów: minimalny ($t = 1$) i „graniczny”
    ($t -> infinity$).
  ])

  #krok("5", [Przekrój po $t in RR_+$ (dla porównania)], [
    Warto zobaczyć, co daje analogiczny przekrój po całym $RR_+$ — to pouczające
    zestawienie. Tym razem $t$ może być dowolnie małe, więc *znika* ograniczenie
    $y <= t$ (nie ma „najmniejszego” $t$). Warunek $t|x| <= y$ dla wszystkich
    $t > 0$ przy $x != 0$ daje sprzeczność (bierzemy $t > y/|x|$), zatem $x = 0$;
    a wtedy $0 <= y$ i $y <= t$ dla wszystkich $t > 0$, co wymusza $y <= 0$
    (dla każdego $y > 0$ istnieje $t < y$). Ostatecznie
    $ inter.big_(t in RR_+) nabla_t = {(0,0)} = {A} . $
    Przekrój „skurczył się” do jednego wierzchołka — i to mimo tego, że w rodzinie
    po $RR_+$ są trójkąty dowolnie małe, a więc także takie, które zawierają bardzo
    mało. To jeszcze jeden dowód, że rodzina nie jest monotoniczna: przy rodzinie
    rosnącej przekrój byłby równy najmniejszemu zbiorowi.

    #grid(
      columns: (1fr, 1fr),
      column-gutter: 0.55cm,
      [
        #align(center)[
          #box(width: 7.4cm, height: 5.2cm, {
            import "lib.typ": cplot, kropka, etykieta
            cplot(
              w: 7.4cm, h: 5.2cm, unit: 1.18cm, ox: 3.7cm, oy: 4.45cm,
              xlab: $x$, ylab: $y$,
              body: (X, Y, P) => {
                // tło: kilka trójkątów
                for t in (0.35, 0.7, 1.1, 1.6) {
                  place(path(closed: true, fill: rgb("#e3ecf5").transparentize(45%), stroke: (paint: rgb("#9fb6cb"), thickness: 0.55pt, dash: "dashed"),
                    (X(0), Y(0)), (X(1), Y(t)), (X(-1), Y(t))))
                }
                kropka(X, Y, 0, 0, r: 0.10cm, c: rgb("#2c5f8a"))
                place(dx: X(0) + 0.12cm, dy: Y(0) + 0.16cm, text(size: 7.8pt)[${(0,0)} = {A}$])
                place(dx: X(-1) - 0.20cm, dy: Y(0) + 0.13cm, text(size: 7.2pt, fill: rgb("#5b6b7b"))[$-1$])
                place(dx: X(1) - 0.10cm, dy: Y(0) + 0.13cm, text(size: 7.2pt, fill: rgb("#5b6b7b"))[$1$])
              },
            )
          })
        ]
        #v(-0.2em)
        #podpis[Przekrój po $RR_+$: tylko wierzchołek $A$]
      ],
      [
        #align(center)[
          #box(width: 7.4cm, height: 5.2cm, {
            import "lib.typ": cplot, kropka, etykieta
            cplot(
              w: 7.4cm, h: 5.2cm, unit: 1.18cm, ox: 3.7cm, oy: 4.45cm,
              xlab: $x$, ylab: $y$,
              body: (X, Y, P) => {
                place(path(closed: true, fill: rgb("#e3ecf5").transparentize(35%),
                  stroke: (paint: rgb("#9fb6cb"), thickness: 0.7pt, dash: "dashed"),
                  (X(0), Y(0)), (X(1), Y(1)), (X(-1), Y(1))))
                place(path(stroke: rgb("#2f6b3f") + 2.6pt, (X(0), Y(0)), (X(0), Y(1))))
                kropka(X, Y, 0, 0, r: 0.075cm)
                kropka(X, Y, 0, 1, r: 0.075cm)
                etykieta(X, Y, 0, 0, dx: -0.62cm, dy: 0.10cm)[$(0,0)$]
                etykieta(X, Y, 0, 1, dx: 0.16cm, dy: -0.26cm)[$(0,1)$]
                place(dx: X(1) + 0.10cm, dy: Y(1) - 0.22cm, text(size: 7.2pt, fill: rgb("#6b7c8d"))[$nabla_1$])
                place(dx: X(-1) - 0.20cm, dy: Y(0) + 0.13cm, text(size: 7.2pt, fill: rgb("#5b6b7b"))[$-1$])
                place(dx: X(1) - 0.10cm, dy: Y(0) + 0.13cm, text(size: 7.2pt, fill: rgb("#5b6b7b"))[$1$])
              },
            )
          })
        ]
        #v(-0.2em)
        #podpis[Przekrój po $NN$: odcinek ${0} times [0,1]$ na tle $nabla_1$]
      ],
    )
  ])

  #krok("6", [Suma po $NN$ — dlaczego zbiór indeksów ma znaczenie], [
    Dla ćwiczenia: suma po $NN$ jest *istotnie mniejsza* niż suma po $RR_+$,
    choćby dlatego, że najmniejszy trójkąt $nabla_1$ sięga tylko do wysokości
    $1$, a suma po $RR_+$ jest nieograniczona. Konkretny świadek różnicy:
    punkt $(0.9, 0.1)$ należy do sumy po $RR_+$ (bo dla
    $t = 0.1\/0.9 approx 0.111$ mamy $t|x| = 0.1$), ale nie należy do sumy po
    $NN$, bo warunki $n >= 0.1$ i $0.9 n <= 0.1$ dają $n in [0.1; 0.111]$,
    a w tym przedziale nie ma liczby naturalnej. To bezpośrednia ilustracja
    własności „rozszerzanie zbioru indeksów może tylko powiększyć sumę”.
  ])
]

#odpowiedz[
  #text(weight: "bold")[Suma:]
  #box[$union.big_(t in RR_+) nabla_t = ([-1,1] times (0, infinity)) union {(0,0)}$] —
  pas pionowy domknięty na bokach $x = plus.minus 1$, otwarty na dolnej krawędzi
  $y = 0$ (poza punktem $A$), nieograniczony ku górze, wraz z punktem $A = (0,0)$.
  Zbiór nie jest domknięty ani otwarty.

  #v(0.2em)
  #text(weight: "bold")[Przekrój:]
  #box[$inter.big_(t in NN) nabla_t = {0} times [0,1]$] — domknięty pionowy
  odcinek o końcach $(0,0)$ i $(0,1)$; nie jest żadnym ze zbiorów rodziny.

  #v(0.2em)
  #text(weight: "bold")[Przekrój po wszystkich $t > 0$:]
  #box[$inter.big_(t in RR_+) nabla_t = {(0,0)}$].
]

#uwaga[
  Cztery miejsca, w których łatwo stracić punkty:
  (1) *uznanie rodziny za rosnącą* — nie jest, bo trójkąty obracają się wokół $A$;
  (2) *pominięcie punktów o $y = 0$* — dolna krawędź pasa nie należy do sumy,
  poza punktem $A$;
  (3) *dzielenie przez $|x|$ przy $x = 0$* — przypadek $x = 0$ trzeba rozważyć
  osobno, inaczej „ginie” cała oś $O y$;
  (4) *mylenie $RR_+$ z $NN$* — to daje różne przekroje (punkt vs odcinek)
  i różne sumy. Za sam rysunek bez uzasadnienia przynależności brzegów punkty
  nie są przyznawane.
]
