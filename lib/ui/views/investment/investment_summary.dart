import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_image.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_viewmodel.dart';
import 'package:sdg_hackaton_app/ui/views/investment/widgets/credit_card_widget.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/amount_helper.dart';
import 'package:sdg_hackaton_app/utilities/ui_helpers/screen_sizing.dart';
import 'package:stacked/stacked.dart';

class InvestmentSummaryView extends StackedView<InvestmentViewModel> {
  const InvestmentSummaryView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InvestmentViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackButton(color: Colors.black),
            Gap(12.h),
            const CustomTextDisplay(
              inputText: 'Summary',
              textFontSize: 20,
              textFontWeight: FontWeight.w500,
            ),
            Gap(12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextDisplay(
                      inputText: viewModel.selectedInvestmentDetail.title ?? '',
                      noOfTextLine: 2,
                      textColor: AppColors.darkBlue,
                      textFontSize: 20,
                      textFontWeight: FontWeight.w500,
                    ),
                    CustomTextDisplay(
                      inputText:
                          viewModel.selectedInvestmentDetail.companyName ?? '',
                      noOfTextLine: 2,
                      textColor: AppColors.darkBlue,
                      textFontSize: 16,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
                CustomImage(
                    image: viewModel.selectedInvestmentDetail.companyLogo)
              ],
            ),
            Gap(24.h),
            Container(
              margin: EdgeInsets.only(bottom: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.50, color: Color(0xFFD3D3D3)),
                ),
              ),
              child: Row(
                children: [
                  CustomTextDisplay(
                    inputText: 'Units',
                    noOfTextLine: 2,
                    textColor: AppColors.darkBlue,
                    textFontSize: 14,
                    textFontWeight: FontWeight.w400,
                  ),
                  Spacer(),
                  CustomTextDisplay(
                    inputText: viewModel.getInvestmentUnits(),
                    noOfTextLine: 2,
                    textColor: AppColors.darkBlue,
                    textFontSize: 16,
                    textFontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 16.w),
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 0.50, color: Color(0xFFD3D3D3)),
                ),
              ),
              child: Row(
                children: [
                  CustomTextDisplay(
                    inputText: 'Value',
                    noOfTextLine: 2,
                    textColor: AppColors.darkBlue,
                    textFontSize: 14,
                    textFontWeight: FontWeight.w400,
                  ),
                  Spacer(),
                  CustomTextDisplay(
                    inputText: AmountHelper.formatAmount(
                        viewModel.selectedInvestmentAmount),
                    noOfTextLine: 2,
                    textColor: AppColors.darkBlue,
                    textFontSize: 16,
                    textFontWeight: FontWeight.w400,
                  ),
                ],
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Transform.scale(
                  scale: 0.7,
                  child: CupertinoSwitch(
                    value: viewModel.isReinvest,
                    activeColor: AppColors.primaryColor,
                    onChanged: (bool? value) {
                      if (value != null) {
                        viewModel.setReinvest(value);
                      }
                    },
                    trackColor: Theme.of(context).primaryColor.withOpacity(0.5),
                  ),
                ),
                SizedBox(
                  width: (screenWidth(context) - 150).w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomTextDisplay(
                        inputText: 'Re-invest my Dividends',
                        noOfTextLine: 1,
                        textColor: AppColors.darkBlue,
                        textFontSize: 14,
                        textFontWeight: FontWeight.w500,
                      ),
                      CustomTextDisplay(
                        inputText:
                            'Dividends are what you earn from your investment',
                        noOfTextLine: 2,
                        textColor: AppColors.darkBlue,
                        textFontSize: 14,
                        textFontWeight: FontWeight.w400,
                      ),
                    ],
                  ),
                )
              ],
            ),
            Gap(24),
          viewModel.hasCard
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [creditCardWidget()],
                  )
                : CustomTextDisplay(
                    inputText:
                        '*No card found. Please add a card and fund wallet to continue',
                    noOfTextLine: 2,
                    textColor: AppColors.darkBlue,
                    textFontSize: 14,
                    textFontWeight: FontWeight.w500,
                  ),
            Spacer(),
            Row(
              children: [
                Icon(
                  Icons.info_outline_rounded,
                  color: AppColors.darkBlue,
                  size: 16.h,
                ),
                Gap(4.w),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: CustomTextDisplay(
                    inputText:
                        'You can claim your investment anytime by selling your units of its fund',
                    textFontSize: 12,
                    noOfTextLine: 3,
                    textColor: AppColors.darkBlue,
                    textFontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Gap(16.h),
            CustomButton(
                buttonText: 'Confirm',
                backgroundColor: AppColors.primaryColor,
                onPressed: () {
                  viewModel.goToSuccessScreen();
                }),
            Gap(12.h),
          ],
        ),
      )
    ]);
  }

  @override
  InvestmentViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      InvestmentViewModel();
}
