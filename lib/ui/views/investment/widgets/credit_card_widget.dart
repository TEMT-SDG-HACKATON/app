import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_image.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';

Widget creditCardWidget() {
  return Container(
    width: 311.w,
    height: 182.h,
    padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 24.w),
    decoration: ShapeDecoration(
      color: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomImage(
              image: visaImage,
              dimension: 20,
            )
          ],
        ),
        Gap(24.h),
        Row(
          children: [
            CustomImage(
              image: simImage,
              dimension: 30,
            )
          ],
        ),
        Gap(24.h),
        Row(
          children: [
            CustomTextDisplay(
              inputText: 'MUKADAM RIDWAN',
              noOfTextLine: 1,
              textColor: AppColors.white,
              textFontSize: 14,
              textFontWeight: FontWeight.w400,
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextDisplay(
              inputText: '4387 **** **** 4387',
              noOfTextLine: 1,
              textColor: AppColors.white,
              textFontSize: 14,
              textFontWeight: FontWeight.w400,
            ),
            CustomTextDisplay(
              inputText: '10/24',
              noOfTextLine: 1,
              textColor: AppColors.white,
              textFontSize: 14,
              textFontWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    ),
  );
}
