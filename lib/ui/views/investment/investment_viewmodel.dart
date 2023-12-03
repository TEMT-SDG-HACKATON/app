import 'package:sdg_hackaton_app/app/app.bottomsheets.dart';
import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/app/app.router.dart';
import 'package:sdg_hackaton_app/models/investment_details.dart';
import 'package:sdg_hackaton_app/services/app_service.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_list_view.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/amount_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvestmentViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _appService = locator<AppService>();
  final _navigationService = locator<NavigationService>();
  bool _isReinvest = true;
  bool hasCard = true;

  InvestmentDetailsModel get selectedInvestmentDetail =>
      _appService.selectedInvestmentDetail;
  double get selectedInvestmentAmount => _appService.selectedInvestmentAmount;
  bool get isReinvest => _isReinvest;

  void goToAllInvestments() {
    _navigationService.navigateTo(Routes.allInvestmentsView);
  }

  void goToInvestmentListView(String type) {
    _navigationService.navigateTo(Routes.investmentListView,
        arguments: InvestmentListViewArguments(type: type));
  }

  String getInvestmentUnits() {
    double result = 0;
    result = selectedInvestmentAmount / selectedInvestmentDetail.perUnitValue!;
    return '${AmountHelper.formatAmount(result, sign: '', enableDecimal: false)} units';
  }

  void setReinvest(bool value) {
    _isReinvest = value;
    rebuildUi();
  }

  void goToSuccessScreen() {
    print('success!');
  }

  void showDetilsBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.investmentDetails,
      title: ksHomeBottomSheetTitle,
      data: InvestmentDetailsModel(
          companyLogo: logoImage,
          title: 'Kanayo Farms',
          companyName: 'Kanayo Private Farms Limited',
          perUnitValue: 50000,
          annualPercentage: 10.5),
      description: ksHomeBottomSheetDescription,
    );
  }
}
