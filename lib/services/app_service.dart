import 'package:sdg_hackaton_app/models/investment_details.dart';

class AppService {
  int? _selectedPageIndex;
  InvestmentDetailsModel? _selectedInvestmentDetail;
  double _selectedInvestmentAmount = 0;

  int get selectedPageIndex => _selectedPageIndex ?? 0;
  InvestmentDetailsModel get selectedInvestmentDetail =>
      _selectedInvestmentDetail ?? InvestmentDetailsModel();
  double get selectedInvestmentAmount => _selectedInvestmentAmount;

  void selectPageIndex(int value) {
    _selectedPageIndex = value;
  }

  void selectInvestmentAmount(double value) {
    _selectedInvestmentAmount = value;
  }

  void selectInvestmentDetail(InvestmentDetailsModel value) {
    _selectedInvestmentDetail = value;
  }
}
