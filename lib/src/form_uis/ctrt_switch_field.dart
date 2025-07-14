import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';
class CtrtSwitchField extends StatefulWidget {
  final String title;
  final bool value;
  final void Function(bool) onChanged;
  final double? textSize; 
  const CtrtSwitchField({super.key, required this.title, required this.value, required this.onChanged, this.textSize});

  @override
  State<CtrtSwitchField> createState() => _CtrtSwitchFieldState();
}

class _CtrtSwitchFieldState extends State<CtrtSwitchField> {
  bool value = false;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }
  @override 
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        listTileTheme: ListTileThemeData(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          dense: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 0.w),
          minLeadingWidth: 0.w,
          horizontalTitleGap: 0.w,
        ),
      ),
      child: SwitchListTile(
      title: CtrtText.extraMedium(text: widget.title, textSize: widget.textSize ?? 12),
      activeColor: CtrtColors.darkGreen,
      inactiveTrackColor: CtrtColors.lightGrey,
      value: value,
      onChanged: (bool newValue) {
        setState(() {
          value = newValue;
        });
        widget.onChanged(newValue);
      },
      dense: true,
    ));
  }
}