import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_viewModel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:stacked/stacked.dart';

class SavingsView extends StackedView<SavingsViewModel> {
  const SavingsView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavingsViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const BackButton(
            //   color: Colors.black,
            // ),
            Gap(24.h),
            const CustomTextDisplay(
              inputText: 'Savings',
              textFontSize: 22,
              textFontWeight: FontWeight.w500,
            ),
            Gap(16.h),
            const CustomTextDisplay(
              inputText: 'Welcome back! Please enter your details.',
              textColor: AppColors.darkBlue,
              textFontSize: 16,
              textFontWeight: FontWeight.w400,
            ),

            Gap(24.h),
          ],
        ),
      )
    ]);
  }

  @override
  SavingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavingsViewModel();
}
