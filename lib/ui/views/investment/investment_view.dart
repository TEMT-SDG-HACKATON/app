import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/investment/investment_viewmodel.dart';
import 'package:sdg_hackaton_app/ui/views/investment/widgets/my_investment_widget.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:stacked/stacked.dart';

class InvestmentView extends StackedView<InvestmentViewModel> {
  const InvestmentView({Key? key}) : super(key: key);

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
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Farm Investments',
                textFontSize: 22,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Investment Balance',
                textColor: AppColors.darkBlue,
                textFontSize: 12,
                textFontWeight: FontWeight.w400,
              ),
              Gap(8.h),
              const CustomTextDisplay(
                inputText: 'N200,000.00',
                textColor: AppColors.darkBlue,
                textFontSize: 18,
                textFontWeight: FontWeight.w600,
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Pick the way you want to invest',
                textColor: AppColors.darkBlue,
                textFontSize: 12,
                textFontWeight: FontWeight.w500,
              ),
              Gap(8.h),
              InkWell(
                onTap: () {
                  viewModel.goToAllInvestments();
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFCAFFD8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 12.h,
                        child: SvgPicture.asset(
                          scalesImage,
                          fit: BoxFit.cover,
                          height: 70.h,
                          width: 70.w,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Row(
                          children: [
                            Gap(8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextDisplay(
                                  inputText: 'Managed Portfolio',
                                  textFontSize: 14,
                                  textFontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: 240,
                                  child: CustomTextDisplay(
                                    noOfTextLine: 3,
                                    inputText:
                                        'Invest in a diversified farm produce portfolio designed to help you achieve growth in the long term',
                                    textFontSize: 11,
                                    textFontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 32.w,
                              color: AppColors.black.withOpacity(0.75),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(16.h),
              InkWell(
                onTap: () {
                  viewModel.goToAllInvestments();
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Color(0xFFCBECFF),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        right: 0,
                        bottom: 12.h,
                        child: SvgPicture.asset(
                          divisorImage,
                          fit: BoxFit.cover,
                          height: 70.h,
                          width: 70.w,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 16.w, vertical: 16.h),
                        child: Row(
                          children: [
                            Gap(8.w),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextDisplay(
                                  inputText: 'Individual Portfolio',
                                  textFontSize: 14,
                                  textFontWeight: FontWeight.w600,
                                ),
                                SizedBox(
                                  width: 240,
                                  child: CustomTextDisplay(
                                    noOfTextLine: 3,
                                    inputText:
                                        'Invest yourself. Do your investments the way you want to do it',
                                    textFontSize: 12,
                                    textFontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(
                              Icons.chevron_right_rounded,
                              size: 32.w,
                              color: AppColors.black.withOpacity(0.75),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(16.h),
              GestureDetector(
                onTap: () {},
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline_rounded,
                      color: AppColors.primaryColor,
                      size: 16.h,
                    ),
                    CustomTextDisplay(
                      inputText: '  Learn more about your farm investments',
                      textFontSize: 12,
                      textColor: AppColors.primaryColor,
                      textFontWeight: FontWeight.w400,
                    ),
                  ],
                ),
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'My Investments',
                textColor: AppColors.darkBlue,
                textFontSize: 12,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              Column(
                children: List.generate(1, (index) => myInvestmentWidget()),
              )
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
