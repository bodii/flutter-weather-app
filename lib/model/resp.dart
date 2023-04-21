class Resp {
  int? code;
  dynamic data;
  String? message;
  dynamic pageNum;

  Resp({this.code, this.data, this.message, this.pageNum});

  Resp.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    data = json['data'];
    message = json['message'];
    pageNum = json['pageNum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['code'] = code;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    data['pageNum'] = pageNum;
    return data;
  }
}
