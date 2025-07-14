import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/src/themes/ctrt_colors.dart';

class CtrtCircularProdessBar extends StatelessWidget {
  final bool isVisible;
  final Duration duration;
  final Color? color;
  final double? size;

  const CtrtCircularProdessBar({
    super.key,
    required this.isVisible,
    this.duration = const Duration(milliseconds: 300),
    this.color,
    this.size
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: duration,
      transitionBuilder: (child, animation) {
        return ScaleTransition(
          scale: animation,
          child: FadeTransition(opacity: animation, child: child),
        );
      },
      child:
          isVisible
              ? Container(
                width: size?? 45.w,
                height: size?? 45.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (color ?? CtrtColors.primary).withValues(alpha: 0.3)
                ),
                padding: EdgeInsets.all(8.w),
                margin: EdgeInsets.only(top: 10.h),
                child: CircularProgressIndicator(
                  key: ValueKey('progress'),
                  valueColor: AlwaysStoppedAnimation<Color>(
                    color ?? CtrtColors.primary,
                  ),
                  strokeWidth: 2.w,
                ),
              )
              : SizedBox.shrink(key: ValueKey('empty')),
    );
  }
}
