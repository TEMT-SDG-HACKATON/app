import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.dialogs.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/models/user.dart';
import 'package:sdg_hackaton_app/services/app_service.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_details_view.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/amount_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SavingsViewModel extends BaseViewModel {
  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();
  final _authService = locator<AuthService>();
  final _dialogService = locator<DialogService>();
  final addCardFormKey = GlobalKey<FormState>();
  final savingsFormKey = GlobalKey<FormState>();

  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateContoller = TextEditingController();
  final TextEditingController cvvController = TextEditingController();
  final TextEditingController savingsNameContoller = TextEditingController();
  final TextEditingController savingsAmountController = TextEditingController();

  String? _selectedFrequency;

  UserModel get user => _authService.user;
  String get selectedFrequency => _selectedFrequency ?? '';

  void selectFrequency(String value) {
    _selectedFrequency = value;
    rebuildUi();
  }

  void goToSavingDetails(String type) {
    _navigationService.navigateTo(Routes.savingsDetailsView,
        arguments: SavingsDetailsViewArguments(type: type));
  }

  void saveCardFunction() async {
    setBusy(true);
    UserModel? updatedUser =
        await _appService.fundWallet(_appService.selectedSavingsAmount);
    if (updatedUser != null) {
      _authService.setUser(updatedUser);
    }
    setBusy(false);
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: successString,
      description: 'You can now invest using your saved funds!',
    );
  }

  void goToAddCard() async {
    if (savingsFormKey.currentState!.validate()) {
      _appService.selectSavingsAmount(double.parse(
          AmountHelper.cleanStringAndExtractNumbers(
              savingsAmountController.text.trim())));
      _navigationService.navigateTo(Routes.addCardView);
    }
  }

  void getit(String lkdv) {}
}
