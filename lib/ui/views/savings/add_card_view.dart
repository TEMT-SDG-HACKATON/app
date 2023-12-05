import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/base_ui.dart';
import 'package:sdg_hackaton_app/ui/common/custom_button.dart';
import 'package:sdg_hackaton_app/ui/common/custom_image.dart';
import 'package:sdg_hackaton_app/ui/common/custom_loader.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_form_field.dart';
import 'package:sdg_hackaton_app/ui/views/savings/savings_viewmodel.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/card_helper.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/card_utils.dart';
import 'package:sdg_hackaton_app/utilities/ui_helpers/screen_sizing.dart';
import 'package:stacked/stacked.dart';

class AddCardView extends StackedView<SavingsViewModel> {
  const AddCardView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    SavingsViewModel viewModel,
    Widget? child,
  ) {
    return BaseUi(allowBackButton: true, children: [
      Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 48),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const BackButton(color: Colors.black),
                  Gap(12.h),
                  CustomTextDisplay(
                    inputText: 'Add Card Details',
                    textFontSize: 20,
                    textFontWeight: FontWeight.w500,
                  ),
                  Gap(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomImage(
                        image: cardFrameImage,
                        dimension: 148.w,
                      ),
                    ],
                  ),
                  Gap(24.h),
                  CustomTextFormField(
                    hintText: 'Card Name',
                    controller: viewModel.cardNameController,
                    underLine: true,
                    validator: (value) {
                      if (value == null || value.length < 5) {
                        return 'Sorry, your name is incorrect';
                      }
                      return null;
                    },
                  ),
                  Gap(24.h),
                  CustomTextFormField(
                    hintText: 'Card Number',
                    inputType: TextInputType.number,
                    controller: viewModel.cardNumberController,
                    underLine: true,
                    formatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(19),
                      CardNumberInputFormatter()
                    ],
                    validator: (value) {
                      if (CardUtils.validateCardNum(
                              viewModel.cardNumberController.text.trim()) !=
                          null) {
                        return 'Sorry, your card number is incorrect';
                      }
                      return null;
                    },
                  ),
                  Gap(24.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 150.w,
                        child: CustomTextFormField(
                          hintText: 'MM/YY',
                          inputType: TextInputType.number,
                          controller: viewModel.expiryDateContoller,
                          underLine: true,
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                            CardMonthInputFormatter()
                          ],
                          validator: (value) {
                            if (CardUtils.validateCardNum(viewModel
                                    .cardNumberController.text
                                    .trim()) !=
                                null) {
                              return 'Sorry, your card number is incorrect';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: 150.w,
                        child: CustomTextFormField(
                          hintText: 'CVV',
                          inputType: TextInputType.number,
                          controller: viewModel.cvvController,
                          underLine: true,
                          formatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          validator: (value) {
                            if (CardUtils.validateCardNum(viewModel
                                    .cardNumberController.text
                                    .trim()) !=
                                null) {
                              return 'Sorry, your cvv is incorrect';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  CustomButton(
                      buttonText: 'Add Card Details',
                      backgroundColor: AppColors.primaryColor,
                      onPressed: () {
                        viewModel.saveCardFunction();
                      }),
                  Gap(12.h),
                ],
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
  SavingsViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      SavingsViewModel();
}
