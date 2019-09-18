import 'userProvider.dart';
import 'eventProvider.dart';

abstract class Singleton {
  CitizenProvider get citizenProvider;
  EventProvider get eventProvider;
}

class ImplementedSingleton implements Singleton {
  static final ImplementedSingleton _singleton =
  new ImplementedSingleton._internal();

  CitizenProvider citizenProvider = MockCitizenProvider(); //TODO: Replace with APICitizenProvider in Sprint2

  factory ImplementedSingleton() {
    return _singleton;
  }

  ImplementedSingleton._internal();

  @override
  // TODO: implement eventProvider
  get eventProvider => MockEventProvider();
}
