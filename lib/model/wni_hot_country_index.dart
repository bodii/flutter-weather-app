class WniHotCountryIndex {
  late final String indexTypeCh;
  late final String indexLevel;
  late final String indexContent;

  WniHotCountryIndex({
    required this.indexTypeCh,
    required this.indexLevel,
    required this.indexContent,
  });

  WniHotCountryIndex.fromJson(Map<String, dynamic> json) {
    indexTypeCh = json['index_type_ch']!.toString();
    indexLevel = json['index_level']!.toString();
    indexContent = json['index_content']!.toString();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['index_type_ch'] = indexTypeCh;
    data['index_level'] = indexLevel;
    data['index_content'] = indexContent;
    return data;
  }
}
