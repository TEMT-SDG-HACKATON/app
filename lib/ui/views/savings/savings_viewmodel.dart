import 'package:flutter/material.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/services/app_service.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_details_view.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class SavingsViewModel extends BaseViewModel {
  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();
  final addCardFormKey = GlobalKey<FormState>();

  final TextEditingController cardNameController = TextEditingController();
  final TextEditingController cardNumberController = TextEditingController();
  final TextEditingController expiryDateContoller = TextEditingController();
  final TextEditingController cvvController = TextEditingController();

  String? _selectedFrequency;

  String get selectedFrequency => _selectedFrequency ?? '';

  void selectFrequency(String value) {
    _selectedFrequency = value;
    rebuildUi();
  }

  void goToSavingDetails(String type) {
    _navigationService.navigateTo(Routes.savingsDetailsView,
        arguments: SavingsDetailsViewArguments(type: type));
  }

  void saveCardFunction(){
    print('success!');
  }

  void goToAddCard() {
    _navigationService.navigateTo(Routes.addCardView);
  }

  void getit(String lkdv) {}
}
