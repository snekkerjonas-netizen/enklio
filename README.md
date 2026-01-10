# Enklio — Kortoversikt

Dette repoet er et Flutter-prosjekt med fokus på en delt, ansvarlig arkitektur. Denne README forklarer mappestrukturen og hvordan du kjører de enkle testene vi la til.

Mapper (viktigst):
- `lib/` — Flutter-kode.
- `lib/src/app` — App-oppstart og DI (plassholder).
- `lib/src/features/` — Funksjonelle deler (del_01 … del_08). Hver "Del" inneholder domain-, data- og/eller service-grensesnitt.
- `lib/src/core/` — Gjenbrukbare tjenester, utils og widgets.
- `assets/` — Bilder, ikoner, fonter.
- `test/unit/` — Enhetstester for enkeltkomponenter (Del 6, 7, 8).

Hvordan kjøre tester lokalt:
1. Åpne terminal i prosjektets rotmappe.
2. Kjør alle tester:

```bash
flutter test
```

3. Kjør enkeltfiler (eksempel):

```bash
flutter test test/unit/del_06_test.dart
flutter test test/unit/del_07_test.dart
flutter test test/unit/del_08_test.dart
```

Tips:
- Testene er laget for å være enkle og lokale (bruker in-memory stubber). Hvis du får kompileringsfeil, sørg for at `flutter pub get` er kjørt.

Kontakt: Følg instruksjonene i prosjektets arbeidsflyt for neste steg.
# enklio

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
