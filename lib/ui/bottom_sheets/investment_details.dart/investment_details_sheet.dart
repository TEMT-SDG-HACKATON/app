import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/models/investment_details.dart';
import 'package:sdg_hackaton_app/ui/bottom_sheets/investment_details.dart/investment_details_sheet_viewmodel.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/amount_helper.dart';
import 'package:sdg_hackaton_app/utilities/ui_helpers/dimensions.dart';

import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class InvestmentDetailsSheet
    extends StackedView<InvestmentDetailsSheetViewModel> {
  final Function(SheetResponse)? completer;
  final SheetRequest request;
  const InvestmentDetailsSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InvestmentDetailsSheetViewModel viewModel,
    Widget? child,
  ) {
    final data = request.data as InvestmentDetailsModel;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 32.w,
                height: 4.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFE5E5E5),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ),
              ),
            ],
          ),
          Gap(12.h),
          Row(
            children: [
              if (data.companyLogo != null)
                SvgPicture.asset(data.companyLogo!, height: 24.h, width: 24.w),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomTextDisplay(
                    inputText: '${data.annualPercentage ?? 0}%',
                    textColor: AppColors.green,
                    textFontSize: 18,
                    textFontWeight: FontWeight.w500,
                  ),
                  CustomTextDisplay(
                    inputText: 'Annual Returns',
                    textColor: AppColors.darkBlue,
                    textFontSize: 12,
                    textFontWeight: FontWeight.w400,
                  ),
                ],
              )
            ],
          ),
          Gap(16.h),
          CustomTextDisplay(
            inputText: data.title ?? '',
            noOfTextLine: 2,
            textColor: AppColors.darkBlue,
            textFontSize: 20,
            textFontWeight: FontWeight.w500,
          ),
          CustomTextDisplay(
            inputText: data.companyName ?? '',
            noOfTextLine: 2,
            textColor: AppColors.darkBlue,
            textFontSize: 16,
            textFontWeight: FontWeight.w400,
          ),
          Gap(12.h),
          Wrap(
            spacing: 12.w,
            runSpacing: 12.h,
            children: [
              amountChip(viewModel, 50000),
              amountChip(viewModel, 100000),
              amountChip(viewModel, 150000),
              amountChip(viewModel, 200000),
              amountChip(viewModel, 250000),
              amountChip(viewModel, 300000),
            ],
          ),
          Gap(24.h),
          CustomButton(
              buttonText: 'Invest Now',
              backgroundColor: AppColors.primaryColor,
              onPressed: viewModel.selectedAmount == 0
                  ? null
                  : () {
                      Navigator.pop(context);
                      viewModel.goToInvestmentSummary(data);
                    }),
          verticalSpaceLarge,
        ],
      ),
    );
  }

  Widget amountChip(
    InvestmentDetailsSheetViewModel viewModel,
    double amount,
  ) {
    return InkWell(
      onTap: () {
        viewModel.selectAmount(amount);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        // margin: EdgeInsets.only(right: 12.h),
        decoration: BoxDecoration(
          color: viewModel.selectedAmount == amount
              ? AppColors.lightGrey
              : Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1, color: Color(0xFFEAECF0)),
        ),
        child: CustomTextDisplay(
          inputText: AmountHelper.formatAmount(amount, enableDecimal: false),
          textFontSize: 14,
          textFontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  InvestmentDetailsSheetViewModel viewModelBuilder(BuildContext context) =>
      InvestmentDetailsSheetViewModel();
}
