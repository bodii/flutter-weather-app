import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:realm/realm.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/db/areas/area.dart';
import 'package:weather_app/model/area.dart';
import 'package:weather_app/model/win_hot_city.dart';

part 'continents_event.dart';
part 'continents_state.dart';

class ContinentsBloc extends Bloc<ContinentsEvent, ContinentsState> {
  ContinentsBloc() : super(const ContinentsState()) {
    on<ContinentsLoaded>(_onContinentsRequestd);
    on<ContinentsGeted>(_onContinentsStoreGeted);
    on<ContinentsSaved>(_onContinentsStoreSaved);
  }

  Future<void> _onContinentsRequestd(
    ContinentsLoaded event,
    Emitter<ContinentsState> emit,
  ) async {
    // if (![
    //   ContinentsStatus.initial,
    //   ContinentsStatus.storeGetFailure,
    //   ContinentsStatus.storeSaveFailure,
    // ].contains(state.status)) {
    //   return;
    // }

    emit(state.copyWith(status: ContinentsStatus.httpLoading));

    debugPrint(state.status.toString());
    try {
      final WniHotCityList wniHotCityList = await getWniHotCity();
      final WniHotCityNameId wniHotCityNameId =
          WniHotCityNameId.fromJson(wniHotCityList);
      final Map<String, String> continents = wniHotCityNameId.nameIds!;

      final config = Configuration.local(
        [
          AreaRealm.schema,
          CityListRealm.schema,
          DisListRealm.schema,
        ],
        // path: './assets/realm/area.realm',
      );
      final Realm areaRealm = Realm(config);
      // areaRealm.write(() => areaRealm.deleteAll<AreaRealm>());

      RealmResults<AreaRealm> areaResult = areaRealm.all<AreaRealm>();
      debugPrint("areaResult is empty:${areaResult.isEmpty}");
      if (areaResult.isEmpty) {
        final List<Area> areas = await getAreas();

        final List<AreaRealm> areaList = [];
        for (Area area in areas) {
          final List<CityListRealm> cityList = [];
          for (CityList citys in area.cityList!) {
            final List<DisListRealm> disList = [];

            for (DisList dis in citys.disList!) {
              disList.add(DisListRealm(dis.district!, dis.stationid!));
            }

            cityList.add(CityListRealm(citys.city!, disList: disList));
          }

          areaList.add(AreaRealm(area.province!, cityList: cityList));
        }
        areaRealm.write(() {
          areaRealm.addAll(areaList);
        });
      }

      emit(
        state.copyWith(
          status: ContinentsStatus.httpSuccess,
          continents: continents,
        ),
      );
    } catch (e, stack) {
      debugPrint("error:");
      debugPrint(e.toString());
      debugPrint(stack.toString());
      emit(state.copyWith(status: ContinentsStatus.httpfailure));
    }
  }

  Future<void> _onContinentsStoreSaved(
    ContinentsSaved event,
    Emitter<ContinentsState> emit,
  ) async {
    // if (state.status != ContinentsStatus.httpSuccess) {
    //   return;
    // }

    emit(state.copyWith(status: ContinentsStatus.storeSaveInitial));

    final SharedPreferences store = await SharedPreferences.getInstance();
    emit(state.copyWith(status: ContinentsStatus.storeSaving));
    final isSaved = await store.setString(
        "wni_hot_city_name_ids", jsonEncode(state.continents));

    if (isSaved) {
      emit(state.copyWith(status: ContinentsStatus.storeSaveSuccess));
    } else {
      emit(state.copyWith(status: ContinentsStatus.storeSaveFailure));
    }
  }

  Future<void> _onContinentsStoreGeted(
    ContinentsGeted event,
    Emitter<ContinentsState> emit,
  ) async {
    // if (state.status != ContinentsStatus.storeSaveSuccess) {
    //   return;
    // }

    emit(state.copyWith(status: ContinentsStatus.storeGetInitial));

    Map<String, String>? continents;

    emit(state.copyWith(status: ContinentsStatus.storeGetting));
    SharedPreferences.getInstance().then((store) {
      final String? continentsStr = store.getString("wni_hot_city_name_ids");
      if (continentsStr != null) {
        continents = jsonDecode(continentsStr);
      }
    });

    if (continents != null) {
      emit(state.copyWith(
        status: ContinentsStatus.storeGetSuccess,
        continents: continents,
      ));
    } else {
      emit(state.copyWith(status: ContinentsStatus.storeGetFailure));
    }
  }
}
