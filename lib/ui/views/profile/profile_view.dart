import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_form_field.dart';
import 'package:sdg_hackaton_app/ui/views/profile/profile_viewmodel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/validation_helper.dart';
import 'package:stacked/stacked.dart';

class ProfileView extends StackedView<ProfileViewModel> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ProfileViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomTextDisplay(
              inputText: 'Profile',
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
            CustomTextFormField(
              titleText: 'Email',
              showTitle: true,
              hintText: 'user@gmail.com',
              validator: (value) {
                if (!ValidationHelper.isValidEmail(value)) {
                  return 'Sorry, your email address is incorrect';
                }
                return null;
              },
            ),
            Gap(24.h),
            CustomTextFormField(
              titleText: 'Password',
              showTitle: true,
              hintText: '**********',
              validator: (value) {
                if (!ValidationHelper.isValidPassword(value)) {
                  return 'Sorry, your email address is incorrect';
                }
                return null;
              },
            ),
            Gap(24.h),
            Gap(24.h),
            CustomButton(
              buttonText: 'Sign in',
              onPressed: () {},
            ),
            Gap(12.h),
            CustomButton(
              buttonText: 'Sign in with Google',
              fontColor: AppColors.black,
              prefix: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(googleImage),
              ),
              backgroundColor: Colors.transparent,
              borderColor: AppColors.black.withOpacity(0.5),
              onPressed: () {},
            ),
            Gap(24.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomTextDisplay(
                  inputText: 'Don’t have an account?  ',
                  textFontSize: 14,
                  textColor: AppColors.darkBlue,
                  textFontWeight: FontWeight.w400,
                ),
                CustomTextButton(
                  onPressed: () {},
                  child: const CustomTextDisplay(
                    inputText: 'Sign up',
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
  ProfileViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      ProfileViewModel();
}
