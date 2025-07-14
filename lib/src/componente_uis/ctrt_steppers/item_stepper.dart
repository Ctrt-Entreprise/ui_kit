import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class ItemStepper extends StatelessWidget {
  final String labelle;
  final String level;
  final bool conpleted;
  const ItemStepper({
    super.key,
    required this.labelle,
    this.conpleted = false,
    required this.level,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5),
      child: Row(
        spacing: 5,
        children: [
          Container(
            padding: EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: conpleted ? CtrtColors.darkGreen : CtrtColors.textSecondary,
                width: conpleted ? 2 : 1,
              ),
            ),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: conpleted ? CtrtColors.darkGreen : CtrtColors.lightGrey,
              ),
              child: conpleted
                  ? Center(
                      child: Icon(
                        Icons.check_circle_outlined,
                        color: CtrtColors.white,
                        size: 25,
                      ),
                    )
                  : Center(
                      child: CtrtText.bold(
                        text: level,
                        textSize: 20,
                        textColor: conpleted
                        ? CtrtColors.darkGreen
                        : CtrtColors.textSecondary,
                      ),
                    ),
            ),
          ),
          CtrtText.medium(
            text: labelle,
            textSize: 17,
            textColor: conpleted ? CtrtColors.textPrimary : CtrtColors.textSecondary,
          ),
        ],
      ),
    );
  }
}
