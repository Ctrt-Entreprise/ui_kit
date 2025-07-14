import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtTextButton extends StatelessWidget {
  final String text;
  final double? textSize;
  final void Function()? onClick;
  final Color? textColor;
  const CtrtTextButton({
    super.key,
    required this.text,
    this.onClick,
    this.textSize,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: CtrtText.regular(
        text: text,
        textSize: textSize ?? 12,
        textColor: textColor,
      ),
    );
  }
}
