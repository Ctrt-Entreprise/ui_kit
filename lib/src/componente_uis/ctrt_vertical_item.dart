import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtVerticalItem extends StatelessWidget {
  final String title;
  final String? value, subValue, subSubValue;
  final bool isExpanded;
  final Color? valueColor;
  const CtrtVerticalItem({
    super.key,
    required this.title,
    this.value,
    this.subValue,
    this.subSubValue,
    this.isExpanded = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return isExpanded
        ? Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CtrtText.regular(text: title, textSize: 12.spMin),
              CtrtText.extraMedium(text: value != null && value != '' ? value! : 'INDISPONIBLE', textSize: 14.spMin, textColor: valueColor, textOverflow: TextOverflow.fade),
              if (subValue != null)
                CtrtText.medium(text: subValue ?? '', textSize: 12.spMin),
              if (subSubValue != null)
                CtrtText.medium(text: subSubValue ?? '', textSize: 12.spMin),
            ],
          ),
        )
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CtrtText.regular(text: title, textSize: 12.spMin),
            CtrtText.extraMedium(text: value != null && value != '' ? value! : 'INDISPONIBLE', textSize: 14.spMin, textOverflow: TextOverflow.fade),
            if (subValue != null)
              CtrtText.medium(text: subValue ?? '', textSize: 12.spMin),
            if (subSubValue != null)
            CtrtText.medium(text: subSubValue ?? '', textSize: 12.spMin),
          ],
        );
  }
}
