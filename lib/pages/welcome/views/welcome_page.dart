import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:weather_app/pages/welcome/bloc/continents_bloc.dart';
import 'package:weather_app/pages/welcome/widgets/index.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ContinentsBloc()..add(const ContinentsGeted()),
      child: const WelcomeView(),
    );
  }
}

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('欢迎'),
        ),
        body: Column(
          children: [
            const WorldsWidget(),
            Container(
              alignment: Alignment.center,
              width: 350,
              height: 350,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(flex: 1),
                  const SizedBox(
                    width: 320,
                    child: Text(
                      '关注天气变化，应对冷暖人生\n'
                      '有时，忙碌的生活，从日出到日落\n'
                      '有一种温度，会让你感知到生命在悄然的变化\n'
                      '有一种风景，会使你被大自然的力量所引领...\n',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 300,
                    height: 60,
                    child: ElevatedButton(
                      onPressed: () {
                        context.pushNamed('/location');
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(60),
                        ),
                        backgroundColor: Theme.of(context).primaryColor,
                      ),
                      child: const Text(
                        '开始',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Already have an account ? '),
                      TextButton(
                        onPressed: () {
                          // Future<List<City>> citys = getChinaAllCityList();
                          _dialogLogin(context);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.white,
                        ),
                        child: const Text(
                          'Log in',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  _dialogLogin(BuildContext context) async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return const LoginWidget();
      },
    );

    debugPrint("result: $result");
  }
}

/*
BlocBuilder<ContinentsBloc, ContinentsState>(
                    builder: (context, state) {
                      if (state.status == ContinentsStatus.initial) {
                        context
                            .read<ContinentsBloc>()
                            .add(const ContinentsLoaded());
                      } else if (state.status == ContinentsStatus.httpSuccess) {
                        context
                            .read<ContinentsBloc>()
                            .add(const ContinentsSaved());
                      } else if (state.status ==
                          ContinentsStatus.storeSaveSuccess) {
                        context
                            .read<ContinentsBloc>()
                            .add(const ContinentsGeted());
                      } else if (state.status ==
                          ContinentsStatus.storeGetSuccess) {
                        debugPrint(state.continents?.toJson().toString());
                      }
                    }),
*/


