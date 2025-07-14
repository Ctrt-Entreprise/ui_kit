import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class BadgeRow extends StatelessWidget {
  final String text;
  final Color bgColor;
  final Color txtColor;
  final double height;
  final double paddingH;
  final double paddingV;
  final double fontSize;

  const BadgeRow({
    super.key,
    required this.text,
    required this.bgColor,
    required this.txtColor,
    this.height = 30.0,
    this.paddingH = 10.0,
    this.paddingV = 3.0,
    this.fontSize = 8.0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
          padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 5.h),
          decoration: BoxDecoration(
            border: Border.all(
              color: CtrtColors.badgeTxtColor[text.toUpperCase()] ?? CtrtColors.darkGrey,
              width: 0.7,
            ),
            borderRadius: BorderRadius.circular(10.w),
            color: CtrtColors.badgeBGColor[text.toUpperCase()] ?? CtrtColors.transparentGrey,
          ),
          child: Row(
            spacing: 5.w,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 5.w,
                height: 5.h,
                decoration: BoxDecoration(
                  color: CtrtColors.badgeTxtColor[text.toUpperCase()] ?? CtrtColors.darkGrey,
                  shape: BoxShape.circle,
                ),
              ),
              CtrtText.extraMedium(text: text, textSize: 10.5.spMin, textColor: CtrtColors.badgeTxtColor[text.toUpperCase()] ?? CtrtColors.darkGrey, textOverflow: TextOverflow.fade),
            ],
          ),
        ),
        ),
      ],
    );
  }
}
