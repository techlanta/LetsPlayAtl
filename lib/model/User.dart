class User {
  String name;
  String email;
  String password;
  bool isAdmin;

  User(this.name, this.email, this.password, {this.isAdmin}) {
    if (this.isAdmin == null) {
      this.isAdmin = false;
    }
  }

  bool login(email, password) {
    bool status;
    //check to see if login works
    return status;
  }

}