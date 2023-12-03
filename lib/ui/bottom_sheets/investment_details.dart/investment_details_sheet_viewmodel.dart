import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/models/investment_details.dart';
import 'package:sdg_hackaton_app/services/app_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvestmentDetailsSheetViewModel extends BaseViewModel {
  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();

  double _selectedAmount = 0;

  double get selectedAmount => _selectedAmount;

  void selectAmount(double value) {
    _selectedAmount = value;
    rebuildUi();
  }

  void goToInvestmentSummary(InvestmentDetailsModel details) {
    _appService.selectInvestmentDetail(details);
    _appService.selectInvestmentAmount(_selectedAmount);
    _navigationService.navigateTo(Routes.investmentSummaryView);
  }
}
