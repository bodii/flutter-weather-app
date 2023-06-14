import 'package:flutter/material.dart';
import 'package:weather_app/common/text_extension.dart';

Widget setCityPosition(
  BuildContext context,
  double left,
  double top,
  double fontSize,
  double ratio,
  String cityName,
) {
  return Positioned(
    left: left * ratio,
    top: top * ratio,
    child: Text(
      cityName,
      style: TextStyle(
        fontSize: (fontSize * ratio),
        color: Theme.of(context).colorScheme.primary,
      ),
    ).inkWellToWeatherInternational(context),
  );
}
