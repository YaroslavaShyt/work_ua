class APIDatasource {
  static const url = "http://192.168.1.5:5000/";

  static const apiUrl = "${url}api/";
  static const registerUrl = "${apiUrl}register";
  static const loginUrl = "${apiUrl}login";

  static const userUrl = "${apiUrl}users";
  static const jobsUrl = "${apiUrl}jobs";

  static const cvsUrl = "${apiUrl}cvs/";
  static const createCvUrl = "${cvsUrl}createCV";
  static const updateCvUrl = "${cvsUrl}updateCV";
  static const getCvUrl = "${cvsUrl}getCV";
  static const getAllCvUrl = "${cvsUrl}getAllCV";
  static const deleteCvUrl = "${cvsUrl}deleteCV";
}
