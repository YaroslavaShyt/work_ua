class LoginModel {
  final String email;
  final String password;
  String usertype;

  LoginModel(
      {required this.email,
      required this.password,
      this.usertype = "candidate"});

  Map<String, dynamic> get modelMap =>
      {"email": email, "password": password, "usertype": usertype};
}
