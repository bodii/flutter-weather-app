import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectFailureWidget extends StatefulWidget {
  const ConnectFailureWidget({super.key});

  @override
  ConnectFailureWidgetState createState() => ConnectFailureWidgetState();
}

class ConnectFailureWidgetState extends State<ConnectFailureWidget> {
  ConnectivityResult currentResult = ConnectivityResult.none;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FutureBuilder(
          future: getConnect(),
          builder: (context, snapshot) {
            if (snapshot.hasData && !snapshot.data!) {
              return popupFailureWindow();
            }

            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }

  Widget popupFailureWindow() {
    Size screenSize = MediaQuery.sizeOf(context);
    return Container(
      width: screenSize.width * 0.5,
      height: screenSize.height * 0.08,
      decoration: BoxDecoration(
        backgroundBlendMode: BlendMode.overlay,
      ),
      child: const Text('connect failure'),
    );
  }

  Future<bool> getConnect() async {
    ConnectivityResult result = await Connectivity().checkConnectivity();
    return result == ConnectivityResult.none;
  }

  void listenConnectStatus() async {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      setState(() {
        currentResult = result;
      });
    });
  }
}
