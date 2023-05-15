class IpAndAddress {
  int? rs;
  int? code;
  String? address;
  String? ip;
  int? isDomain;

  IpAndAddress({this.rs, this.code, this.address, this.ip, this.isDomain});

  IpAndAddress.fromJson(Map<String, dynamic> json) {
    rs = json["rs"];
    code = json["code"];
    address = json["address"];
    ip = json["ip"];
    isDomain = json["isDomain"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["rs"] = rs;
    data["code"] = code;
    data["address"] = address;
    data["ip"] = ip;
    data["isDomain"] = isDomain;
    return data;
  }

  IpAndAddress copyWith({
    int? rs,
    int? code,
    String? address,
    String? ip,
    int? isDomain,
  }) =>
      IpAndAddress(
        rs: rs ?? this.rs,
        code: code ?? this.code,
        address: address ?? this.address,
        ip: ip ?? this.ip,
        isDomain: isDomain ?? this.isDomain,
      );
}
