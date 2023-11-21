class CandidateRegisterModel {
  final String usertype;
  final String name;
  final String patronimyc;
  final String surname;
  final String birthDate;
  final String city;
  final String contactNumber;
  final String email;
  final String password;
  final bool isAdmin;
  final String profilePhoto;

  CandidateRegisterModel(
      {required this.name,
      required this.patronimyc,
      required this.surname,
      required this.birthDate,
      required this.city,
      required this.contactNumber,
      required this.email,
      this.usertype = "candidate",
      required this.password,
      this.isAdmin = false,
      this.profilePhoto = 'asdlkjahsflksajdhfljasfhlsjahfdlsjflasjhdfjhdlkfhj'});

  Map<String, dynamic> get modelMap => {
        "usertype": usertype,
        "name": name,
        "surname": surname,
        "patronymic": patronimyc,
        "birthDate": birthDate,
        "city": city,
        "contactNumber": contactNumber,
        "email": email,
        "socialMediaLinks": "",
        "password": password,
        "isAdmin": isAdmin,
        "profilePhoto": profilePhoto
      };
}
