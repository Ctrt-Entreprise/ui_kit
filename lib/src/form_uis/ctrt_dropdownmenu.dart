import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtDropdownmenu extends StatefulWidget {
  final List<CtrtSelectItem> suggestions;
  final String? label;
  final String? hinttext;
  final void Function(CtrtSelectItem?)? onChanged;
  final bool withBorderRadius;
  final double? radius;
  final double? fontSize;
  final double? labelSize;
  const CtrtDropdownmenu({
    super.key,
    required this.suggestions,
    this.label,
    this.hinttext,
    this.onChanged,
    required this.withBorderRadius,
    this.radius,
    this.fontSize,
    this.labelSize
  });

  @override
  State<CtrtDropdownmenu> createState() => _CtrtDropdownmenuState();
}

class _CtrtDropdownmenuState extends State<CtrtDropdownmenu> {
  CtrtSelectItem? selectedStatus;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: CtrtColors.white
      ),
      child: DropdownButtonFormField<CtrtSelectItem>(
      value: selectedStatus,
      hint: Text(widget.hinttext??"", style: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize??16),),
      decoration: InputDecoration(
        border: CtrtThemes.fieldBorderRadius(
          radius: widget.radius,
          whithBoder: widget.withBorderRadius,
        ),
        enabledBorder: CtrtThemes.fieldBorderRadius(
          radius: widget.radius,
          whithBoder: widget.withBorderRadius,
        ),
        focusedBorder: CtrtThemes.fieldSelectedBorder(
          radius: widget.radius,
          whithBoder: widget.withBorderRadius,
        ),
        labelText: widget.label,
        labelStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize??16),
      ),
      items:  widget.suggestions.map((item) {
        return DropdownMenuItem<CtrtSelectItem>(
        value: item,
         child: Text(
        item.label ?? "",
        style: CtrtThemes.fieldStyle(fontSize: widget.fontSize ?? 16),
      ));
      }).toList(),
      onChanged: (value) {
        setState(() {
          selectedStatus = value;
        });
        widget.onChanged?.call(value);
      },
      ),
    );
  }
}
