import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sdg_hackaton_app/ui/common/custom_text_display.dart';
import 'package:sdg_hackaton_app/utilities/constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  final String hintText;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final FocusNode? nextFocus;
  final double? fontSize;
  final String? titleText;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final bool isPassword;
  final Function? onChanged;
  final Function? onSubmit;
  final bool isEnabled;
  final int maxLines;
  final TextCapitalization capitalization;
  final FormFieldValidator<String>? validator;
  final bool autoValidate;
  final IconData? prefixIcon;
  final bool divider;
  final bool showTitle;
  final String? prefixImage;
  final double prefixSize;
  final double iconSize;
  final bool isPhone;
  final String? countryDialCode;
  final onCountryChanged;
  final bool border;
  final bool underLine;
  final List<TextInputFormatter>? formatters;

  const CustomTextFormField({
    Key? key,
    this.hintText = 'Write something...',
    this.controller,
    this.focusNode,
    this.nextFocus,
    this.isEnabled = true,
    this.inputType = TextInputType.text,
    this.inputAction = TextInputAction.next,
    this.maxLines = 1,
    this.onSubmit,
    this.onChanged,
    this.formatters,
    this.prefixIcon,
    this.titleText,
    this.capitalization = TextCapitalization.none,
    this.isPassword = false,
    this.divider = false,
    this.showTitle = false,
    this.prefixImage,
    this.prefixSize = 10,
    this.fontSize,
    this.underLine = false,
    this.validator,
    this.autoValidate = true,
    this.iconSize = 18,
    this.isPhone = false,
    this.countryDialCode,
    this.onCountryChanged,
    this.border = true,
  }) : super(key: key);

  @override
  CustomTextFieldState createState() => CustomTextFieldState();
}

class CustomTextFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        widget.showTitle
            ? CustomTextDisplay(
                inputText: widget.titleText ?? widget.hintText,
                textFontSize: 14,
              )
            : const SizedBox(),
        SizedBox(height: widget.showTitle ? 6 : 0),
        TextFormField(
          maxLines: widget.maxLines,
          controller: widget.controller,
          focusNode: widget.focusNode,
          style: TextStyle(fontSize: widget.fontSize?.sp ?? 16.sp),
          textInputAction: widget.inputAction,
          keyboardType: widget.inputType,
          cursorColor: AppColors.black,
          textCapitalization: widget.capitalization,
          enabled: widget.isEnabled,
          autofocus: false,
          obscureText: widget.isPassword ? _obscureText : false,
          inputFormatters: widget.inputType == TextInputType.phone
              ? <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp('[0-9+]')),
                  ...widget.formatters ?? []
                ]
              : widget.formatters,
          decoration: InputDecoration(
            contentPadding:
                widget.underLine ? EdgeInsets.fromLTRB(12, 12, 12, 12) : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(6),
              borderSide: BorderSide(
                  style: widget.border ? BorderStyle.solid : BorderStyle.none,
                  width: 0.3,
                  color: Theme.of(context).primaryColor),
            ),
            enabledBorder: widget.underLine
                ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                        style: widget.border
                            ? BorderStyle.solid
                            : BorderStyle.none,
                        color: AppColors.black.withOpacity(0.25)),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        style: widget.border
                            ? BorderStyle.solid
                            : BorderStyle.none,
                        width: 0.3,
                        color: AppColors.black.withOpacity(0.25)),
                  ),
            focusedBorder: widget.underLine
                ? UnderlineInputBorder(
                    borderRadius: BorderRadius.circular(0),
                    borderSide: BorderSide(
                        style: widget.border
                            ? BorderStyle.solid
                            : BorderStyle.none,
                        color: AppColors.black.withOpacity(0.75)),
                  )
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(6),
                    borderSide: BorderSide(
                        style: widget.border
                            ? BorderStyle.solid
                            : BorderStyle.none,
                        width: 1,
                        color: AppColors.black.withOpacity(0.75)),
                  ),
            isDense: true,
            hintText: widget.hintText,
            fillColor: Theme.of(context).cardColor,
            filled: true,
            prefixIcon: widget.prefixImage != null && widget.prefixIcon == null
                ? Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: widget.prefixSize),
                    child:
                        Image.asset(widget.prefixImage!, height: 20, width: 20),
                  )
                : widget.prefixImage == null && widget.prefixIcon != null
                    ? Icon(widget.prefixIcon, size: widget.iconSize)
                    : null,
            suffixIcon: widget.isPassword
                ? IconButton(
                    icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Theme.of(context).hintColor.withOpacity(0.3)),
                    onPressed: _toggle,
                  )
                : null,
          ),
          autovalidateMode: widget.autoValidate
              ? AutovalidateMode.onUserInteraction
              : AutovalidateMode.disabled,
          validator: widget.validator,
          onChanged: widget.onChanged as void Function(String)?,
        ),
        widget.divider
            ? const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10), child: Divider())
            : const SizedBox(),
      ],
    );
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }
}
