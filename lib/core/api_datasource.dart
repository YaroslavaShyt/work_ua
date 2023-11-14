class APIDatasource{
  static const url = "http://localhost:5000/";

  static const authUrl = "${url}api/";
  static const registerUrl = "${authUrl}register";
  static const loginCandidateUrl = "${authUrl}login_candidate";

  static const userUrl = "${url}users";
  static const jobsUrl = "${url}jobs";
}