import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';
import '../../../app/core/custom_base_view_model.dart';
import '../../../services/my_notification.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

class SplashScreenViewModel extends CustomBaseViewModel {
  final log = getLogger('SplashScreenViewModel');
  Future<void> init() async {
    await Future.delayed(const Duration(seconds: 3));
    // navigate to login page
    // ignore: use_build_context_synchronously
    MyNotification.initialize(flutterLocalNotificationsPlugin);
    socketIoClient.init();
    // socketIoClient.connect();
    socketIoClient.on('data', (data) {
      String value = data["value"];
      List<String> list = value.split(',');
      String status = data["status"];
      // log.wtf('value: $value');
      // log.wtf('status: $status');
      socketIoClient.ultrasonic1 = list[1];
      socketIoClient.ultrasonic2 = list[2];
      socketIoClient.ph1 = list[3];
      socketIoClient.ph2 = list[4];
      socketIoClient.ph3 = list[5];
      socketIoClient.tds1 = list[6];
      socketIoClient.tds2 = list[6];
      socketIoClient.tds3 = list[6];
      socketIoClient.status = status;
      notifyListeners();
    });

    navigationService.replaceWith(Routes.navBarView);
  }
}
