import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

Widget quickActionWidget(
    {required String title, required String icon, required Function callback}) {
  return InkWell(
      onTap: () {
        callback();
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 64.w,
            height: 64.h,
            decoration: ShapeDecoration(
              color: AppColors.accentColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)),
            ),
            alignment: Alignment.center,
            child: SvgPicture.asset(
              icon,
              height: 24.h,
              width: 24.w,
            ),
          ),
          Gap(4.h),
          CustomTextDisplay(
            inputText: title,
            textFontSize: 14,
            textFontWeight: FontWeight.w500,
          ),
        ],
      ));
}
