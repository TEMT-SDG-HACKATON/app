import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_form_field.dart';
import 'package:sdg_hackaton_app/ui/views/auth/signup/signup_viewmodel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/validation_helper.dart';
import 'package:stacked/stacked.dart';

class SignupView extends StackedView<SignupViewModel> {
  const SignupView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SignupViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: Form(
          key: viewModel.formKey,
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
              CustomTextFormField(
                showTitle: true,
                titleText: 'Name*',
                hintText: 'Enter your name',
                controller: viewModel.lastNameController,
                validator: (value) {
                  if (value == null || value.length < 3) {
                    return 'Please return a valid name';
                  }
                  return null;
                },
              ),

              Gap(24.h),
              CustomTextFormField(
                titleText: 'Email*',
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
                titleText: 'Password*',
                showTitle: true,
                hintText: '**********',
                controller: viewModel.emailController,
                validator: (value) {
                  if (!ValidationHelper.isValidPassword(value)) {
                    return 'Password must be at least 8 characters';
                  }
                  return null;
                },
              ),

              Gap(24.h),
              CustomButton(
                buttonText: 'Get started',
                onPressed: () {},
              ),
              Gap(12.h),
              CustomButton(
                buttonText: 'Sign up with Google',
                fontColor: AppColors.black,
                prefix: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SvgPicture.asset(googleImage),
                ),
                backgroundColor: Colors.transparent,
                borderColor: AppColors.black.withOpacity(0.5),
                onPressed: () {
                  
                },
              ),
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
                    onPressed: () {
                      viewModel.goToLogin();
                    },
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
        ),
      )
    ]);
  }

  @override
  SignupViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SignupViewModel();
}
