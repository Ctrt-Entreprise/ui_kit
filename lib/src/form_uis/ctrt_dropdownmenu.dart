import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtDropdownmenu extends StatefulWidget {
  final List<CtrtSelectItem> suggestions;
  final String? label;
  final String? hinttext;
  final void Function(CtrtSelectItem?)? onChanged;
  final bool withBorderRadius;
  final double? borderRadius;
  final double? fontSize;
  final double? labelSize;
  final double? height;
  final EdgeInsets? contentPadding;
  final bool fill;
  final Color? fillColor;
  final CtrtSelectItem? defaultValue; // Ajout du defaultValue

  const CtrtDropdownmenu({
    super.key,
    required this.suggestions,
    this.label,
    this.hinttext,
    this.onChanged,
    required this.withBorderRadius,
    this.borderRadius,
    this.fontSize,
    this.labelSize,
    this.height,
    this.contentPadding,
    this.fill = false,
    this.fillColor,
    this.defaultValue, // Ajout dans le constructeur
  });

  @override
  State<CtrtDropdownmenu> createState() => _CtrtDropdownmenuState();
}

class _CtrtDropdownmenuState extends State<CtrtDropdownmenu> {
  CtrtSelectItem? selectedStatus;

  @override
  void initState() {
    super.initState();
    // Initialiser selectedStatus avec defaultValue si fourni
    selectedStatus = widget.defaultValue;
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: CtrtColors.white),
      child: DropdownButtonFormField<CtrtSelectItem>(
        // controller: widget.controller,
        value: selectedStatus,
        hint: Text(
          widget.hinttext ?? "",
          style: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize ?? 16),
        ),
        decoration: InputDecoration(
          fillColor: widget.fillColor,
          filled: widget.fill,
          constraints: widget.height != null
          ? BoxConstraints(
            maxHeight: widget.height ?? 45,
            minHeight: widget.height ?? 45,
          ): null,
          contentPadding: widget.contentPadding,
          border: CtrtThemes.fieldBorderRadius(
            radius: widget.borderRadius,
            whithBoder: widget.withBorderRadius,
          ),
          enabledBorder: CtrtThemes.fieldBorderRadius(
            radius: widget.borderRadius,
            whithBoder: widget.withBorderRadius,
          ),
          focusedBorder: CtrtThemes.fieldSelectedBorder(
            radius: widget.borderRadius,
            whithBoder: widget.withBorderRadius,
          ),
          hintText: widget.hinttext,
          hintStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize ?? 16),
          labelText: widget.label,
          labelStyle: CtrtThemes.fieldLabelStyle(
            fontSize: widget.labelSize ?? 16,
          ),
        ),
        items:
            widget.suggestions.map((item) {
              return DropdownMenuItem<CtrtSelectItem>(
                value: item,
                child: Text(
                  item.label ?? "",
                  style: CtrtThemes.fieldStyle(fontSize: widget.fontSize ?? 16),
                ),
              );
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
