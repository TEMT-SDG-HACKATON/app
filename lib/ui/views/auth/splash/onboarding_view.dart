import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_image.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/views/auth/splash/splash_viewmodel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:stacked/stacked.dart';

class OnboardingView extends StackedView<SplashViewModel> {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SplashViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(
        allowBackButton: true,
        backgroundColor: AppColors.primaryColor,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomImage(image: onboardingManImage, dimension: 250.h),
                Gap(24.h),
                const CustomTextDisplay(
                  inputText:
                      'Welcome to our innovative savings and investment app!',
                  noOfTextLine: 3,
                  textFontSize: 20,
                  textColor: AppColors.white,
                  textAlign: TextAlign.center,
                  textFontWeight: FontWeight.w600,
                ),
                Gap(8.h),
                const CustomTextDisplay(
                  inputText:
                      "We're thrilled to have you on board. Our platform is designed to help you achieve your financial goals while also making a positive impact on agriculture.",
                  noOfTextLine: 6,
                  textFontSize: 14,
                  textColor: AppColors.white,
                  textAlign: TextAlign.center,
                  textFontWeight: FontWeight.w400,
                ),
                Gap(24.h),
                CustomButton(
                  buttonText: 'Sign in',
                  backgroundColor: AppColors.white.withOpacity(0.15),
                  onPressed: () {
                    viewModel.goToLogin();
                  },
                ),
                Gap(16.h),
                CustomButton(
                  buttonText: 'Create an Account',
                  fontColor: AppColors.black,
                  backgroundColor: AppColors.white,
                  onPressed: () {
                    viewModel.goToSignup();
                  },
                ),
                Gap(32.h),
              ],
            ),
          )
        ]);
  }

  @override
  SplashViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SplashViewModel();
}
