import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/wni_hot_country_index.dart';

class LivingIndexWidget extends StatelessWidget {
  const LivingIndexWidget({
    super.key,
    required this.wniIndexs,
  });

  final List<WniHotCountryIndex> wniIndexs;

  @override
  Widget build(BuildContext context) {
    const Map<String, String> indexToIcon = {
      '晨练指数': 'morning_exercise.svg',
      '钓鱼指数': 'fishing.svg',
      '感冒指数': 'coughing_ill_patient.svg',
      '跑步指数': 'run.svg',
      '骑车指数': 'cycling.svg',
      '洗车指数': 'car_wash.svg',
      '雨伞指数': 'umbrella.svg',
    };

    return Container(
      width: 380,
      height: 365,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // backgroundBlendMode: BlendMode.colorBurn,
        color: Colors.grey[100],
      ),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: wniIndexs
            .map((e) => LivingIndexItem(
                icon: indexToIcon[e.indexTypeCh] ?? 'car.svg', item: e))
            .toList(),
      ),
    );
  }
}

class LivingIndexItem extends StatelessWidget {
  const LivingIndexItem({
    super.key,
    required this.icon,
    required this.item,
  });

  final WniHotCountryIndex item;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 42,
          height: 42,
          margin: const EdgeInsets.only(bottom: 8),
          child: SvgPicture.asset(
            'assets/weather_icon/icons/$icon',
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
        ),
        Text(
          item.indexTypeCh,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.black45,
          ),
        ),
        Text(
          item.indexLevel,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
          ),
        ),
      ],
    );
  }
}