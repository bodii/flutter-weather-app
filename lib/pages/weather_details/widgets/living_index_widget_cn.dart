import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:weather_app/model/sun_and_moon.dart';

class LivingIndexCnWidget extends StatelessWidget {
  const LivingIndexCnWidget({
    super.key,
    required this.smi,
  });

  final SunAndMoonAndIndex smi;

  @override
  Widget build(BuildContext context) {
    const Map<String, String> indexToIcon = {
      '限行': 'car.svg',
      '晨练指数': 'morning_exercise.svg',
      '穿衣指数': 'clothes.svg',
      '钓鱼指数': 'fishing.svg',
      '感冒指数': 'coughing_ill_patient.svg',
      '化妆指数': 'mirror_salon.svg',
      '紫外线强度指数': 'uv_spf50.svg',
      '洗车指数': 'car_wash.svg',
      '运动指数': 'exercise_game_sport.svg',
    };

    return Container(
      width: 380,
      height: 365,
      padding: const EdgeInsets.symmetric(vertical: 20),
      margin: const EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        // backgroundBlendMode: BlendMode.colorBurn,
        color: Theme.of(context).colorScheme.outline.withOpacity(.1),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        childAspectRatio: 1.1,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(vertical: 0),
        children: smi.index!
            .map((e) => LivingIndexCnItem(
                icon: indexToIcon[e.indexTypeCh!] ?? 'car.svg', item: e))
            .toList(),
      ),
    );
  }
}

class LivingIndexCnItem extends StatelessWidget {
  const LivingIndexCnItem({
    super.key,
    required this.icon,
    required this.item,
  });

  final Index item;
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
            colorFilter: ColorFilter.mode(
              Theme.of(context).colorScheme.inversePrimary,
              BlendMode.srcIn,
            ),
          ),
        ),
        Text(
          item.indexTypeCh!,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize,
            color: Theme.of(context).colorScheme.tertiary.withOpacity(0.7),
          ),
        ),
        Text(
          item.indexLevel!,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.bodySmall!.fontSize,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ),
      ],
    );
  }
}
