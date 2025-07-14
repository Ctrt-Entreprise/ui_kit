import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtDialogs {
  static void bottomShette({
    required BuildContext context,
    required Widget content,
    isDis = true,
    double height = 0.95,
    bool isScrollControlled = false,
  }) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: CtrtColors.white,
      enableDrag: isDis,
      isDismissible: isDis,
      builder: (context) {
        return FractionallySizedBox(
          heightFactor: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                SizedBox(height: 20),
                Container(
                  width: 200,
                  height: 5,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: CtrtColors.textPrimary,
                  ),
                ),
                SizedBox(height: 20),
                Expanded(
                  child: isScrollControlled 
                      ? SingleChildScrollView(
                          child: SizedBox(
                            width: double.infinity,
                            child: content,
                          ),
                        )
                      : SizedBox(width: double.infinity, child: content),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void popup({
  required BuildContext context,
  required Widget contents,
  bool isDis = true,
  double height = 0.95,
  double width = 300,
  double? bottomPad
}) {
  showDialog(
    context: context,
    barrierDismissible: isDis,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          width: width,
          height: MediaQuery.of(context).size.height * height,
          decoration: BoxDecoration(
            color: CtrtColors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: bottomPad??100),
            child: contents,
          ),
        ),
      );
    },
  );
}

}
