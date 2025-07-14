import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtRadioBox extends StatelessWidget {
  final String title;
  final String price;
  final int? value;
  final int? groupValue;
  final Function(int?) onChanged;
  const CtrtRadioBox({
    super.key,
    required this.title,
    required this.price,
    required this.value,
    required this.groupValue,
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
      child: RadioListTile<int?>(
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: CtrtText.regular(text: title, textSize: 15.sp, textOverflow: TextOverflow.fade)),
            CtrtText.medium(
              text: price,
              textSize: price == "PRIX SUR DEVIS" ? 8.sp :11.sp,
              textColor: CtrtColors.primaryCarange,
            ),
          ],
        ),
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
        activeColor: CtrtColors.primaryCarange,
        visualDensity: VisualDensity.compact,
      ),
    );
  }
}
