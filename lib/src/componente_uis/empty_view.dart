import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class EmptyView extends StatelessWidget {
  final String title;
  final String message;
  final IconData icon;
  final VoidCallback? onActionPressed;
  final String actionText;

  const EmptyView({
    super.key,
    this.title = 'Aucun résultat',
    this.message = 'Aucun élément à afficher pour le moment',
    this.icon = Icons.inbox_outlined,
    this.onActionPressed,
    this.actionText = 'Actualiser',
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 80.spMin,
              color: Theme.of(context).colorScheme.secondary.withValues(alpha: 0.7),
            ),
            SizedBox(height: 24.h),
            CtrtText.medium(
              text: title,
              textSize: 20.spMin,
              textColor: CtrtColors.textPrimary,
            ),
            SizedBox(height: 12.h),
            CtrtText.extraRegular(
              text: message,
              textSize: 16.spMin,
              textColor: CtrtColors.textSecondary,
            ),
            if (onActionPressed != null) ...[
              SizedBox(height: 24.h),
              CtrtButton(
                onClick: onActionPressed,
                text: actionText,
              ),
            ],
          ],
        ),
      ),
    );
  }
}