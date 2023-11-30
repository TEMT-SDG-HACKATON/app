import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const BackButton(
            //   color: Colors.black,
            // ),
            Gap(54.h),
            SvgPicture.asset(
              logoImage,
              semanticsLabel: 'logo',
              height: 40,
              width: 40,
            ),
            Gap(16.h),
            const CustomTextDisplay(
              inputText: 'Sign up',
              textFontSize: 20,
              textFontWeight: FontWeight.w600,
            ),
            Gap(16.h),
            const CustomTextDisplay(
              inputText: 'Start your 30-day free trial.',
              textColor: AppColors.darkBlue,
              textFontSize: 16,
              textFontWeight: FontWeight.w400,
            ),
            Gap(24.h),

            Gap(24.h),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextDisplay(
                  inputText: 'Already have an account?  ',
                  textFontSize: 14,
                  textColor: AppColors.darkBlue,
                  textFontWeight: FontWeight.w400,
                ),
                CustomTextButton(
                  onPressed: () {},
                  child: const CustomTextDisplay(
                    inputText: 'Sign in',
                    textFontSize: 14,
                    textColor: AppColors.primaryColor,
                    textFontWeight: FontWeight.w600,
                  ),
                  overlayColor: AppColors.accentColor,
                ),
              ],
            ),
            Gap(12.h),
          ],
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
