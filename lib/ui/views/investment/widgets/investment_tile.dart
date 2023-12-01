import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

Widget investmentTile(
    {required String name, required String percentage, required String logo}) {
  return Container(
    margin: EdgeInsets.only(bottom: 16.w),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 0.50, color: Color(0xFFD3D3D3)),
      ),
    ),
    child: Row(
      children: [
        SvgPicture.asset(logo, height: 24.h, width: 24.w),
        Gap(6.w),
        CustomTextDisplay(
          inputText: name,
          noOfTextLine: 2,
          textColor: AppColors.darkBlue,
          textFontSize: 14,
          textFontWeight: FontWeight.w400,
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextDisplay(
              inputText: percentage,
              textColor: AppColors.green,
              textFontSize: 14,
              textFontWeight: FontWeight.w500,
            ),
            const CustomTextDisplay(
              inputText: 'Annual Returns',
              textColor: AppColors.darkBlue,
              textFontSize: 8,
              textFontWeight: FontWeight.w400,
            ),
          ],
        )
      ],
    ),
  );
}
