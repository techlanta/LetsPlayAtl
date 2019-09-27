import 'package:lets_play_atl/model/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class EventOrganizerProvider {

}


abstract class CitizenProvider {
  Future<bool> login(String email, pass);
  User getCurrentUser();
  bool isLoggedIn(); // If a logged in user is currently stored in app
}

class APICitizenProvider extends CitizenProvider {
  static const apiBase = "http://ec2-13-58-237-110.us-east-2.compute.amazonaws.com:5000";
  User currentUser;
  @override
  User getCurrentUser() {
    return currentUser;
  }

  @override
  bool isLoggedIn() {
    return currentUser != null;
  }

  @override
  Future<bool> login(String email, pass) async {
    Map<String, String> body = {}, header = {};

    body["password"] = pass;
    body["username"] = email;

    header["Content-Type"] = "application/json";

    http.Response login = await http.post(apiBase + "/check_password",
        body: json.encode(body),
        headers: header
    );
    Map<dynamic, dynamic> loginBody = jsonDecode(login.body);
    return loginBody["status"];
  }

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
