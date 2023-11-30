import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.bottomsheets.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/services/app_service.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SavingsViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();

  int get selectedPageIndex => _appService.selectedPageIndex;

  List<Widget> pages = <Widget>[
    // HomePage(),
    // MessagesScreen(),
    // LiberationTVScreen(),
    // GiveScreen(),
  ];

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void goToTab(int index) {
    _appService.selectPageIndex(index);
    rebuildUi();

    //  switch (index) {
    //             case 0:

    //               _navigationService.navigateTo(Routes.homeView);
    //               break;
    //             case 1:
    //               Provider.of<AppProvider>(context, listen: false).goToDrawer(5);
    //               context.go('/messages');
    //               break;
    //             case 2:
    //               Provider.of<AppProvider>(context, listen: false).goToDrawer(0);
    //               context.go('/liberationTV');
    //               break;
    //             case 3:
    //               Provider.of<AppProvider>(context, listen: false).goToDrawer(1);
    //               context.go('/give');
    //               break;
    //           }
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
