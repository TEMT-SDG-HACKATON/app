import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';
class CustomTextDisplay extends StatelessWidget {
  final String inputText;
  final double textFontSize;
  final double? letterSpacing;
  final double? textLineHeight;
  final FontWeight? textFontWeight;
  final int? noOfTextLine;
  final String? textSemanticLabel;
  final Color? textColor;
  final TextDecoration? textDecoration;
  final TextAlign? textAlign;
  final Color? decorationColor;

  const CustomTextDisplay(
      {super.key,
      required this.inputText,
      required this.textFontSize,
      this.textColor,
      this.noOfTextLine,
      this.textFontWeight,
      this.textSemanticLabel,
      this.textDecoration,
      this.textAlign,
      this.textLineHeight,
      this.decorationColor,
      this.letterSpacing});

  @override
  Widget build(BuildContext context) {
    // Size dynamicSize = MediaQuery.of(context).size;
    // Orientation orientation = MediaQuery.of(context).orientation;
    return Text(
      inputText,
      style: GoogleFonts.poppins(
          textStyle: TextStyle(
              // add line height to the text widget if the design look different
              color: textColor ?? AppColors.black,
              letterSpacing: letterSpacing ?? 0.02,
              fontSize: textFontSize.sp,
              height: textLineHeight ?? 1.5.h,

              // orientation == Orientation.portrait
              //     ? dynamicSize.height * (textFontSize / 844)
              //     : dynamicSize.width * (textFontSize / 844),
              fontWeight: textFontWeight ?? FontWeight.w400,
              decoration: textDecoration ?? TextDecoration.none,
              decorationColor: decorationColor ?? AppColors.black,
              decorationStyle: TextDecorationStyle.solid)),
      maxLines: noOfTextLine,
      semanticsLabel: textSemanticLabel ?? inputText,
      textAlign: textAlign ?? TextAlign.left,
      overflow: TextOverflow.ellipsis,
    );
  }
}
