import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../app/app.locator.dart';
import '../../../app/app.logger.dart';
import '../../../app/app.router.dart';

class NavBarViewModel extends IndexTrackingViewModel {
  final log = getLogger('NavBarViewModel');
  final _navigationService = locator<NavigationService>();

  final _bottomNavBarList = [
    {
      'name': 'Real Time',
      'icon': Icons.home_outlined,
    },
    {
      'name': 'Log Data',
      'icon': Icons.list_alt_outlined,
    },
  ];

  List<Map<String, dynamic>> get bottomNavBarList => _bottomNavBarList;

  final List<String> _views = [
    NavBarViewRoutes.monitoringView,
    NavBarViewRoutes.logDataView,
  ];

  Future<void> init() async {}

  void handleNavigation(int index) {
    log.d("handleNavigation: $index");
    log.d("currentIndex: $currentIndex");

    if (currentIndex == index) return;

    setIndex(index);
    // header = _bottomNavBarList[index]['header'] as String;
    _navigationService.navigateTo(
      _views[index],
      id: 3,
    );
  }
}
