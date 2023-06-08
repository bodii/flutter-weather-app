class AreaFormat {
  final String province;
  final String city;
  final String district;
  final String stationid;

  const AreaFormat({
    required this.province,
    required this.city,
    required this.district,
    required this.stationid,
  });

  AreaFormat copyWith({
    String? province,
    String? city,
    String? district,
    String? stationid,
  }) =>
      AreaFormat(
        province: province ?? this.province,
        city: city ?? this.city,
        district: district ?? this.district,
        stationid: stationid ?? this.stationid,
      );
}
