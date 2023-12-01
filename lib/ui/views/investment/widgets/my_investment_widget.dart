import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:sdg_hackaton_app/ui/common/custom_image.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
import 'package:sdg_hackaton_app/utilities/constants/images.dart';
import 'package:sdg_hackaton_app/utilities/function_helpers/amount_helper.dart';

Widget myInvestmentWidget() {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
    decoration: ShapeDecoration(
      shape: RoundedRectangleBorder(
        side: BorderSide(width: 0.80, color: Color(0xFF525252)),
        borderRadius: BorderRadius.circular(8),
      ),
    ),
    child: Row(
      children: [
        CustomImage(image: logoImage),
        Gap(16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextDisplay(
              inputText: 'Managed Portfolio',
              textFontSize: 12,
              textFontWeight: FontWeight.w400,
            ),
            CustomTextDisplay(
              inputText: AmountHelper.formatAmount(500000),
              textFontSize: 14,
              textFontWeight: FontWeight.w600,
            ),
          ],
        ),
        Spacer(),
        Icon(
          Icons.chevron_right_rounded,
          size: 32.w,
          color: AppColors.black.withOpacity(0.75),
        )
      ],
    ),
  );
}
