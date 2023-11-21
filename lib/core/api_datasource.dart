class APIDatasource{
  static const url = "http://192.168.1.4:5000/";

  static const authUrl = "${url}api/";
  static const registerUrl = "${authUrl}register";
  static const loginUrl = "${authUrl}login";

  static const userUrl = "${url}users";
  static const jobsUrl = "${url}jobs";
}