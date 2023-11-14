class CandidateRegisterModel {
  final String userType;
  final String name;
  final String patronimyc;
  final String surname;
  final String birthDate;
  final String city;
  final String contactNumber;
  final String email;

  CandidateRegisterModel(
      {required this.name,
      required this.patronimyc,
      required this.surname,
      required this.birthDate,
      required this.city,
      required this.contactNumber,
      required this.email,
      this.userType = "candidate"});
}
