import 'package:flutter_module_tests/blocs/bloc_event_state_base.dart';

class ApplicationInitializationEvent extends BlocEvent {

  final ApplicationInitializationEventType type;

  ApplicationInitializationEvent({
    this.type: ApplicationInitializationEventType.start,
  }) : assert(type != null);
}

enum ApplicationInitializationEventType {
  start,
  stop,
}