// lib/src/features/del_05/del_05.dart

/// DEL 5 — Stegvis gjennomføring
/// KUN struktur og ansvar
/// Ingen implementasjon
/// Ingen logikk
/// Ingen UI

/// Use case for å styre stegvis kjøring
abstract class Del05UseCase {
  void start();
  void completeStep(String stepId);
  void finish();
}

/// Orkestrerer steg-rekkefølge (uten å eie flyt)
abstract class Del05Orchestrator {
  void initialize(List<String> steps);
  void goToStep(String stepId);
  String? getCurrentStep();
}

/// Port for progresjonsoppdatering (ingen lagring her)
abstract class Del05ProgressPort {
  void markStepCompleted(String stepId);
  void setCurrentStep(String stepId);
}

/// Signal ut av Del 5 når gjennomføring er ferdig
/// Kobles senere til FlowCoordinator
abstract class Del05FlowSignal {
  void onDel05Completed();
}
