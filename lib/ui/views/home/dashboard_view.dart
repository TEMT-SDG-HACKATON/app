import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/home/widgets/amount_card.dart';
import 'package:sdg_hackaton_app/ui/views/home/widgets/explore_widget.dart';
import 'package:sdg_hackaton_app/ui/views/home/widgets/profile_row.dart';
import 'package:sdg_hackaton_app/ui/views/home/widgets/quick_action_widget.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/ui_helpers/screen_sizing.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class DashboardView extends StackedView<HomeViewModel> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
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
              profileRow(),
              Gap(16.h),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: screenWidth(context),
                    height: 137.h,
                    child: PageView.builder(
                      controller: viewModel.amountCardController,
                      itemCount: 2,
                      onPageChanged: (index) {
                        viewModel.changeAmountCard(index);
                      },
                      itemBuilder: (context, index) {
                        return index == 0
                            ? amountCard(
                                amount: "N200,000.00",
                                cardText: "Total Savings",
                                buttonText: "Top up",
                                percentage: "8",
                                color: AppColors.primaryColor)
                            : amountCard(
                                amount: "N200,000.00",
                                cardText: "Total Investments",
                                buttonText: "Top up",
                                percentage: "8",
                                color: AppColors.blue);
                      },
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List<Widget>.generate(
                      2,
                      (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 6.w, vertical: 5.h),
                          child: InkWell(
                              onTap: () {
                                viewModel.amountCardController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 300),
                                    curve: Curves.easeIn);
                              },
                              child: Container(
                                width:
                                    viewModel.amountCardIndex == index ? 24 : 8,
                                height: 6.h,
                                decoration: ShapeDecoration(
                                  color: viewModel.amountCardIndex == index
                                      ? AppColors.primaryColor
                                      : AppColors.primaryColor.withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                ),
                              ))),
                    ),
                  ),
                ],
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Quick Actions',
                textFontSize: 15,
                textFontWeight: FontWeight.w600,
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  quickActionWidget(
                      title: 'Save', icon: walletImage, callback: () {}),
                  quickActionWidget(
                      title: 'Invest', icon: coinsImage, callback: () {}),
                  quickActionWidget(
                      title: 'Withdraw', icon: withdrawImage, callback: () {}),
                ],
              ),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Build Wealth',
                textFontSize: 15,
                textFontWeight: FontWeight.w600,
              ),
              Gap(16.h),
              exploreWidget(
                  title: 'Explore Savings',
                  icon: targetImage,
                  color: Color(0xFFCAFFD8),
                  callback: () {}),
              Gap(16.h),
              exploreWidget(
                  title: 'Explore Investments',
                  color: Color(0xFFCAECFF),
                  icon: investImage,
                  callback: () {}),
              Gap(24.h),
              const CustomTextDisplay(
                inputText: 'Recent Activities',
                textFontSize: 15,
                textFontWeight: FontWeight.w600,
              ),
              Gap(16.h),
            ],
          ),
        ),
      )
    ]);
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
