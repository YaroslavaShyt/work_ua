class SuccessModel{
  bool success;
  String message;
  int statusCode;

  SuccessModel(this.success, this.message, this.statusCode);

  factory SuccessModel.fromJson(Map<String, dynamic> JSON){
    return SuccessModel(JSON["success"], JSON["message"], JSON["statusCode"]);
  }
}