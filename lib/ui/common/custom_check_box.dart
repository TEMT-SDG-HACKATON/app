import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

class CustomCheckBox extends StatelessWidget {
  final Function callback;
  final bool isEnabled;
  const CustomCheckBox(
      {Key? key, required this.callback, required this.isEnabled})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        callback();
      },
      child: Container(
          width: 16.w,
          height: 16.h,
          decoration: BoxDecoration(
            border: Border.all(
                color: isEnabled ? AppColors.primaryColor : AppColors.gray3,
                width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(4.r)),
          ),
          child: isEnabled == false
              ? const SizedBox()
              : const Center(
                  child: Icon(
                  Icons.check,
                  color: AppColors.primaryColor,
                  size: 16,
                ))),
    );
  }
}
