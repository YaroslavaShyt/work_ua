class UserRegisterModel {
  final String? id;
  final String usertype;
  final String name;
  final String city;
  final String contactNumber;
  final String email;
  final String? password;

  final String? patronimyc;
  final String? surname;
  final String? birthDate;

  final String? title;
  final String? workersQuantity;
  final String? serviceType;
  final String? description;

  UserRegisterModel(
      {this.usertype = "candidate",
      this.id,
      required this.name,
      required this.city,
      required this.contactNumber,
      required this.email,
      this.password,
      this.patronimyc,
      this.surname,
      this.birthDate,
      this.title,
      this.description,
      this.serviceType,
      this.workersQuantity});

  Map<String, dynamic> get modelMap => {
        "usertype": usertype,
        "name": name,
        "city": city,
        "contactNumber": contactNumber,
        "email": email,
        "password": password,
        "surname": surname,
        "patronymic": patronimyc,
        "birthDate": birthDate,
        "title": title,
        "description": description,
        "serviceType": serviceType,
        "workersQuantity": workersQuantity
      };
}
