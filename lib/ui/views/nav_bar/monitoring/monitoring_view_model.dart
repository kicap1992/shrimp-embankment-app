import 'package:dio/dio.dart';

import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class MonitoringViewModel extends CustomBaseViewModel {
  final log = getLogger('MonitoringViewModel');
  Future<void> init() async {
    while (true) {
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  changeStatus() async {
    setBusy(true);
    try {
      var response = await httpService.postWithFormData("gerbang", FormData());
      var data = response.data;
      log.i(data);
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
  }
}
