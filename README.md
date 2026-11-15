# edu_algt — ALGT 2025Z, kolokwium 1 (grupa T2)

Kompletne rozwiązania kolokwium 1 z ALGT (Algebra Liniowa i Geometria Analityczna,
semestr zimowy 2025/2026, grupa T2) wraz z **rozwiniętymi notatkami teoretycznymi**
do zadań 3, 4, 5 i 6, złożone w jeden dokument PDF.

**Wynik:** [`output/ALGT_2025Z_K1_T2_rozwiazania.pdf`](output/ALGT_2025Z_K1_T2_rozwiazania.pdf)
(29 stron A4, rysunki wektorowe, spis treści, numerowane twierdzenia, zestawienie odpowiedzi).

## Zawartość dokumentu

| Część | Co zawiera |
| --- | --- |
| strona tytułowa | opis zakresu dokumentu |
| s. 2 | pełna treść arkusza (zadania 1–6, punktacja) |
| s. 3–4 | spis treści |
| s. 4–7 | **zadanie 3** + notatka teoretyczna o liczbach zespolonych |
| s. 8–11 | **zadanie 4** + notatka teoretyczna o wielomianach i ułamkach prostych |
| s. 12–20 | **zadanie 5** + notatka teoretyczna o rodzinach zbiorów |
| s. 21–26 | **zadanie 6** + notatka teoretyczna o kwantyfikatorach i implikacji |
| s. 27–29 | uzupełnienie: zadania 1 i 2, zestawienie odpowiedzi |

Każde z zadań 3–6 jest opracowane w układzie: *komentarz* → **notatka teoretyczna**
(definicje, twierdzenia z dowodami, przykłady, wnioski, „do zapamiętania”) →
**rozwiązanie krok po kroku** → **odpowiedź** → **uwaga** o typowych błędach.

### Notatki teoretyczne

**Zadanie 3 — liczby zespolone** (`theory_zespolone.typ`)

1. ciało $CC$, sprzężenie, dzielenie,
2. postać trygonometryczna, wykładnicza, moduł, argument główny,
3. własności modułu i argumentu z dowodem, wzór de Moivre'a,
4. twierdzenie o pierwiastkach $n$-tego stopnia z dowodem i wnioskiem geometrycznym,
5. opisywanie zbiorów na płaszczyźnie zespolonej (okrąg, koło, półprosta, wycinek).

**Zadanie 4 — wielomiany i ułamki proste** (`theory_algebra.typ`)

1. dzielenie z resztą, funkcja wymierna właściwa a część wielomianowa,
2. zasadnicze twierdzenie algebry, rozkład nad $CC$, pary pierwiastków sprzężonych nad $RR$,
3. twierdzenie o rozkładzie na ułamki proste (z dokładnym kształtem rozkładu),
4. test liczby współczynników ($=$ stopień mianownika),
5. trzy metody wyznaczania współczynników,
6. dlaczego współczynniki nad $CC$ są sprzężone i jak „sklejają się” nad $RR$.

**Zadanie 5 — rodziny zbiorów, suma i przekrój uogólniony** (`theory_zbiory.typ`)

1. zbiór indeksów, rodzina indeksowana jako funkcja $T -> cal(P)(X)$,
2. definicje sumy i przekroju uogólnionego, przykłady istotnie nieskończone,
3. własności z pełnymi dowodami: ograniczanie, monotoniczność, prawa de Morgana,
   prawa rozdzielcze, absorpcja i rozszerzanie zbioru indeksów,
4. rodzina pusta i umowy graniczne,
5. rodziny monotoniczne i **osobna dyskusja „wspólny wierzchołek ≠ zawieranie”**,
6. granice ciągów zbiorów ($liminf$, $limsup$), twierdzenie o zstępujących
   zbiorach zwartych i uzasadnienie przejścia granicznego $t -> infinity$,
7. opisywanie zbiorów na płaszczyźnie nierównościami, konwencja rysunkowa,
8. metoda liczenia sum i przekrojów rodzin zadanych geometrycznie,
9. najczęstsze błędy.

