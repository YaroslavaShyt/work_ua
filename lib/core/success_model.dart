class SuccessModel{
  bool success;
  String message;
  Map<String, dynamic> data;

  SuccessModel(this.success, this.message, this.data);

  factory SuccessModel.fromJson(Map<String, dynamic> JSON){
    return SuccessModel(JSON["success"], JSON["message"], JSON["data"]);
  }
}