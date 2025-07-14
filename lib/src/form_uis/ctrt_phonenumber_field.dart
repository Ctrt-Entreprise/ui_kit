import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtPhonenumberField extends StatefulWidget {
  final String? label, indicatif;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final Color? fillColor;
  const CtrtPhonenumberField({
    super.key,
    this.controller,
    this.validator,
    this.label,
    this.indicatif,
    this.fillColor,
  });

  @override
  State<CtrtPhonenumberField> createState() => _CtrtPhonenumberFieldState();
}

class _CtrtPhonenumberFieldState extends State<CtrtPhonenumberField> {
  @override
  Widget build(BuildContext context) {
    return CtrtTextField(
      controller: widget.controller,
      label: widget.label,
      prefixIcon: SizedBox(
        width: 60,
        child: Row(
          spacing: 5,
          children: [
            SizedBox(width: 10),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CtrtText.extraMedium(
                  text: widget.indicatif ?? "+221",
                  textColor: CtrtColors.textSecondary,
                ),
                SizedBox(height: 2)
              ],
            ),
            Container(
              width: 1,
              height: 27,
              decoration: BoxDecoration(
                color: CtrtColors.darkGrey,
              ),
            )
          ],
        ),
      ),
      keyboardType: TextInputType.number,
      validator: widget.validator,
      fillColor: widget.fillColor,
    );
  }
}
