import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

Widget customLoader() {
  return CircularProgressIndicator(
    strokeWidth: 5.w,
    valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
  );
}
