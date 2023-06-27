import 'package:connectivity_plus/connectivity_plus.dart';

Future<(ConnectivityResult, bool)> checkNetworkConn() async {
  final ConnectivityResult connectionstate =
      await Connectivity().checkConnectivity();

  if (connectionstate != ConnectivityResult.none) {
    throw Exception('network connection failure.');
  }

  return (connectionstate, connectionstate != ConnectivityResult.none);
}
