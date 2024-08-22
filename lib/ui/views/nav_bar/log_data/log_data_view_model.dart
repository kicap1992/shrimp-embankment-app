import '../../../../app/app.logger.dart';
import '../../../../app/core/custom_base_view_model.dart';

class LogDataViewModel extends CustomBaseViewModel {
  final log = getLogger('LogDataViewModel');
  List<dynamic> listData = [];

  Future<void> init() async {
    await getData();
  }

  getData() async {
    setBusy(true);
    try {
      var response = await httpService.get('');
      var data = response.data;
      listData = data;
      log.i(data);
      notifyListeners();
    } catch (e) {
      log.e(e);
    } finally {
      setBusy(false);
    }
  }
}
