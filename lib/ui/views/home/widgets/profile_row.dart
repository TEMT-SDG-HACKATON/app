import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';

Widget profileRow({required String name}) {
  return Row(
    children: [
      Image.asset(
        profileImage,
        height: 32.h,
        width: 32.w,
      ),
      Gap(6.w),
      CustomTextDisplay(
        inputText: 'Hi $name',
        textFontSize: 14,
        textFontWeight: FontWeight.w500,
      ),
      Spacer(),
      SvgPicture.asset(
        notificationboxImage,
        height: 24.h,
        width: 24.w,
      )
    ],
  );
}
