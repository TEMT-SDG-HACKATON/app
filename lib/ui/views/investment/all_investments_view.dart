import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_viewmodel.dart';
import 'package:sdg_hackaton_app/ui/views/investment/widgets/investment_card.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:stacked/stacked.dart';

class AllInvestmentsView extends StackedView<InvestmentViewModel> {
  const AllInvestmentsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    InvestmentViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(color: Colors.black),
              Gap(12.h),
              const CustomTextDisplay(
                inputText: 'Choose your Investment type',
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              Gap(12.h),
              const CustomTextDisplay(
                inputText:
                    'You’re open to some level of risk. Consider starting with low and medium investments.',
                textColor: AppColors.darkBlue,
                noOfTextLine: 3,
                textFontSize: 14,
                textFontWeight: FontWeight.w400,
              ),
              Gap(24.h),
              InkWell(
                onTap: () {
                  viewModel.goToInvestmentListView('Low-risk Investments');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextDisplay(
                        inputText: 'Low-risk Investments',
                        textColor: AppColors.darkBlue,
                        textFontSize: 14,
                        textFontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 28.w,
                        color: AppColors.black.withOpacity(0.75),
                      )
                    ],
                  ),
                ),
              ),
              Gap(8.h),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          viewModel.showDetilsBottomSheet();
                        },
                        child: investmentCard(
                            name: 'Kanayo Farms',
                            percentage: '11%',
                            logo: logoImage),
                      );
                    }),
              ),
              Gap(24.h),
              InkWell(
                onTap: () {
                  viewModel.goToInvestmentListView('Medium-risk Investments');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextDisplay(
                        inputText: 'Medium-risk Investments',
                        textColor: AppColors.darkBlue,
                        textFontSize: 14,
                        textFontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 28.w,
                        color: AppColors.black.withOpacity(0.75),
                      )
                    ],
                  ),
                ),
              ),
              Gap(8.h),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          viewModel.showDetilsBottomSheet();
                        },
                        child: investmentCard(
                            name: 'Kanayo Farms',
                            percentage: '11%',
                            logo: logoImage),
                      );
                    }),
              ),
              Gap(24.h),
              InkWell(
                onTap: () {
                  viewModel.goToInvestmentListView('High-risk Investments');
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTextDisplay(
                        inputText: 'High-risk Investments',
                        textColor: AppColors.darkBlue,
                        textFontSize: 14,
                        textFontWeight: FontWeight.w500,
                      ),
                      Icon(
                        Icons.chevron_right_rounded,
                        size: 28.w,
                        color: AppColors.black.withOpacity(0.75),
                      )
                    ],
                  ),
                ),
              ),
              Gap(8.h),
              SizedBox(
                height: 80.h,
                child: ListView.builder(
                    itemCount: 5,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        onTap: () {
                          viewModel.showDetilsBottomSheet();
                        },
                        child: investmentCard(
                            name: 'Kanayo Farms',
                            percentage: '11%',
                            logo: logoImage),
                      );
                    }),
              ),
            ],
          ),
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
