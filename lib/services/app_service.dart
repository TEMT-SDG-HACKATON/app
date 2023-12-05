import 'package:sdg_hackaton_app/app/app.locator.dart';
import 'package:sdg_hackaton_app/models/investment_details.dart';
import 'package:sdg_hackaton_app/models/user.dart';
import 'package:sdg_hackaton_app/services/auth_service.dart';
import 'package:sdg_hackaton_app/services/firestore_service.dart';

class AppService {
  final _authService = locator<AuthService>();
  final _fireStoreService = locator<FireStoreService>();

  int? _selectedPageIndex;
  InvestmentDetailsModel? _selectedInvestmentDetail;
  double _selectedInvestmentAmount = 0;
  double _selectedSavingsAmount = 0;

  int get selectedPageIndex => _selectedPageIndex ?? 0;
  double get selectedInvestmentAmount => _selectedInvestmentAmount;
  double get selectedSavingsAmount => _selectedSavingsAmount;
  InvestmentDetailsModel get selectedInvestmentDetail =>
      _selectedInvestmentDetail ?? InvestmentDetailsModel();

  void selectPageIndex(int value) {
    _selectedPageIndex = value;
  }

  void selectInvestmentAmount(double value) {
    _selectedInvestmentAmount = value;
  }

  void selectSavingsAmount(double value) {
    _selectedSavingsAmount = value;
  }

  void selectInvestmentDetail(InvestmentDetailsModel value) {
    _selectedInvestmentDetail = value;
  }

  Future<UserModel?> fundWallet(double amount) async {
    double newAmount =
        amount + double.parse('${_authService.user.walletBalance ?? 0}');
    UserModel? response;
    await _fireStoreService
        .updateUserWallet(uid: _authService.user.uid!, amount: newAmount)
        .then((value) async {
      if (value) {
        await _fireStoreService.getUser(_authService.user.uid).then((value) {
          if (value != null) {
            response = value;
          }
        });
      }
    });
    return response;
  }
}
