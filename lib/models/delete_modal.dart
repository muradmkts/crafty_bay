class DeleteModal {
  String? msg;
  int? data;

  DeleteModal({this.msg, this.data});

  DeleteModal.fromJson(Map<String, dynamic> json) {
    msg = json['msg'];
    data = json['data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['data'] = this.data;
    return data;
  }
}
