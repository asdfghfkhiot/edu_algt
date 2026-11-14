// ============================================================
//  ZADANIE 6 -- kwantyfikatory, implikacja, zaprzeczanie
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

#let prawda = text(fill: rgb("#2f6b3f"), weight: "bold")[prawdziwe]

// ------------------------------------------------------------
#zadanie("6", "[2 p.]", [
  Czy prawdziwe jest następujące zdanie:
  $ exists x in RR (sin x > x ==> x > 7) ? $
  Odpowiedź uzasadnić. Zapisać zaprzeczenie tego zdania bez użycia symbolu negacji.
])

// ------------------------------------------------------------
#notatka[Kwantyfikatory, funktory zdaniowe i implikacja]

#podtem[1. Zdanie, funktor zdaniowy, kwantyfikatory]

#defn[
  *Funktor zdaniowy* (forma zdaniowa) $phi(x)$ to wyrażenie, które staje się
  zdaniem po podstawieniu konkretnej wartości za $x$ (ma wtedy wartość logiczną).
  *Kwantyfikatory* wiążą zmienną i zamieniają funktor w zdanie:
  #list(
    [*ogólny* (duży): $forall x in X colon phi(x)$ — „dla każdego $x in X$ zachodzi $phi(x)$”;],
    [*egzystencjalny* (szczegółowy): $exists x in X colon phi(x)$ — „istnieje $x in X$,
     dla którego zachodzi $phi(x)$”. Można podać świadek, czyli konkretny $x$.],
  )
]

Zdanie z kwantyfikatorem ogólnym jest prawdziwe, gdy $phi(x)$ zachodzi dla
*wszystkich* $x$; wystarczy jeden kontrprzykład (jeden $x$, dla którego $phi$
jest fałszywe), by zdanie było fałszywe. Zdanie z kwantyfikatorem egzystencjalnym
jest prawdziwe, gdy *istnieje choć jeden* świadek; prawdziwość wykazujemy więc
przez *podanie przykładu*, a fałszywość — przez dowód, że przeciwny funktor
zachodzi dla wszystkich $x$.

#podtem[2. Prawa rachunku kwantyfikatorów (zaprzeczanie)]

#defn[
  *Prawa de Morgana dla kwantyfikatorów.* Dla dowolnego funktora $phi(x)$:
  $
    not (forall x in X colon phi(x)) quad <=> quad exists x in X colon not phi(x),
  $
  $
    not (exists x in X colon phi(x)) quad <=> quad forall x in X colon not phi(x).
  $
  Słownie: „nie jest tak, że dla wszystkich…” to „istnieje taki, że nie…”;
  „nie istnieje taki, że…” to „dla każdego nie…”. Zaprzeczając, *przecinamy*
  kwantyfikator (zmieniamy jego rodzaj) i negujemy funktor.
]

#defn[
  *Zaprzeczanie nierównościom i implikacji.*
  $
    not (a > b) <=> a <= b, quad not (a >= b) <=> a < b,
  $
  $
    not (p ==> q) <=> p and not q .
  $
  Ostatnie prawo jest kluczowe: implikacja jest fałszywa *wyłącznie* wtedy, gdy
  jej założenie jest prawdziwe, a teza fałszywa (tzw. jedyny kontrprzykład).
  W szczególności $not (p ==> q)$ *nie* jest równoważne $p ==> not q$.
]

#podtem[3. Implikacja — tabela prawdy i sposoby rozumienia]

Implikację $p ==> q$ czytamy: „jeśli $p$, to $q$” ($p$ — poprzednik, $q$ — następnik).
Jej wartość logiczną podaje tabela:

#align(center)[
  #table(
    columns: 3, align: center, stroke: 0.5pt + rgb("#9fb2c4"),
    inset: (x: 10pt, y: 3.5pt),
    table.header([$p$], [$q$], [$p ==> q$]),
    [0], [0], [1],
    [0], [1], [1],
    [1], [0], [0],
    [1], [1], [1],
  )
]
#v(0.35em)

Warto zapamiętać trzy własności:
#list(
  [Implikacja jest *fałszywa tylko* w wierszu $p = 1$, $q = 0$ — to jedyny
   kontrprzykład i to on jest potrzebny, gdy zaprzeczamy zdaniu z implikacją;],
  [Zdanie $p ==> q$ jest równoważne $not p or q$ oraz $not q ==> not p$
   (prawo kontrapozycji); implikacja odwrotna $q ==> p$ *nie* jest równoważna;],
  [Jeśli poprzednik jest fałszywy, implikacja jest *prawdziwa* — mówimy, że jest
   spełniona „pusto” (vacuously true). Dlatego w zadaniach typu „istnieje $x$,
   dla którego $p(x) ==> q(x)$” często wystarczy wskazać $x$ z fałszywym $p(x)$.],
)

