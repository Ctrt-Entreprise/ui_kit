import 'package:flutter/material.dart';

class CtrtText {
  static Widget extraRegular({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    TextAlign? textAlign,
    void Function()? onClick,
    int? maxLines,
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w300,
      textAlign: textAlign,
      maxLines: maxLines,
      onClick: onClick
    );
  }

  static Widget regular({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    TextAlign? textAlign,
    int? maxLines,
    void Function()? onClick
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w400,
      textAlign: textAlign,
      maxLines: maxLines,
      onClick: onClick
    );
  }

  static Widget medium({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    TextAlign? textAlign,
    int? maxLines,
    void Function()? onClick
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w500,
      textAlign: textAlign,
      maxLines: maxLines,
      onClick: onClick
    );
  }

  static Widget extraMedium({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    TextAlign? textAlign,
    int? maxLines,
    void Function()? onClick
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w600,
      textAlign: textAlign,
      maxLines: maxLines,
      onClick: onClick
    );
  }

  static Widget bold({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    TextAlign? textAlign,
    int? maxLines,
    void Function()? onClick
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w700,
      textAlign: textAlign,
      maxLines: maxLines,
      onClick: onClick
    );
  }

  static Widget extraBold({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    TextAlign? textAlign,
    int? maxLines,
    void Function()? onClick
  }) {
    return _buildText(
      text: text,
      textSize: textSize,
      textColor: textColor,
      textOverflow: textOverflow,
      fontFamil: fontFamil,
      fontWeight: FontWeight.w800,
      textAlign: textAlign,
      maxLines: maxLines,
      onClick: onClick
    );
  }

  static Widget _buildText({
    required String text,
    double? textSize,
    Color? textColor,
    TextOverflow? textOverflow,
    String? fontFamil,
    FontWeight? fontWeight,
    TextAlign? textAlign,
    int? maxLines,
    void Function()? onClick
  }) {
    return InkWell(
      onTap: onClick,
      child: Text(
        text,
        overflow: textOverflow ?? TextOverflow.ellipsis,
        maxLines: maxLines,
        textAlign: textAlign,
        style: TextStyle(
          fontSize: textSize ?? 15.0,
          color: textColor,
          fontFamily: fontFamil,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}
