# edu_algt — ALGT 2025Z, kolokwium 1 (grupa T2)

Kompletne rozwiązania kolokwium 1 z ALGT (Algebra Liniowa i Geometria Analityczna,
semestr zimowy 2025/2026, grupa T2) wraz z notatkami teoretycznymi do zadań 5 i 6,
złożone w jeden dokument PDF.

**Wynik:** [`output/ALGT_2025Z_K1_T2_rozwiazania.pdf`](output/ALGT_2025Z_K1_T2_rozwiazania.pdf)
(13 stron A4, rysunki wektorowe, spis treści, zestawienie odpowiedzi).

## Zawartość dokumentu

| Część | Co zawiera |
| --- | --- |
| strona tytułowa | opis zakresu dokumentu |
| s. 2 | pełna treść arkusza (zadania 1–6, punktacja) |
| s. 3 | spis treści |
| s. 3–7 | **zadania 1–4** — rozwiązania krok po kroku, rysunki na płaszczyźnie zespolonej, odpowiedzi, uwagi o typowych błędach |
| s. 8–10 | **zadanie 5** + notatka teoretyczna i rozwiązanie z rysunkami sumy i przekroju |
| s. 11–13 | **zadanie 6** + notatka teoretyczna, rozwiązanie, zaprzeczenie zdania |
| s. 13 | zestawienie odpowiedzi do wszystkich zadań |

### Notatki teoretyczne

**Zadanie 5 — rodziny zbiorów, suma i przekrój uogólniony**

1. rodzina indeksowana $(A_t)_(t in T)$ (a nie „zbiór zbiorów”),
2. definicje $union.big_(t in T) A_t$ i $inter.big_(t in T) A_t$,
3. podstawowe własności z dowodami: ograniczanie, monotoniczność, prawa de Morgana,
   prawa rozdzielcze, rodzina pusta, rozszerzanie zbioru indeksów,
4. rodziny monotoniczne i przykłady pokazujące, że sumy/przekroju *nie wolno*
   utożsamiać z żadnym z $A_t$,
5. opisywanie zbiorów na płaszczyźnie nierównościami i konwencja rysunkowa
   (brzeg należący / nie należący, punkty izolowane).

**Zadanie 6 — kwantyfikatory, funktory zdaniowe i implikacja**

1. zdanie, funktor zdaniowy, kwantyfikator ogólny i egzystencjalny, świadek,
2. prawa de Morgana dla kwantyfikatorów i zaprzeczanie nierównościom oraz implikacji,
3. tabela prawdy implikacji, prawo kontrapozycji, prawda pusta,
4. uwaga o zasięgu kwantyfikatora w wyrażeniu $exists x (p(x) ==> q(x))$,
5. metody uzasadniania zdań egzystencjalnych i ogólnych.

## Rozwiązania w skrócie

1. $(5 sqrt(3) - 5 j)^2 dot e^((5 pi)/4 j) = -25(sqrt(6)+sqrt(2)) + 25(sqrt(6)-sqrt(2)) j
   = 100 e^((11 pi)/12 j)$.
2. Wycinek koła o środku $-1+j$, promieniu $sqrt(2)$, kącie $pi$ (brzeg otwarty na
   promieniu o kierunku $-pi/4$, środek wyłączony).
3. $z in {2 sqrt(3), thin -2 sqrt(3), thin -6 j}$ — wierzchołki trójkąta równobocznego
   wpisanego w okrąg o środku $-2j$ i promieniu $4$.
4. Nad $RR$: $(A x+B)/(x^2+4x+29) + C/x + D/x^2 + E/(x-3) + F/(x-3)^2$; nad $CC$
   dodatkowo rozkład $x^2+4x+29 = (x+2-5j)(x+2+5j)$.
5. $union.big_(t in RR_+) nabla_t = ([-1,1] times (0, infinity)) union {(0,0)}$,
   $inter.big_(t in NN) nabla_t = {0} times [0,1]$.
6. Zdanie prawdziwe (świadek $x = 0$); zaprzeczenie: $forall x in RR (sin x > x and x <= 7)$.

## Struktura repozytorium

```
kolokwium-1/
  main.typ          # ustawienia strony, strona tytułowa, treść arkusza, spis treści,
                    #   zestawienie odpowiedzi i kolejność włączania części
  lib.typ           # kolory, ramki (rozwiązanie/uwaga/odpowiedź), pomocniki rysunków
  zadania_1_4.typ   # rozwiązania zadań 1–4
  zadanie_5.typ     # notatka + rozwiązanie zadania 5
  zadanie_6.typ     # notatka + rozwiązanie zadania 6
tools/
  build.mjs         # kompilacja Typst -> PDF (Node.js)
  package.json      # zależność @myriaddreamin/typst-ts-node-compiler
output/
  ALGT_2025Z_K1_T2_rozwiazania.pdf
```

Rysunki nie są bitmapami — są rysowane wektorowo w samym Typście (funkcje
`cplot`, `kropka`, `etykieta`, `luk`, `wielokat` w `lib.typ`), więc skalują się bez
utraty jakości.

## Ponowne zbudowanie PDF

Wymagany Node.js (>= 18).

```bash
cd tools && npm install && cd ..
node tools/build.mjs
```

Można też podać własne ścieżki:

```bash
node tools/build.mjs kolokwium-1/main.typ output/inny.pdf
```

Kompilator jest uruchamiany jako biblioteka Node (`@myriaddreamin/typst-ts-node-compiler`),
więc nie trzeba instalować samego Typsta. Jeśli masz Typst w wersji CLI, wystarczy:

```bash
typst compile kolokwium-1/main.typ output/ALGT_2025Z_K1_T2_rozwiazania.pdf
```

## Konwencje

* Jednostka urojona to $j$ (zgodnie z notacją wykładu), $j^2 = -1$;
  $arg z in (-pi, pi]$ (argument główny).
* $RR_+$ oznacza zbiór $t > 0$ (rodzina ciągła), $NN = {1, 2, 3, dots}$.
* W rozwiązaniach wyróżniono: **Krok n** (tok rozumowania), ramkę
  **Odpowiedź** oraz **Uwagę** o najczęstszych błędach.