#podtem[4. Kwantyfikator a implikacja — typowa pułapka]

W wyrażeniu $exists x in RR (sin x > x ==> x > 7)$ kwantyfikator wiąże *całą*
implikację, nie sam jej poprzednik. Zdanie jest więc prawdziwe, gdy istnieje
choć jedna liczba $x$, dla której implikacja jest prawdziwa — a że implikacja
z fałszywym poprzednikiem jest zawsze prawdziwa, wystarczy znaleźć $x$ z
$sin x <= x$. Wartości logicznej *nie* zmienia to, czy teza $x > 7$ jest
spełniona — o ile poprzednik jest fałszywy.

#podtem[5. Jak uzasadniać prawdziwość zdań egzystencjalnych]

#list(
  [Aby wykazać $exists x colon phi(x)$, wystarczy podać *jeden* konkretny $x$
   (świadka) i sprawdzić $phi(x)$ — to pełny dowód, nie trzeba szukać „najlepszego” przykładu;],
  [Jeśli $phi$ jest implikacją, warto szukać świadka wśród $x$ z fałszywym
   poprzednikiem (najprostszy przypadek) — ale można też podać świadka z prawdziwym
   poprzednikiem i prawdziwą tezą.],
  [Aby wykazać fałszywość $exists x colon phi(x)$, dowodzimy $forall x colon not phi(x)$;
   aby wykazać fałszywość $forall x colon phi(x)$, podajemy kontrprzykład.],
)

