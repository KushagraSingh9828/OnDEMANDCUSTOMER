// import 'dart:async';
// import 'dart:developer';
//
// import 'package:bloc/bloc.dart';
// import 'package:connectivity/connectivity.dart';
// import 'package:meta/meta.dart';
//
// part 'internet_state.dart';
//
// class InternetCubit extends Cubit<InternetState> {
//   late Connectivity connectivity;
//   StreamSubscription? connectivityStreamSubscription;
//
//   InternetCubit({required this.connectivity}) : super(InternetLoading()) {
//     monitorInternetConnection();
//   }
//
//   StreamSubscription<ConnectivityResult> monitorInternetConnection() {
//     return connectivityStreamSubscription =
//         connectivity.onConnectivityChanged.listen((connectivityResult) {
//       log("connectivityStreamSubscription" +
//           connectivity.checkConnectivity().toString());
//
//       if (connectivityResult == ConnectivityResult.wifi) {
//         log("wifi");
//         emitInternetConnected(ConnectionType.wifi);
//       } else if (connectivityResult == ConnectivityResult.mobile) {
//         log("mobile");
//         emitInternetConnected(ConnectionType.mobile);
//       } else if (connectivityResult == ConnectivityResult.none) {
//         log("InternetDisconnected");
//         emitInternetDisconnected();
//       }
//     });
//   }
//
//   void emitInternetConnected(ConnectionType _connectionType) =>
//       emit(InternetConnected(connectionType: _connectionType));
//
//   void emitInternetDisconnected() => emit(InternetDisconnected());
//
//   @override
//   Future<void> close() {
//     connectivityStreamSubscription?.cancel();
//     return super.close();
//   }
// }
