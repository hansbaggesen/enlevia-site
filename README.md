# Enlevia — <www.enlevia.com>

Statisk hjemmeside for **Enlevia**, Hans Baggesens danske datakonsulentvirksomhed.

## Teknologi

Ren HTML/CSS/JavaScript — ingen byggeproces, ingen pakkemanager, ingen framework.

## Sider

| Fil | URL | Indhold |
| ----- | ----- | --------- |
| `index.html` | `/` | Forside (hero, services, kontakt) |
| `blog.html` | `/blog.html` | Artikeloversigt |
| `blog/*.html` | `/blog/<slug>.html` | Individuelle blogartikler |
| `profile.html` | `/profile.html` | Om Enlevia |

## Mappestruktur

``` text

enlevia-site/
├── blog/               # Blogartikler (.html + .docx kildefiler)
├── css/
│   └── style-v2.css    # Stylesheet til blogartikler
├── img/                # Billeder
├── js/
│   └── main.js         # Footer-år + mobil navigation
├── scripts/
│   └── sync-ldjson.ps1 # Synkroniser JSON-LD fra structured-data/ til index.html
├── structured-data/
│   └── enlevia.schema.json  # Kanonisk JSON-LD structured data
├── Mess/               # Arkiv/kladder (ikke publiceret)
├── CNAME               # GitHub Pages custom domain
├── index.html
├── blog.html
└── profile.html
```

## Deployment

GitHub Pages — push til `main` publicerer direkte til [www.enlevia.com](https://www.enlevia.com). Ingen byggeproces.

## CSS-arkitektur

Der er to separate CSS-systemer:

- **`css/style-v2.css`** — bruges kun af blogartikler i `blog/`. Teal-palet (`--accent-primary: #2D5F63`), fonte: Inter + Sentient.
- **Indlejret CSS** — `index.html`, `blog.html` og `profile.html` har hver sin selvstændige CSS direkte i `<style>`-tagget. Grøn palet (`#1a3a2e` / `#2d5c48`), fonte: Fraunces + DM Sans.

## Structured Data (JSON-LD)

Den kanoniske JSON-LD for forsiden vedligeholdes i `structured-data/enlevia.schema.json`. Efter ændringer synkroniseres den ind i `index.html` med:

```powershell
pwsh scripts/sync-ldjson.ps1
```

## Ny blogartikel

1. Skriv artiklen i Word (`.docx`) og gem den i `blog/`
2. Eksportér/konvertér til HTML med samme filnavn
3. Tilføj artiklen til oversigten i `blog.html`
