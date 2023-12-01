class InvestmentDetailsModel {
  String? title;
  String? companyName;
  double? annualPercentage;
  int? availableUnits;
  double? perUnitValue;
  String? description;
  String? companyLogo;

  InvestmentDetailsModel(
      {this.title,
      this.annualPercentage,
      this.availableUnits,
      this.companyName,
      this.description,
      this.companyLogo,
      this.perUnitValue});
}
