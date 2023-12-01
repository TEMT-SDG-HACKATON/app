import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

Widget exploreWidget(
    {required String title, required Color color, required String icon, required Function callback}) {
  return InkWell(
    onTap: () {
      callback();
    },
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: ShapeDecoration(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      child: Row(
        children: [
          SvgPicture.asset(icon),
          Gap(8.w),
          CustomTextDisplay(
            inputText: title,
            textFontSize: 15,
            textFontWeight: FontWeight.w600,
          ),
          Spacer(),
          Icon(
            Icons.chevron_right_rounded,
            size: 32.w,
            color: AppColors.black.withOpacity(0.75),
          )
        ],
      ),
    ),
  );
}
