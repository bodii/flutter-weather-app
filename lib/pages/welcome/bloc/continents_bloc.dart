import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/api/response.dart';
import 'package:weather_app/model/win_hot_country_list.dart';

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
    if (![
      ContinentsStatus.initial,
      ContinentsStatus.storeGetFailure,
      ContinentsStatus.storeSaveFailure,
    ].contains(state.status)) {
      return;
    }

    emit(state.copyWith(status: ContinentsStatus.httpLoading));
    print(state.status);
    try {
      final WniHotCountryList continents = await getWniHotCountryGroupBy();
      emit(
        state.copyWith(
          status: ContinentsStatus.httpSuccess,
          continents: continents,
        ),
      );
    } catch (e, stack) {
      print("error:");
      print(e);
      print(stack);
      emit(state.copyWith(status: ContinentsStatus.httpfailure));
    }
  }

  Future<void> _onContinentsStoreSaved(
    ContinentsSaved event,
    Emitter<ContinentsState> emit,
  ) async {
    if (state.status != ContinentsStatus.httpSuccess) {
      return;
    }

    emit(state.copyWith(status: ContinentsStatus.storeSaveInitial));

    final SharedPreferences store = await SharedPreferences.getInstance();
    emit(state.copyWith(status: ContinentsStatus.storeSaving));
    final isSaved =
        await store.setString("continents", jsonEncode(state.continents));

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
    if (state.status != ContinentsStatus.storeSaveSuccess) {
      return;
    }

    emit(state.copyWith(status: ContinentsStatus.storeGetInitial));

    SharedPreferences.getInstance().then((store) {
      emit(state.copyWith(status: ContinentsStatus.storeGetting));
      final String? continentsStr = store.getString("continents");
      if (continentsStr != null) {
        WniHotCountryList continents =
            WniHotCountryList.fromJson(jsonDecode(continentsStr));
        emit(state.copyWith(
          status: ContinentsStatus.storeGetSuccess,
          continents: continents,
        ));
      } else {
        emit(state.copyWith(status: ContinentsStatus.storeGetFailure));
      }
    });
  }
}
