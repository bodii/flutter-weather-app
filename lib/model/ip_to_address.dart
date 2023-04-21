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
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["rs"] = rs;
    _data["code"] = code;
    _data["address"] = address;
    _data["ip"] = ip;
    _data["isDomain"] = isDomain;
    return _data;
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
