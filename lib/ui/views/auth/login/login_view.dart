import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_check_box.dart';
import 'package:sdg_hackaton_app/ui/common/custom_loader.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_form_field.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/constants/strings.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/validation_helper.dart';
import 'package:sdg_hackaton_app/utilities/ui_helpers/screen_sizing.dart';
import 'package:stacked/stacked.dart';

import 'login_viewmodel.dart';

class LoginView extends StackedView<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
            child: Form(
              key: viewModel.formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // const BackButton(
                    //   color: Colors.black,
                    // ),
                    Gap(54.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomTextDisplay(
                          inputText: appNameString,
                          textColor: AppColors.primaryColor,
                          textFontSize: 27,
                          textFontWeight: FontWeight.w700,
                        ),
                        Gap(5.w),
                        SvgPicture.asset(
                          logoImage,
                          semanticsLabel: 'logo',
                          height: 36,
                          width: 36,
                        ),
                      ],
                    ),
                    Gap(16.h),
                    const CustomTextDisplay(
                      inputText: 'Log in to your account',
                      textFontSize: 20,
                      textFontWeight: FontWeight.w600,
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
                      controller: viewModel.emailController,
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
                      controller: viewModel.passwordController,
                      validator: (value) {
                        if (!ValidationHelper.isValidPassword(value)) {
                          return 'Password must be less than 8 letters';
                        }
                        return null;
                      },
                    ),
                    Gap(24.h),
                    Row(
                      children: [
                        CustomCheckBox(
                            callback: () {
                              viewModel.setRemeber(!viewModel.rememberEnabled);
                            },
                            isEnabled: viewModel.rememberEnabled),
                        Gap(6.w),
                        const CustomTextDisplay(
                          inputText: 'Remember for 30 days',
                          textFontSize: 14,
                          textColor: AppColors.darkBlue,
                          textFontWeight: FontWeight.w400,
                        ),
                        Spacer(),
                        CustomTextButton(
                          onPressed: () {},
                          child: const CustomTextDisplay(
                            inputText: 'Forgot password',
                            textFontSize: 14,
                            textColor: AppColors.primaryColor,
                            textFontWeight: FontWeight.w600,
                          ),
                          overlayColor: AppColors.accentColor,
                        ),
                      ],
                    ),
                    Gap(24.h),
                    CustomButton(
                      buttonText: 'Sign in',
                      onPressed: () {
                        viewModel.loginFunction();
                      },
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
                          onPressed: () {
                            viewModel.goToSignup();
                          },
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
              ),
            ),
          ),

          //Loading widget
          if (viewModel.isBusy) ...[
            Container(
              height: screenHeight(context),
              width: screenWidth(context),
              color: Colors.black.withOpacity(0.25),
              alignment: Alignment.center,
              child: customLoader(),
            )
          ]
        ],
      )
    ]);
  }

  @override
  LoginViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      LoginViewModel();
}
