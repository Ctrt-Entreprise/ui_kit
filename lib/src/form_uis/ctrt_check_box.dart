import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtCheckBox extends StatelessWidget {
  final String title;
  final String price;
  final bool? value;
  final Function(bool?) onChanged;
  const CtrtCheckBox({
    super.key,
    required this.title,
    required this.price,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
          minLeadingWidth: 0.w,
          horizontalTitleGap: 0.w,
        ),
      ),
      child: CheckboxListTile(
        controlAffinity: ListTileControlAffinity.leading,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CtrtText.regular(text: title, textSize: 15.sp)),
            CtrtText.medium(
              text: price,
              textSize: 13.sp,
              textColor: CtrtColors.primaryCarange,
            ),
          ],
        ),
        value: value,
        onChanged: onChanged,
        activeColor: CtrtColors.primaryCarange,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
