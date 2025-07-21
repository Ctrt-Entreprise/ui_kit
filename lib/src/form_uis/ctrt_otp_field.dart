import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtOtpField extends StatelessWidget {
  final double? width;
  final void Function(String) onCompleted;
  final void Function(String)? onChange;
  final int length;
  final String? Function(String?)? validator;
  final double? height, radius;
  final bool whithBoder;
  final double? cursorHeight;
  final double? fontSize;
  const CtrtOtpField({
    super.key,
    this.width,
    required this.onCompleted,
    this.onChange,
    required this.length,
    this.validator,
    this.height,
    this.radius,
    this.whithBoder = true,
    this.cursorHeight,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: PinCodeTextField(
        appContext: context,
        length: length,
        autoFocus: true,
        cursorColor: CtrtColors.textPrimary,
        validator: validator ?? CtrtValidator.requiredValidation,
        pinTheme: CtrtThemes.pinTheme(width: width, height: height, radius: radius, whithBoder: whithBoder),
        onCompleted: onCompleted,
        onChanged: onChange,
        textStyle: CtrtThemes.otpFieldStyle(fontSize: fontSize??25),
        keyboardType: TextInputType.number,
        cursorHeight: cursorHeight??25,
      ),
    );
  }
}
