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
      create: (_) => ContinentsBloc()..add(const ContinentsLoaded()),
      child: const WelcomeBlocView(),
    );
  }
}

class WelcomeBlocView extends StatelessWidget {
  const WelcomeBlocView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContinentsBloc, ContinentsState>(
      buildWhen: (previous, current) =>
          previous.status != current.status &&
          current.status == ContinentsStatus.storeSaveSuccess,
      builder: (context, state) {
        if (state.status == ContinentsStatus.httpSuccess) {
          context.read<ContinentsBloc>().add(const ContinentsSaved());
          debugPrint("saved...");
        }
        debugPrint(state.status.toString());
        return const WelcomeBlocListenerView();
      },
    );
  }
}

class WelcomeBlocListenerView extends StatelessWidget {
  const WelcomeBlocListenerView({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenWidth = screenSize.width;
    final double screenHeight = screenSize.height;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('欢迎'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const WorldsWidget(),
              Container(
                alignment: Alignment.center,
                width: screenWidth * 0.8,
                height: screenWidth * 0.8,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      width: screenWidth * 0.8,
                      child: Center(
                        child: Text(
                          '四季交迭，草木皆知\n'
                          '天气冷暖，风云变换\n'
                          '享受生活中，每一个舒服的温度\n'
                          '也或者，糟糕的坏天气\n'
                          '无论何事\n'
                          '尽在，春夏秋冬的季节里',
                          style: TextStyle(
                            fontSize:
                                Theme.of(context).textTheme.bodyLarge!.fontSize,
                            color: Theme.of(context).colorScheme.outline,
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: () {
                        context.pushNamed('/location');
                      },
                      style: FilledButton.styleFrom(
                          padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.28,
                            vertical: screenHeight * 0.015,
                          ),
                          textStyle: TextStyle(
                            fontSize: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .fontSize,
                          )),
                      child: const Text('开始'),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have an account ? '),
                        TextButton(
                          onPressed: () {
                            _dialogLogin(context);
                          },
                          child: const Text(
                            'Log in',
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

  void _dialogLogin(BuildContext context) async {
    var result = await showDialog(
      context: context,
      builder: (context) {
        return const LoginWidget();
      },
    );

    debugPrint("result: $result");
  }
}
