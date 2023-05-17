import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension TextExtension on Text {
  // InkWell inkWell(void Function()? onTap) {
  //   return InkWell(
  //     onTap: onTap,
  //     child: this,
  //   );
  // }

  InkWell inkWellToWeatherInternational(BuildContext context) {
    return InkWell(
      onTap: () {
        if (data!.isNotEmpty) {
          context.pushNamed('/weather/international',
              pathParameters: {'city': data!});
        }
      },
      child: this,
    );
  }
}
