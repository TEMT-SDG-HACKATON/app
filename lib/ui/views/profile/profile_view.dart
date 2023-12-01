import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(24.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomTextDisplay(
                    inputText: 'Profile',
                    textFontSize: 22,
                    textFontWeight: FontWeight.w500,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.settings_outlined,
                        size: 24.h,
                      ))
                ],
              ),
              Gap(16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 32.r,
                    child: Image.asset(profileImage),
                  )
                ],
              ),
              Gap(16.h),
              const CustomTextDisplay(
                inputText: 'Edit your profile details',
                textColor: AppColors.darkBlue,
                textFontSize: 16,
                textFontWeight: FontWeight.w400,
              ),
              Gap(12.h),
              CustomTextFormField(
                titleText: 'Name',
                showTitle: true,
                hintText: 'Enter your name',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sorry, name is needed';
                  }
                  return null;
                },
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
              CustomTextButton(
                onPressed: () {},
                child: const CustomTextDisplay(
                  inputText: 'Change Password',
                  textFontSize: 15,
                  textColor: AppColors.primaryColor,
                  textFontWeight: FontWeight.w600,
                ),
                overlayColor: AppColors.accentColor,
              ),
              Gap(12.h),
              CustomTextButton(
                onPressed: () {},
                child: const CustomTextDisplay(
                  inputText: 'Log Out',
                  textFontSize: 15,
                  textColor: AppColors.red,
                  textFontWeight: FontWeight.w600,
                ),
                overlayColor: AppColors.red,
              ),
            ],
          ),
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
