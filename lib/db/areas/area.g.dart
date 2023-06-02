// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'area.dart';

// **************************************************************************
// RealmObjectGenerator
// **************************************************************************

class AreaRealm extends _AreaRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  AreaRealm(
    String province, {
    Iterable<CityListRealm> cityList = const [],
  }) {
    RealmObjectBase.set(this, 'province', province);
    RealmObjectBase.set<RealmList<CityListRealm>>(
        this, 'cityList', RealmList<CityListRealm>(cityList));
  }

  AreaRealm._();

  @override
  String get province =>
      RealmObjectBase.get<String>(this, 'province') as String;
  @override
  set province(String value) => RealmObjectBase.set(this, 'province', value);

  @override
  RealmList<CityListRealm> get cityList =>
      RealmObjectBase.get<CityListRealm>(this, 'cityList')
          as RealmList<CityListRealm>;
  @override
  set cityList(covariant RealmList<CityListRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<AreaRealm>> get changes =>
      RealmObjectBase.getChanges<AreaRealm>(this);

  @override
  AreaRealm freeze() => RealmObjectBase.freezeObject<AreaRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(AreaRealm._);
    return const SchemaObject(ObjectType.realmObject, AreaRealm, 'AreaRealm', [
      SchemaProperty('province', RealmPropertyType.string),
      SchemaProperty('cityList', RealmPropertyType.object,
          linkTarget: 'CityListRealm',
          collectionType: RealmCollectionType.list),
    ]);
  }
}

class CityListRealm extends _CityListRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  CityListRealm(
    String city, {
    Iterable<DisListRealm> disList = const [],
  }) {
    RealmObjectBase.set(this, 'city', city);
    RealmObjectBase.set<RealmList<DisListRealm>>(
        this, 'disList', RealmList<DisListRealm>(disList));
  }

  CityListRealm._();

  @override
  String get city => RealmObjectBase.get<String>(this, 'city') as String;
  @override
  set city(String value) => RealmObjectBase.set(this, 'city', value);

  @override
  RealmList<DisListRealm> get disList =>
      RealmObjectBase.get<DisListRealm>(this, 'disList')
          as RealmList<DisListRealm>;
  @override
  set disList(covariant RealmList<DisListRealm> value) =>
      throw RealmUnsupportedSetError();

  @override
  Stream<RealmObjectChanges<CityListRealm>> get changes =>
      RealmObjectBase.getChanges<CityListRealm>(this);

  @override
  CityListRealm freeze() => RealmObjectBase.freezeObject<CityListRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(CityListRealm._);
    return const SchemaObject(
        ObjectType.realmObject, CityListRealm, 'CityListRealm', [
      SchemaProperty('city', RealmPropertyType.string),
      SchemaProperty('disList', RealmPropertyType.object,
          linkTarget: 'DisListRealm', collectionType: RealmCollectionType.list),
    ]);
  }
}

class DisListRealm extends _DisListRealm
    with RealmEntity, RealmObjectBase, RealmObject {
  DisListRealm(
    String district,
    String stationid,
  ) {
    RealmObjectBase.set(this, 'district', district);
    RealmObjectBase.set(this, 'stationid', stationid);
  }

  DisListRealm._();

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
  Stream<RealmObjectChanges<DisListRealm>> get changes =>
      RealmObjectBase.getChanges<DisListRealm>(this);

  @override
  DisListRealm freeze() => RealmObjectBase.freezeObject<DisListRealm>(this);

  static SchemaObject get schema => _schema ??= _initSchema();
  static SchemaObject? _schema;
  static SchemaObject _initSchema() {
    RealmObjectBase.registerFactory(DisListRealm._);
    return const SchemaObject(
        ObjectType.realmObject, DisListRealm, 'DisListRealm', [
      SchemaProperty('district', RealmPropertyType.string),
      SchemaProperty('stationid', RealmPropertyType.string),
    ]);
  }
}
