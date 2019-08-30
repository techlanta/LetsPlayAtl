class User {
  String name;
  String email;
  String password;

  User(this.name, this.email, this.password);

  bool login(email, password) {
    bool status;
    //check to see if login works
    return status;
  }

}

class Admin extends User {
  bool permissions; //admin permissions, whether user is an admin or not
  Admin(this.permissions, String name, String email, String password):super(name, email, password);
}