**Zadanie 6 — kwantyfikatory, implikacja, zaprzeczanie** (`theory_logika.typ`)

1. zdanie, funktor zdaniowy, zbiór prawdziwości, zmienne wolne i związane,
2. kwantyfikatory, świadek, kontrprzykład, metody uzasadniania,
3. prawa de Morgana dla kwantyfikatorów i rozdzielność kwantyfikatorów ze spójnikami
   (z kontrprzykładami pokazującymi, co *nie* jest prawdą),
4. tabela prawdy, prawa rachunku zdań, kontrapozycja,
5. implikacja: trzy interpretacje, prawda pusta, zbiór prawdziwości, typowe błędy,
6. **zasięg kwantyfikatora** — zestawienie trzech podobnych zapisów i ich wartości,
7. procedura uzasadniania prawdziwości i fałszywości zdań z kwantyfikatorami.

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
   $inter.big_(t in NN) nabla_t = {0} times [0,1]$ (dla porównania
   $inter.big_(t in RR_+) nabla_t = {(0,0)}$).
6. Zdanie prawdziwe (świadek $x = 0$); zaprzeczenie: $forall x in RR (sin x > x and x <= 7)$.

### Rzeczy warte podkreślenia

* Rodzina $(nabla_t)$ **nie jest monotoniczna** — wszystkie trójkąty mają wspólny
  wierzchołek $A$, ale żaden nie zawiera innego. To najczęstsze źródło błędu
  w zadaniu 5.
* Punkt $A = (0,0)$ **nie jest punktem izolowanym** sumy: ciąg
  $(epsilon, epsilon) in nabla_epsilon$ dąży do $A$.
* Suma jest **niedomknięta** (choć każdy $nabla_t$ jest zwarty) — ilustracja tego,
  że suma nieskończenie wielu zbiorów domkniętych nie musi być domknięta.
* W zadaniu 4 rozkład nad $RR$ ma **sześć** współczynników ($2$ w liczniku trójmianu
  $+ 2 + 2$ dla $x^2$ i $(x-3)^2$), a nie pięć — kontrola przez $deg Q = 6$.

## Struktura repozytorium

```
kolokwium-1/
  main.typ             # ustawienia strony, strona tytułowa, treść arkusza,
                       #   spis treści, zestawienie odpowiedzi, kolejność włączania części
  lib.typ              # kolory, ramki (rozwiązanie/uwaga/odpowiedź/komentarz),
                       #   otoczenia notatek (definicja, twierdzenie, dowód, przykład,
                       #   wniosek, krok), pomocniki rysunków
  theory_zespolone.typ # notatka teoretyczna do zadań 1–3 (liczby zespolone)
  theory_algebra.typ   # notatka teoretyczna do zadania 4 (wielomiany, ułamki proste)
  theory_zbiory.typ    # notatka teoretyczna do zadania 5 (rodziny zbiorów)
  theory_logika.typ    # notatka teoretyczna do zadania 6 (logika)
  zadanie_3.typ        # rozwiązanie zadania 3
  zadanie_4.typ        # rozwiązanie zadania 4
  zadanie_5.typ        # rozwiązanie zadania 5
  zadanie_6.typ        # rozwiązanie zadania 6
  zadania_1_2.typ      # rozwiązania zadań 1 i 2 (uzupełnienie)
tools/
  build.mjs            # kompilacja Typst -> PDF (Node.js)
  package.json         # zależność @myriaddreamin/typst-ts-node-compiler
output/
  ALGT_2025Z_K1_T2_rozwiazania.pdf
```

Rysunki nie są bitmapami — są rysowane wektorowo w samym Typście (funkcje
`cplot`, `kropka`, `kolko`, `etykieta`, `luk`, `odcinek`, `wielokat` w `lib.typ`),
więc skalują się bez utraty jakości.

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
* Twierdzenia w notatkach są numerowane ciągle w całym dokumencie; definicje
  wyróżniono pionową kreską, dowody kończy znak $square$.
* W rozwiązaniach wyróżniono: **Krok n** (tok rozumowania), ramkę
  **Odpowiedź** oraz **Uwagę** o najczęstszych błędach.
