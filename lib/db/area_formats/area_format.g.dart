// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area_format.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class AreaFormatRealm extends _AreaFormatRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  AreaFormatRealm(
    String province,
    String city,
    String district,
    String stationid,
  ) {
    RealmObjectBase.set(this, 'province', province);
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set(this, 'district', district);
    RealmObjectBase.set(this, 'stationid', stationid);
  }

  AreaFormatRealm._();

  @override
  String get province =>
      RealmObjectBase.get<String>(this, 'province') as String;
  @override
  set province(String value) => RealmObjectBase.set(this, 'province', value);

  @override
  String get city => RealmObjectBase.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObjectBase.set(this, 'city', value);

  @override
  String get district =>
      RealmObjectBase.get<String>(this, 'district') as String;
  @override
  set district(String value) => RealmObjectBase.set(this, 'district', value);

  @override
  String get stationid =>
      RealmObjectBase.get<String>(this, 'stationid') as String;
  @override
  set stationid(String value) => RealmObjectBase.set(this, 'stationid', value);

  @override
  Stream<RealmObjectChanges<AreaFormatRealm>> get changes =>
      RealmObjectBase.getChanges<AreaFormatRealm>(this);

  @override
  AreaFormatRealm freeze() =>
      RealmObjectBase.freezeObject<AreaFormatRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AreaFormatRealm._);
    return const SchemaObject(
        ObjectType.realmObject, AreaFormatRealm, 'AreaFormatRealm', [
      SchemaProperty('province', RealmPropertyType.string),
      SchemaProperty('city', RealmPropertyType.string),
      SchemaProperty('district', RealmPropertyType.string),
      SchemaProperty('stationid', RealmPropertyType.string),
    ]);
  }
}
