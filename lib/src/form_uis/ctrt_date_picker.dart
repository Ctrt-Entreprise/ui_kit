import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';
import 'package:intl/intl.dart';

class CtrtDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime) onDateSelected;
  final String label;
  final double? width;
  final double? height;
  final double? radius;
  final double? paddingH;
  final double? paddingV;
  final bool responsive;
  final double? textSize;
  final double? iconSize;
  
  const CtrtDatePicker({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.label = 'Date',
    this.width,
    this.height,
    this.radius,
    this.paddingH,
    this.paddingV,
    this.responsive = false,
    this.textSize,
    this.iconSize,
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
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        width: widget.width,
        height: widget.height,
        padding: EdgeInsets.symmetric(vertical: widget.paddingV ?? 12, horizontal: widget.paddingH ?? 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(widget.radius ?? 8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              selectedDate != null ? DateFormat('dd MMM.yyyy', 'fr_FR').format(selectedDate!) : '',
              style: CtrtThemes.fieldStyle(fontSize: widget.textSize),
            ),
            Icon(Icons.calendar_today, size: widget.iconSize ?? 24),
          ],
        ),
      ),
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