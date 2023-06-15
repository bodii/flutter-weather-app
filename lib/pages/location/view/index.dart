import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/location/cubit/location_cubit.dart';

class Location extends StatelessWidget {
  const Location({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(children: [
            Icon(
              Icons.location_on_sharp,
              color: Theme.of(context).colorScheme.primary,
            ),
            const Text('获取当前位置'),
          ]),
        ),
        body: BlocProvider(
          create: (context) => LocationCubit()..getPermisssion(),
          child: const LocationCubitView(),
        ),
      ),
    );
  }
}

class LocationCubitView extends StatelessWidget {
  const LocationCubitView({super.key});

  @override
  Widget build(BuildContext context) {
    LocationState stateV = context.watch<LocationCubit>().state;
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) {
        if (state.status.hasPermission) {
          context.read<LocationCubit>().getCityInfo();
        } else if (state.status.isSuccess) {
          context.replaceNamed('/weather/list');
        }
      },
      child: stateV.status.notPermission
          ? const LocationPermissionView()
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}

class LocationPermissionView extends StatelessWidget {
  const LocationPermissionView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return BlocBuilder<LocationCubit, LocationState>(builder: (context, state) {
      return Center(
        child: Container(
          alignment: Alignment.center,
          height: screenHeight * 0.5,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CircleAvatar(
                radius: screenWidth * 0.16,
                backgroundColor: Theme.of(context).colorScheme.outline,
                child: ClipOval(
                  child: Icon(
                    Icons.location_on,
                    size: screenWidth * 0.18,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    '需要定位权限',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.titleLarge!.fontSize,
                    ),
                  ),
                  Text(
                    '请开启位置权限，以获取更准确的天气信息',
                    style: TextStyle(
                      fontSize:
                          Theme.of(context).textTheme.bodyMedium!.fontSize,
                      color: Theme.of(context).colorScheme.outlineVariant,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: () {
                  context.read<LocationCubit>().changePermission();
                  // context.read<LocationCubit>().getCityInfo();

                  // context.replaceNamed('/weather/list');
                },
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.28,
                    vertical: screenHeight * 0.017,
                  ),
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(
                  '同意',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: Theme.of(context).textTheme.titleLarge!.fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
