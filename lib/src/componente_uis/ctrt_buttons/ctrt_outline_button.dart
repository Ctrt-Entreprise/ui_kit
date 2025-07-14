import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtOutlineButton extends StatelessWidget {
  final String text;
  final Color? color;
  final double? radius, paddingV, paddingH, textSize;
  final void Function()? onClick;
  final Widget? icon;
  const CtrtOutlineButton({
    super.key,
    required this.text,
    this.color,
    this.radius,
    this.onClick,
    this.icon,
    this.paddingV,
    this.paddingH,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal:paddingH??20, vertical: paddingV??12),
        decoration: BoxDecoration(
          border: Border.all(
            color: color ?? CtrtColors.primary,
          ),
          borderRadius: BorderRadius.circular(radius ?? 8),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon != null ? icon! : Container(),
            CtrtText.bold(
              text: text,
              textColor: color ?? CtrtColors.primary,
              textSize: textSize??16,
            ),
          ],
        ),
      ),
    );
  }
}
