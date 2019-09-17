import 'package:lets_play_atl/model/User.dart';

abstract class EventOrganizerProvider {

}


abstract class CitizenProvider {
  Future<bool> login(String email, pass);
  User getCurrentUser();
  bool isLoggedIn(); // If a logged in user is currently stored in app
}

class MockCitizenProvider extends CitizenProvider {
  User fakeUser = User("Jane", "jd@gmail.com", "1234");
  bool didLogIn;

  MockCitizenProvider() {
    didLogIn = false;
  }
  bool isLoggedIn() {
    return didLogIn;
  }


  @override
  User getCurrentUser() {
    if (didLogIn) {
      return fakeUser;
    } else {
      return null;
    }
  }

  @override
  Future<bool> login(String email, pass) async {
    if (fakeUser.email == email && fakeUser.password == pass) {
      didLogIn = true;
    }
    return (didLogIn);
  }

}

class APICitizenProvider extends CitizenProvider {
  //Actually calls api
  @override
  User getCurrentUser() {
    // TODO: implement getCurrentUser
    return null;
  }

  @override
  Future<bool> login(String user, pass) {
    // TODO: implement login
    return null;
  }

  @override
  bool isLoggedIn() {
    // TODO: implement isLoggedIn
    return null;
  }

}