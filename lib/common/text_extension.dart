import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/welcome/bloc/continents_bloc.dart';

extension TextExtension on Text {
  Widget inkWellToWeatherInternational(BuildContext context) {
    if (data == null) {
      throw Exception('data value is empty of Text widget!');
    }

    // 获取当前页面bloc的处理状态
    ContinentsState state = context.watch<ContinentsBloc>().state;

    if (state.status != ContinentsStatus.httpSuccess) {
      return this;
    }

    Map<String, String> continents = state.continents!;
    String? cityId = continents[data!];

    if (cityId == null) {
      debugPrint('|${data!}|');
      throw Exception('cityId is null');
    }

    return InkWell(
      onTap: () {
        context.pushNamed('/weather/detail/international', pathParameters: {
          'city': data!,
          'cityId': cityId,
        });
      },
      child: this,
    );
  }
}
