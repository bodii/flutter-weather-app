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
        //  else if (state.status == ContinentsStatus.storeSaveSuccess) {
        // context.read<ContinentsBloc>().add(const ContinentsGeted());
        // debugPrint("geted...");
        // }
        // else if (state.status == ContinentsStatus.storeGetSuccess) {
        //   debugPrint("geted success...");
        //   debugPrint(state.continents?.toString());
        // }
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
                width: 350,
                height: 350,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(45)),
                  color: Colors.white,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20.0),
                      width: 320,
                      child: const Center(
                        child: Text(
                          '四季交迭，草木皆知\n'
                          '天气冷暖，风云变换\n'
                          '享受生活中，每一个舒服的温度\n'
                          '也或者，糟糕的坏天气\n'
                          '无论何事\n'
                          '尽在，春夏秋冬的季节里',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
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
