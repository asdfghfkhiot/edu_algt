// Kompilacja dokumentu Typst -> PDF za pomocą @myriaddreamin/typst-ts-node-compiler.
// Użycie:  node tools/build.mjs [plik-wejściowy.typ] [plik-wyjściowy.pdf]
//
// Domyślnie: kolokwium-1/main.typ -> output/ALGT_2025Z_K1_T2_rozwiazania.pdf

import { NodeCompiler } from '@myriaddreamin/typst-ts-node-compiler';
import fs from 'node:fs';
import path from 'node:path';

const root = path.resolve(import.meta.dirname ?? new URL('.', import.meta.url).pathname, '..');

const main = path.resolve(root, process.argv[2] ?? 'kolokwium-1/main.typ');
const out = path.resolve(root, process.argv[3] ?? 'output/ALGT_2025Z_K1_T2_rozwiazania.pdf');

if (!fs.existsSync(main)) {
  console.error(`Nie znaleziono pliku wejściowego: ${main}`);
  process.exit(1);
}

const compiler = NodeCompiler.create({ workspace: path.dirname(main) });
const args = { mainFilePath: main, resetRead: true };

compiler.evictCache(0); // kompilator ma globalny cache odczytu plików
const compiled = compiler.compile(args);
const diagnostics = compiled.takeDiagnostics();
if (diagnostics) {
  for (const d of diagnostics.shortDiagnostics ?? diagnostics) {
    console.log(`${d.severity ?? 'info'}: ${d.message}`);
  }
}
if (compiled.hasError() || !compiled.result) {
  const err = compiled.takeError();
  if (err) err.printErrors?.();
  console.error('Kompilacja nie powiodła się.');
  process.exit(1);
}

const pages = compiled.result.numOfPages;
fs.mkdirSync(path.dirname(out), { recursive: true });
fs.writeFileSync(out, compiler.pdf(args));
console.log(`OK: ${path.relative(root, out)} (${pages} stron)`);
