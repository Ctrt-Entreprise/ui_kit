import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'ctrt_colors.dart';

class CtrtThemes {
  static ThemeData getTheme({String? fontFamily, Color? background}) {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: CtrtColors.background),
      primaryColor: CtrtColors.primary,
      useMaterial3: true,
      scaffoldBackgroundColor: background?? CtrtColors.background,
      fontFamily: fontFamily,
    );
  }

  static otpFieldStyle ({Color? color, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    fontWeight: fontWeight ?? FontWeight.w800,
    fontSize: fontSize ?? 25,
    color: color ?? CtrtColors.textPrimary,
  );

  static TextStyle fieldStyle ({Color? color, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    color: color ?? CtrtColors.textPrimary,
    fontSize: fontSize ?? 14,
    height: 16 / (fontSize??14),
    fontWeight: fontWeight ?? FontWeight.w600,
  );

  static fieldLabelStyle ({Color? color, double? fontSize, FontWeight? fontWeight}) => TextStyle(
    color: color ?? CtrtColors.textSecondary,
    fontSize: fontSize ?? 13,
    height: 16 / (fontSize??13),
    fontWeight: fontWeight ?? FontWeight.w500,
  );

  static fieldSelectedBorder ({Color? color, double? width, double? radius, bool whithBoder = true}) => OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 12),
    borderSide: whithBoder ? BorderSide(
      color: color ?? CtrtColors.darkGrey,
      width: width ?? 1,
    ) : BorderSide.none,
  );

  static fieldBorderRadius ({Color? color, double? width, double? radius, bool whithBoder = true}) =>  OutlineInputBorder(
    borderRadius: BorderRadius.circular(radius ?? 12),
    borderSide: whithBoder ? BorderSide(
      color: color ?? CtrtColors.lightGrey,
      width: width ?? 1,
    ) : BorderSide.none,
  );


  static pinTheme ({Color? color, double? width, double? height, double? radius, bool whithBoder = false}) =>  PinTheme(
    shape: PinCodeFieldShape.box,
    borderRadius: BorderRadius.circular(radius ?? 10),
    fieldHeight: height ?? 60,
    fieldWidth: width ?? 55,
    activeFillColor: CtrtColors.white,
    inactiveFillColor: CtrtColors.white,
    selectedFillColor: CtrtColors.white,
    activeColor: CtrtColors.darkGrey,
    selectedColor: CtrtColors.darkGrey,
    inactiveColor: CtrtColors.darkGrey,
    errorBorderColor: CtrtColors.lightGrey,
    errorBorderWidth: 1,
    borderWidth: whithBoder ? 1 : 0,
    inactiveBorderWidth: whithBoder ? 0.8 : 0,
    activeBorderWidth: whithBoder ? 1 : 0,
  );
}
