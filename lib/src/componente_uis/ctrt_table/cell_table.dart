import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';
import 'avatar_text_row.dart';
import 'avatar_title_subtitle_row.dart';
import 'badge_row.dart';
import 'title_subtitle_row.dart';

Widget getCustomWidget(CtrtTableCell cell) {
    switch (cell.type) {
      case CtrtCellWidgetType.avatarTextRow:
        return AvatarTextRow(
          text: cell.title ?? "N/A",
          imageUrl: cell.imageUrl ?? "",
        );
      case CtrtCellWidgetType.avatarTitleSubtitle:
        return AvatarTitleSubtitleRow(
          title: cell.title ?? "N/A",
          subtitle: cell.subtitle ?? "N/A",
          imageUrl: cell.imageUrl ?? "",
        );
      case CtrtCellWidgetType.titleSubtitle:
        return TitleSubtitleRow(
          title: cell.title ?? "N/A",
          subtitle: cell.subtitle ?? "N/A",
        );
      case CtrtCellWidgetType.badge:
        return BadgeRow(
          text: cell.title ?? "N/A",
          bgColor: Colors.grey,
          txtColor: Colors.white,
        );
      case CtrtCellWidgetType.text:
        return CtrtText.medium(
          text: cell.title ?? "N/A",
          textColor: cell.textColor,
          textSize: 10.5.spMin,
          textOverflow: TextOverflow.ellipsis,
        );
    }
  }