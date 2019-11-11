import 'package:lets_play_atl/providers/sdgProvider.dart';

import 'userProvider.dart';
import 'eventProvider.dart';

abstract class Singleton {
  CitizenProvider get citizenProvider;
  EventProvider get eventProvider;
  SDGProvider get sdgProvider;
}

class ImplementedSingleton implements Singleton {
  static final ImplementedSingleton _singleton =
  new ImplementedSingleton._internal();

  CitizenProvider citizenProvider = APICitizenProvider(); //TODO: Replace with APICitizenProvider in Sprint2

  factory ImplementedSingleton() {
    return _singleton;
  }

  ImplementedSingleton._internal();

  @override
  // TODO: implement eventProvider
  get eventProvider => APIEventProvider();

  get sdgProvider => SDGProvider();
}
