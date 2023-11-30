import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

class CustomButton extends StatelessWidget {
  final Function? onPressed;
  final String buttonText;
  final bool transparent;
  final EdgeInsets? margin;
  final double? height;
  final double? width;
  final double? fontSize;
  final IconData? icon;
  final Color? backgroundColor;
  final Color? fontColor;
  final Color? iconColor;
  final Color? borderColor;
  final double? radius;

  const CustomButton(
      {Key? key,
      this.onPressed,
      required this.buttonText,
      this.transparent = false,
      this.margin,
      this.width,
      this.height,
      this.fontSize,
      this.icon,
      this.borderColor,
      this.iconColor,
      this.backgroundColor,
      this.fontColor,
      this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ButtonStyle flatButtonStyle = TextButton.styleFrom(
      backgroundColor: onPressed == null
          ? Theme.of(context).disabledColor
          : transparent
              ? Colors.transparent
              : backgroundColor ?? AppColors.accentColor,
      minimumSize:
          Size(width != null ? width! : 1170, height != null ? height! : 42),
      padding: EdgeInsets.zero,
      side: borderColor == null ? null : BorderSide(color: borderColor!),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 6.r)),
    );

    return Padding(
      padding: margin == null ? const EdgeInsets.all(0) : margin!,
      child: TextButton(
        onPressed: onPressed as void Function()?,
        style: flatButtonStyle,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          icon != null
              ? Icon(
                  icon,
                  color: transparent
                      ? Theme.of(context).primaryColor
                      : iconColor ?? Theme.of(context).cardColor,
                  size: 20.dm,
                )
              : const SizedBox(),
          SizedBox(width: icon != null ? 5.w : 0),
          Text(buttonText,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: transparent
                    ? Theme.of(context).primaryColor
                    : fontColor ?? AppColors.black,
                fontSize: fontSize ?? 15.sp,
              )),
        ]),
      ),
    );
  }
}
