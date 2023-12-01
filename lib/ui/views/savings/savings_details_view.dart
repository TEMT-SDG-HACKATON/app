import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_form_field.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_viewmodel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:stacked/stacked.dart';

class SavingsDetailsView extends StackedView<SavingsViewModel> {
  final String type;
  const SavingsDetailsView({Key? key, required this.type}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavingsViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const BackButton(color: Colors.black),
              Gap(12.h),
              CustomTextDisplay(
                inputText: type,
                textFontSize: 20,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              CustomTextFormField(
                titleText: 'Name of savings plan',
                showTitle: true,
                hintText: 'Enter the name of your plan',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sorry, name is needed';
                  }
                  return null;
                },
              ),
              Gap(24.h),
              CustomTextFormField(
                titleText: 'Savings amount',
                showTitle: true,
                hintText: 'Enter the savings amount',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sorry, name is needed';
                  }
                  return null;
                },
              ),
              Gap(16.h),
              CustomTextDisplay(
                inputText: 'How often do you want to save',
                noOfTextLine: 2,
                textColor: AppColors.darkBlue,
                textFontSize: 14,
                textFontWeight: FontWeight.w500,
              ),
              Gap(16.h),
              Wrap(
                spacing: 16.w,
                runSpacing: 16.h,
                children: [
                  frequencyChip(viewModel, 'Daily'),
                  frequencyChip(viewModel, 'Weekly'),
                  frequencyChip(viewModel, 'Monthly'),
                  frequencyChip(viewModel, 'One-time'),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Icon(
                    Icons.info_outline_rounded,
                    color: AppColors.darkBlue,
                    size: 16.h,
                  ),
                  Gap(4.w),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 100,
                    child: CustomTextDisplay(
                      inputText:
                          'You can save funds to your wallet either once or on a continuous basis',
                      textFontSize: 12,
                      noOfTextLine: 3,
                      textColor: AppColors.darkBlue,
                      textFontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Gap(16.h),
              CustomButton(
                  buttonText: 'Continue',
                  backgroundColor: AppColors.primaryColor,
                  onPressed: () {
                    viewModel.goToAddCard();
                  }),
              Gap(12.h),
            ],
          ),
        ),
      )
    ]);
  }

  Widget frequencyChip(
    SavingsViewModel viewModel,
    String frequency,
  ) {
    return InkWell(
      onTap: () {
        viewModel.selectFrequency(frequency);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        // margin: EdgeInsets.only(right: 12.h),
        decoration: BoxDecoration(
          color: viewModel.selectedFrequency == frequency
              ? AppColors.lightGrey
              : Color(0xFFF9FAFB),
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(width: 1, color: Color(0xFFEAECF0)),
        ),
        child: CustomTextDisplay(
          inputText: frequency,
          textFontSize: 14,
          textFontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  @override
  SavingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavingsViewModel();
}

class SavingsDetailsViewArguments {
  final String type;
  SavingsDetailsViewArguments({required this.type});
}
