import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/pages/get_location/index.dart';
import 'package:weather_app/pages/welcome/bloc/continents_bloc.dart';
import 'package:weather_app/pages/welcome/widgets/europe_map_widget.dart';

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
            const EuropeMapWidget(),
            const SizedBox(
              height: 5,
            ),
            Stack(
              children: [
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10),
                            width: 10,
                            height: 10,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
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
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => const GetLocation()));
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

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('登录'),
      content: SizedBox(
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: "邮箱",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.mail,
                    color: Theme.of(context).primaryColor,
                    size: 18.0,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 40,
              child: TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "密码",
                  border: const OutlineInputBorder(),
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Theme.of(context).primaryColor,
                    size: 18.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        ElevatedButton(
          child: const Text("取消"),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
        ),
        ElevatedButton(
          child: const Text("确定"),
          onPressed: () {
            Navigator.of(context).pop(true);
          },
        ),
      ],
    );
  }
}
