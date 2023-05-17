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
    return BlocListener<ContinentsBloc, ContinentsState>(
      listenWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == ContinentsStatus.storeGetSuccess,
      listener: (context, state) {
        debugPrint(state.status.toString());
        debugPrint("++++");
      },
      child: SafeArea(
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
                        '四季交迭，风雨变换\n'
                        '天气冷暖，草木皆知\n'
                        '享受生活中每一个美好的时刻\n'
                        '也或者坏天气\n'
                        '无论是，春夏秋冬',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const Spacer(flex: 1),
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


