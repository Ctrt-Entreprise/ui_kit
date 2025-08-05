import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:intl/intl.dart';

class CtrtDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;
  final String label;
  final double? width;
  final double? height;
  final double? borderRadius;
  final double? paddingH;
  final double? paddingV;
  final bool responsive;
  final double? textSize, labelSize;
  final double? iconSize;
  final bool withBorderRadius;
  final bool fill;
  final Color? fillColor;
  final Widget? icon;
  final FormFieldValidator<String>? validator;
  final EdgeInsets? contentPadding;

  const CtrtDatePicker({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.label = 'Date',
    this.width,
    this.height,
    this.borderRadius,
    this.paddingH,
    this.paddingV,
    this.responsive = false,
    this.textSize,
    this.labelSize,
    this.iconSize,
    this.withBorderRadius = true,
    this.fill = true,
    this.fillColor,
    this.icon,
    this.validator,
    this.contentPadding,
  });

  @override
  State<CtrtDatePicker> createState() => _CtrtDatePickerState();
}

class _CtrtDatePickerState extends State<CtrtDatePicker> {
  late DateTime? selectedDate;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: TextEditingController(
        text: selectedDate != null ? DateFormat('dd MMM.yyyy', 'fr_FR').format(selectedDate!): '',
      ),
      onTap: () => _selectDate(context),
      style: CtrtThemes.fieldStyle(fontSize: widget.textSize ?? 16),
      decoration: InputDecoration(
        constraints: widget.height != null ? BoxConstraints(
          maxHeight: widget.height?? 45,
          minHeight: widget.height?? 45,
        ): null,
        contentPadding: widget.contentPadding,
        prefixIcon: widget.icon,
        suffixIcon: Icon(Icons.calendar_month, color: CtrtColors.textPrimary, size: 20), 
        labelText: widget.label,
        filled: widget.fill,
        fillColor: widget.fillColor ?? CtrtColors.white,
        labelStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize?? 16),
        border: CtrtThemes.fieldBorderRadius(radius: widget.borderRadius ?? 12, whithBoder: widget.withBorderRadius),
        enabledBorder: CtrtThemes.fieldBorderRadius(radius: widget.borderRadius ?? 12, whithBoder: widget.withBorderRadius),
        focusedBorder: CtrtThemes.fieldSelectedBorder(radius: widget.borderRadius ?? 12, whithBoder: widget.withBorderRadius),
      ),
      validator: widget.validator,
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2026),
      locale: const Locale('fr', 'FR'),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
      widget.onDateSelected(picked);
    }
  }
}
