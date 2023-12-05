import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.bottomsheets.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/models/user.dart';
import 'package:sdg_hackaton_app/services/app_service.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:sdg_hackaton_app/ui/views/home/dashboard_view.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_view.dart';
import 'package:sdg_hackaton_app/ui/views/profile/profile_view.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_view.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _appService = locator<AppService>();
  final _authService = locator<AuthService>();
  final _navigationService = locator<NavigationService>();
  final amountCardController = PageController();

  int _amountCardIndex = 0;

  UserModel get user => _authService.user;
  int get selectedPageIndex => _appService.selectedPageIndex;
  int get amountCardIndex => _amountCardIndex;

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;

  void goToTab(int index) {
    _appService.selectPageIndex(index);
    rebuildUi();
  }

  changeAmountCard(int value) {
    _amountCardIndex = value;
    rebuildUi();
  }

  double getTotalInvestmentAmount() {
    if (user.investments == null) {
      return 0;
    }
    double ans = 0;
    for (var i = 0; i < user.investments!.length; i++) {
      final inv = user.investments![i];
      ans = ans + (inv.purchasedUnits! * inv.perUnitValue!);
    }
    return ans;
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
