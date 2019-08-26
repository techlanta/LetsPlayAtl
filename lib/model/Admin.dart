import 'User.dart';

class Admin extends User {
  bool permissions; //admin permissions, whether user is an admin or not
  Admin(this.permissions, String name, String email, String password):super(name, email, password);
}