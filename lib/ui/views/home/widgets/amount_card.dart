import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

Widget amountCard(
    {required String amount,
    required String cardText,
    required String buttonText,
    required String percentage,
    required Color color}) {
  return Container(
    width: 327.w,
    height: 137.h,
    padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
  margin: EdgeInsets.symmetric(horizontal: 6.w),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: color.withOpacity(0.8)),
    child: Column(children: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                color: AppColors.white),
            child: Center(
              child: CustomTextDisplay(
                inputText: '$percentage% perannum',
                textFontSize: 12,
                textFontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
      Gap(5.h),
      CustomTextDisplay(
        inputText: cardText,
        textFontSize: 13,
        textColor: AppColors.white,
        textFontWeight: FontWeight.w400,
      ),
      CustomTextDisplay(
        inputText: amount,
        textFontSize: 24,
        textColor: AppColors.white,
        textFontWeight: FontWeight.w700,
      ),
      Spacer(),
      InkWell(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.4.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r), color: AppColors.white),
          child: Center(
            child: CustomTextDisplay(
              inputText: buttonText,
              textFontSize: 14,
              textColor: color,
              textFontWeight: FontWeight.w600,
            ),
          ),
        ),
      )
    ]),
  );
}
