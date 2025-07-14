import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtButton extends StatelessWidget {
  final String text;
  final Color? color, textColor, borderColor;
  final double? radius, pV, pH, textSize, height, spacing, width;
  final void Function()? onClick;
  final Widget? icon;
  const CtrtButton({
    super.key,
    required this.text,
    this.color,
    this.textColor,
    this.radius,
    this.onClick,
    this.icon,
    this.pV,
    this.pH,
    this.textSize,
    this.height,
    this.width,
    this.spacing,
    this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        height: height,
        width: width,
        padding: EdgeInsets.symmetric(horizontal:pH?? 20, vertical: pV?? 12),
        decoration: BoxDecoration(
          color: color ?? CtrtColors.primary,
          borderRadius: BorderRadius.circular(radius ?? 8),
          border: borderColor!=null? Border.all(color: borderColor!): null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: spacing??5,
          children: [
            CtrtText.bold(
              text: text,
              textColor: textColor ?? CtrtColors.white,
              textSize: textSize??16,
            ),
            if(icon != null)
              icon!,
          ],
        ),
      ),
    );
  }
}
