import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtBadge extends StatelessWidget {
  final String? status;
  final void Function(String? value)? onClick;
  final void Function()? onPayment;
  const CtrtBadge({super.key, this.status, this.onClick, this.onPayment});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPayment ?? () {
        if (onClick != null) {
          String? newvalue = "";
          CtrtDialogs.popup(
            context: context,
            height: 0.3,
            width: 350.w,
            contents: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 20.h,
                  children: [
                    CtrtText.bold(
                      text: "Changement du statut de paiement",
                      textSize: 15.spMin,
                    ),
                    CtrtDropdownmenu(
                      hinttext: "Statut de paiement",
                      suggestions: [
                        CtrtSelectItem(label: "Payé", value: "PAID"),
                        CtrtSelectItem(label: "Non Payé", value: "PAUNPAIDID"),
                      ],
                      withBorderRadius: true,
                      onChanged: (value) {
                        newvalue = value?.value;
                      },
                    ),
                    Row(
                      spacing: 10.w,
                      children: [
                        Expanded(
                          child: CtrtButton(
                            text: "Annuler",
                            textSize: 12.5.spMin,
                            color: CtrtColors.darkRed,
                            pV: 15.h,
                            pH: 10.w,
                            onClick: () async {
                             Navigator.pop(context);
                            },
                          ),
                        ),
                        Expanded(
                          child: CtrtButton(
                            text: "Valider",
                            textSize: 12.5.spMin,
                            color: CtrtColors.black,
                            pV: 15.h,
                            pH: 10.w,
                            onClick: () async {
                              onClick?.call(newvalue);
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      },
      child: Container(
        height: 30.h,
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
        decoration: BoxDecoration(
          color: CtrtColors.badgeBGColor[status ?? ""],
          borderRadius: BorderRadius.circular(10.spMin),
          border: Border.all(
            color: CtrtColors.badgeTxtColor[status ?? ""] ?? Colors.transparent,
            width: 0.5.spMin,
          ),
        ),
        child: Row(
          spacing: 5.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CtrtText.bold(
              text: status ?? "",
              textSize: 10.spMin,
              textColor: status != null ? CtrtColors.badgeTxtColor[status ?? ""] : null,
            ),
            if (onClick != null || onPayment != null)
              Icon(
                Icons.change_circle,
                color: status != null ? CtrtColors.badgeTxtColor[status ?? ""] : null,
                size: 16.sp,
              ),
          ],
        ),
      ),
    );
  }
}
