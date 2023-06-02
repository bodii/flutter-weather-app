import 'package:realm/realm.dart';

part 'area.g.dart';

@RealmModel()
class _AreaRealm {
  // 省或直辖市
  late String province;
  // 包含的城市列表
  late List<_CityListRealm> cityList;
}

@RealmModel()
class _CityListRealm {
  // 市、县
  late String city;
  // 城区或乡镇
  late List<_DisListRealm> disList;
}

@RealmModel()
class _DisListRealm {
  // 城区或乡镇
  late String district;
  // 城区或乡镇id
  late String stationid;
}
