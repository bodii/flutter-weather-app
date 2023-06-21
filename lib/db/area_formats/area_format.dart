import 'package:realm/realm.dart';

part 'area_format.g.dart';

@RealmModel()
class _AreaFormatRealm {
  // 省或直辖市
  late String province;
  // 市、县
  late String city;
  // 城区或乡镇
  late String district;
  // 城区或乡镇id
  late String stationid;
}

Realm generateAreaFormatRealm() {
// 设置realm存储对象
  final config = Configuration.local(
    [
      AreaFormatRealm.schema,
    ],
    // path: './assets/realm/area.realm',
  );
  final Realm areaRealm = Realm(config);

  return areaRealm;
}
