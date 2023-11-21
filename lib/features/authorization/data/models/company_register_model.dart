class CompanyRegisterModel {
  final String usertype;
  final String name;
  final String title;
  final String workersQuantity;
  final String serviceType;
  final String description;
  final String contactNumber;
  final String email;
  final String password;
  final bool isAdmin;
  final String profilePhoto;

  CompanyRegisterModel(
      {required this.name,
      required this.title,
      required this.workersQuantity,
      required this.serviceType,
      required this.description,
      required this.contactNumber,
      required this.email,
      this.usertype = "company",
      required this.password,
      this.isAdmin = false,
      this.profilePhoto =
          'asdlkjahsflksajdhfljasfhlsjahfdlsjflasjhdfjhdlkfhj'});

  Map<String, dynamic> get modelMap => {
        "usertype": "company",
        "name": name,
        "title": title,
        "workersQuantity": workersQuantity,
        "serviceType": serviceType,
        "description": description,
        "contactNumber": contactNumber,
        "email": email,
        "socialMediaLinks": "",
        "password": password,
        "isAdmin": isAdmin,
        "profilePhoto": profilePhoto
      };
}
