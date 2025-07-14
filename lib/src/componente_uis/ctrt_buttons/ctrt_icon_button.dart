import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtIconButton extends StatelessWidget {
  final Widget icon;
  final Color? color, borderColor;
  final double? radius, padding, width, height;
  final void Function()? onClick;
  final bool isCircle;
  const CtrtIconButton({
    super.key,
    this.color,
    this.radius,
    this.onClick,
    required this.icon,
    this.isCircle = true,
    this.borderColor,
    this.padding,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      hoverColor: Colors.transparent,
      child: Container(
        width: width,
        height: height,
        padding: EdgeInsets.all(padding??10),
        decoration: BoxDecoration(
          color: color ?? CtrtColors.primary,
          borderRadius: !isCircle ? BorderRadius.circular(radius ?? 8) : null,
          shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
          border: borderColor != null ? Border.all(color: borderColor!, width: 1) : null,
        ),
        child: Center(
          child: icon,
        ),
      ),
    );
  }
}
