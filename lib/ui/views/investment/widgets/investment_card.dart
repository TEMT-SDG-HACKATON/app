import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';


Widget investmentCard(
    {required String name, required String percentage, required String logo}) {
  return Container(
    width: 121.w,
    height: 77.h,
    margin: EdgeInsets.only(right: 8.w),
    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
    decoration: ShapeDecoration(
      gradient: LinearGradient(
        begin: Alignment(0.71, -0.71),
        end: Alignment(-0.71, 0.71),
        colors: [Colors.white, Color(0xFFE9E9E9)],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ),
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          SvgPicture.asset(logo, height: 24.h, width: 24.w),
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
       CustomTextDisplay(
        inputText: name,
        noOfTextLine: 2,
        textColor: AppColors.darkBlue,
        textFontSize: 14,
        textFontWeight: FontWeight.w400,
      ),
    ]),
  );
}
