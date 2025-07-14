import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtRadioBox2 extends StatelessWidget {
  final String title;
  final String? description, loading;
  final bool isActive;
  final void Function()? onSelect;
  const CtrtRadioBox2({
    super.key,
    required this.title,
    this.description,
    required this.isActive,
    this.onSelect,
    this.loading,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onSelect,
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: CtrtColors.lightGrey, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        padding: EdgeInsets.symmetric(horizontal: 10.h, vertical: 15.h),
        margin: EdgeInsets.only(bottom: 15.h),
        child: Row(
          spacing: 10.w,
          children: [
            Container(
              padding: EdgeInsets.all(1.5.w),
              decoration: BoxDecoration(
                color: CtrtColors.white,
                border: Border.all(
                  color: isActive ? CtrtColors.darkGreen : CtrtColors.lightGrey,
                  width: 3.w,
                ),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Icon(
                  Icons.done,
                  color: isActive ? CtrtColors.darkGreen : CtrtColors.lightGrey,
                  size: 20.sp,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CtrtText.regular(
                    text: title,
                    textSize: 12.5.sp,
                    textOverflow: TextOverflow.fade,
                    onClick: onSelect
                  ),
                  if (description != null)
                    CtrtText.extraRegular(text: description!, textSize: 12.5.sp, onClick: onSelect, textOverflow: TextOverflow.fade, textColor: CtrtColors.textSecondary),
                ],
              ),
            ),
            if (loading != null)
              CtrtText.medium(
                text: loading!,
                textSize: loading == "PRIX SUR DEVIS" ? 8.sp :11.sp,
                textColor: CtrtColors.primaryCarange,
              ),
          ],
        ),
      ),
    );
  }
}
