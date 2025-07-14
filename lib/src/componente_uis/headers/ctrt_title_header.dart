import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtTitleHeader extends StatelessWidget {
  final String title;
  final void Function()? onBack, onTap;
  final double? padding, textSize;
  const CtrtTitleHeader({
    super.key,
    required this.title,
    this.onBack,
    this.padding,
    this.textSize,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: padding ?? 0.w, right: padding ?? 10.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              if (onBack != null)
              IconButton(
                onPressed: onBack,
                icon: Icon(
                  Icons.arrow_back,
                  color: CtrtColors.black,
                  size: 20.sp,
                ),
                padding: EdgeInsets.only(left: 3.w),
                // color: CtrtColors.lightGrey,
                // highlightColor: CtrtColors.lightGrey,
              ),
              if(onBack == null)
              SizedBox(width: 20.w),
              CtrtText.bold(text: title, textSize: textSize ?? 16.sp),
            ],
          ),
          if (onTap != null)
            InkWell(
              onTap: onTap,
              child: Container(
                width: 45.w,
                height: 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: CtrtColors.primaryCarange,
                ),
                child: Icon(
                  Icons.file_open,
                  color: CtrtColors.white,
                  size: 20.spMin,
                ),
              ),
            ),
        ],
      ),
    );
  }
}
