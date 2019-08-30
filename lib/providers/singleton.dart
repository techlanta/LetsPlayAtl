import 'userProvider.dart';

abstract class Singleton {
  CitizenProvider get citizenProvider;
  EventOrganizerProvider get eventOrganizerProvider;
}

class ImplementedSingleton implements Singleton {
  static final ImplementedSingleton _singleton =
  new ImplementedSingleton._internal();

  CitizenProvider citizenProvider = MockCitizenProvider(); //TODO: Replace with APICitizenProvider in Sprint2
  EventOrganizerProvider eventOrganizerProvider = MockEventOrganizerProvider(); //TODO: Replace later

  factory ImplementedSingleton() {
    return _singleton;
  }

  ImplementedSingleton._internal();
}
