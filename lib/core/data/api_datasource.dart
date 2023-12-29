class APIDatasource {
  static const url = "http://192.168.1.5:5000/";

  static const apiUrl = "${url}api/";
  static const registerUrl = "${apiUrl}register";
  static const loginUrl = "${apiUrl}login";

  static const userUrl = "${apiUrl}users/";

  static const jobsUrl = "${apiUrl}jobs";
  static const getJobs = "$jobsUrl?searchString=";
  static const getJob = "$jobsUrl/";
  static const createJob = "$jobsUrl/";
  static const updateJob = "$jobsUrl/";
  static const deleteJob = "$jobsUrl/";

  static const cvsUrl = "${apiUrl}cvs/";
  static const createCvUrl = "${cvsUrl}createCV";
  static const updateCvUrl = "${cvsUrl}updateCV";
  static const getCvUrl = "${cvsUrl}getCV";
  static const getAllCvUrl = "${cvsUrl}getAllCV";
  static const getAllCvQuery = "${cvsUrl}getAllCVQuery";
  static const deleteCvUrl = "${cvsUrl}deleteCV";

  static const chatsUrl = "${apiUrl}chats/";

  static const messagesUrl = "${apiUrl}messages/";
}
