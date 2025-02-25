class AuthData {
  String? msg;
  String? token;

  AuthData({this.msg, this.token});

  AuthData.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    token = json['data'];
  }


}