// ------------------------------------------------------------
#rozwiazanie[
  #text(weight: "bold", fill: accent)[Krok 1. Co dokładnie głosi zdanie.]
  Zdanie
  $
    exists x in RR (sin x > x ==> x > 7)
  $
  głosi, że *istnieje* liczba rzeczywista $x$, dla której implikacja
  „jeśli $sin x > x$, to $x > 7$” jest prawdziwa.

  #text(weight: "bold", fill: accent)[Krok 2. Kluczowa obserwacja.]
  Implikacja jest fałszywa tylko wtedy, gdy jej poprzednik jest prawdziwy,
  a następnik fałszywy. Wystarczy więc wskazać $x$, dla którego $sin x > x$
  jest *fałszywe* — wtedy implikacja jest prawdziwa niezależnie od wartości $x > 7$.

  #text(weight: "bold", fill: accent)[Krok 3. Wybór świadka.]
  Weźmy $x_0 = 0$. Wtedy $sin x_0 = sin 0 = 0$, więc $sin x_0 > x_0$ jest fałszywe
  ($0 > 0$ nie zachodzi), a implikacja z fałszywym poprzednikiem jest prawdziwa.
  Zatem $x_0 = 0$ jest świadkiem i zdanie jest #prawda.

  #text(weight: "bold", fill: accent)[Krok 4. Kiedy poprzednik jest prawdziwy.]
  Dla porządku opiszmy zbiór tych $x$, dla których $sin x > x$. Ponieważ
  $|sin x| <= |x|$ dla każdego $x$ i równość zachodzi wyłącznie dla $x = 0$,
  mamy:
  #list(
    [dla $x > 0$: $sin x < x$, więc poprzednik jest fałszywy;],
    [dla $x = 0$: $sin x = x$, więc poprzednik jest fałszywy;],
    [dla $x < 0$: $sin x > x$, więc poprzednik jest *prawdziwy* (np. $x = -1$,
     $sin(-1) approx -0.84 > -1$).],
  )
  Poprzednik jest więc prawdziwy dokładnie dla $x < 0$. Wtedy jednak $x < 0 < 7$,
  czyli następnik $x > 7$ jest fałszywy. Oznacza to, że nie istnieje $x$, dla którego
  spełniony byłby „zakazany” przypadek prawda $==>$ fałsz:
  $$
    not exists x in RR (sin x > x and x > 7) ,
  $$
  czyli nie istnieje $x$, dla którego byłby spełniony „przypadek $1 ==> 0$”.

  #text(weight: "bold", fill: accent)[Krok 5. Zbiór prawdziwości implikacji.]
  Z powyższego: dla $x < 0$ implikacja jest fałszywa, a dla $x >= 0$ — prawdziwa
  (poprzednik fałszywy). Zbiór prawdziwości implikacji to więc cały przedział
  $[0, infinity)$, a to zbiór niepusty. Istnienie świadka jest zatem nie tylko
  stwierdzone konkretnym przykładem, ale i w pełni opisane: świadkiem jest
  *każda* liczba $x >= 0$.

  #align(center)[
    #box(width: 11.4cm, height: 6.1cm, {
      import "lib.typ": cplot
      cplot(
        w: 11.4cm, h: 6.1cm, unit: 1.05cm, ox: 5.2cm, oy: 3.55cm,
        xlab: $x$, ylab: $y$,
        body: (X, Y, P) => {
          // obszar x >= 0: tam implikacja jest prawdziwa
          place(rect(width: 11.4cm - X(0), height: 6.1cm,
            fill: rgb("#2f6b3f").transparentize(92%), stroke: none), dx: X(0), dy: 0pt)
          // prosta y = x
          place(path(stroke: (paint: rgb("#9aa9b8"), dash: "dashed", thickness: 0.8pt),
            (X(-4.0), Y(-4.0)), (X(4.0), Y(4.0))))
          // wykres sin x
          let pts = ()
          for i in range(0, 240) {
            let xx = -4.0 + 8.0 * i / 240
            pts.push((X(xx), Y(calc.sin(xx))))
          }
          place(path(stroke: accent + 1.15pt, ..pts))
          // świadek x = 0
          place(circle(width: 0.16cm, height: 0.16cm, fill: white, stroke: 1.2pt + rgb("#b0562c")),
            dx: X(0) - 0.08cm, dy: Y(0) - 0.08cm)
          place(dx: X(0) + 0.14cm, dy: Y(0) + 0.12cm,
            text(size: 7.8pt, fill: rgb("#b0562c"))[świadek $x = 0$])
          // opisy wykresów
          place(dx: X(2.1), dy: Y(-1.35), text(size: 8pt)[$y = sin x$])
          place(dx: X(2.35), dy: Y(2.55), text(size: 8pt, fill: rgb("#6b7c8d"))[$y = x$])
          place(dx: X(0.55), dy: Y(-1.95), text(size: 7.2pt, fill: rgb("#2f6b3f"))[
            tu implikacja jest prawdziwa])
          place(dx: X(0) - 0.26cm, dy: Y(0) + 0.11cm, text(size: 7.4pt, fill: rgb("#5b6b7b"))[$0$])
        },
      )
    })
  ]
  #v(-0.1em)
  #podpis[Wykresy $y = sin x$ i $y = x$. Poprzednik $sin x > x$ jest prawdziwy tylko
    dla $x < 0$; na zaznaczonym obszarze $x >= 0$ jest on fałszywy, więc implikacja jest
    tam prawdziwa. Punkt $x = 0$ jest świadkiem.]

  #text(weight: "bold", fill: accent)[Krok 6. Komentarz.]
  Zdanie jest więc prawdziwe, choć *nie* z powodu tezy: dla żadnego $x$ nie są
  jednocześnie spełnione $sin x > x$ i $x > 7$. Cała siła zdania tkwi w tym, że
  implikacja z fałszywym poprzednikiem jest prawdziwa — to tzw. prawda pusta
  (vacuously true). Analogicznie zdanie $forall x in RR (sin x > x ==> x > 7)$
  jest *fałszywe* (kontrprzykład: $x = -1$), co pokazuje, że zamiana kwantyfikatora
  zmienia wartość logiczną.
]

#odpowiedz[
  *Zdanie jest #text(fill: rgb("#2f6b3f"), weight: "bold")[prawdziwe].*
  Świadkiem jest np. $x = 0$ (a w istocie każda liczba $x >= 0$): wtedy
  $sin 0 > 0$ jest fałszywe, a implikacja z fałszywym poprzednikiem jest prawdziwa.

  #v(0.15em)
  *Zaprzeczenie* (bez symbolu negacji, korzystając z praw z notatki):
  $
    forall x in RR (sin x > x and x <= 7) .
  $
  Słownie: *dla każdej liczby rzeczywistej $x$ zachodzi $sin x > x$ oraz $x <= 7$*.
  Zdanie to jest fałszywe (np. dla $x = 8$ mamy $sin 8 <= 1 < 8$, więc pierwszy
  człon koniunkcji jest fałszywy), co potwierdza prawdziwość zdania wyjściowego.
]

#uwaga[
  Najczęstszy błąd to zaprzeczanie samej tezy zamiast całej implikacji:
  $forall x (sin x > x and x > 7)$ jest *niepoprawne* — przy zaprzeczaniu
  implikacji zmieniamy znak także w następniku, bo $not (x > 7)$ to $x <= 7$.
  Drugi częsty błąd to szukanie świadka wśród dużych $x$ — tymczasem najprostszym
  świadkiem jest $x$, dla którego poprzednik jest fałszywy.
]
