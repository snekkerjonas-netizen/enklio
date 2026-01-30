# Enklio — Kortoversikt

Dette er et Flutter-prosjekt for en oppskrift-/kokeassistent-app med fokus på en ren arkitektur.

## Arkitektur

### Mappestruktur

- `lib/` — Flutter-kode
  - `lib/src/app/` — App-oppstart og FlowCoordinator
  - `lib/src/features/` — Funksjonelle deler (task.dart, del_01...del_08)
  - `lib/src/models/` — Domenemodeller (Recipe, Ingredient, CookingStep, AppView)
  - `lib/src/services/` — Tjenester (RecipeGenerationService, Translations)
  - `lib/src/ui/` — UI-skjermer (StartScreen, StepScreen, CompletionScreen)
- `test/` — Tester
  - `test/unit/` — Enhetstester
  - `test/widget_test.dart` — Widget-test

### Sentrale komponenter

- **FlowCoordinator**: Håndterer navigasjon og tilstand for oppgaveflyt (ChangeNotifier)
- **Task**: Representerer en oppgave med tittel, varighet og buffer
- **Recipe/Ingredient/CookingStep**: Domenemodeller for oppskrifter
- **RecipeGenerationService**: Service for generering av oppskrifter (mock-implementasjon)
- **Translations**: Oversettelse/i18n for norske strenger

## Hvordan kjøre

### Kjøre appen

```bash
flutter pub get
flutter run
```

### Kjøre tester

Kjør alle tester:
```bash
flutter test
```

Kjør enkeltfiler:
```bash
flutter test test/unit/flow_coordinator_test.dart
flutter test test/unit/del_06_test.dart
```

### Analyse og formatering

```bash
flutter analyze
flutter format lib/ test/
```

## Utviklingsstatus

Appen er nå kompilerbar og kjører en enkel flyt:
1. StartScreen viser dagens oppgaver
2. StepScreen viser timer for hver oppgave
3. CompletionScreen når alle oppgaver er fullført

Domenemodeller og tjenester for oppskriftsfunksjonalitet er lagt til som fundament for videre utvikling.

## Kontakt

Følg instruksjonene i prosjektets arbeidsflyt for neste steg.

