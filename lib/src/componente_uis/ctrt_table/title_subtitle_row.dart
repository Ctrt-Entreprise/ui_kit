import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class TitleSubtitleRow extends StatelessWidget {
  final String title;
  final String subtitle;

  const TitleSubtitleRow({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CtrtText.medium(text: title, textSize: 10.5.spMin, textOverflow: TextOverflow.ellipsis),
            CtrtText.regular(text: subtitle, textSize: 10.spMin, textOverflow: TextOverflow.ellipsis),
          ],
        ),
        ),
      ],
    );
  }
}
