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
          title: const Text('位置'),
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
    return BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Center(
          child: Container(
            alignment: Alignment.center,
            width: 400,
            height: 450,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 120,
                  height: 120,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(120),
                  ),
                  child: const Icon(
                    Icons.location_on,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const Column(
                  children: [
                    Text(
                      '需要定位权限',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      '请开启位置权限，以获取更准确的天气信息',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 300,
                  height: 60,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<LocationCubit>().changePermission();
                      // context.read<LocationCubit>().getCityInfo();

                      // context.replaceNamed('/weather/list');
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(60),
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                    child: const Text(
                      '同意',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
