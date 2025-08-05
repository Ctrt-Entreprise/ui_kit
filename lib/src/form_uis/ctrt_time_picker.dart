import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtTimePicker extends StatefulWidget {
  final String initialTimeRange;
  final Function(String) onTimeRangeSelected;
  final List<String> timeRanges;
  final String label;
  final double? width;
  final double? height;
  final double? radius;
  final double? paddingH;
  final double? paddingV;
  final bool responsive;
  final double? textSize;
  final double? iconSize;
  final double? labelSize;
  final EdgeInsets? contentPadding;
  final bool fill;
  final Color? fillColor;
  final Widget? icon;
  final FormFieldValidator<String>? validator;
  final bool withBorderRadius;
  final double? borderRadius;
  final TextEditingController? controller;

  
  const CtrtTimePicker({
    super.key,
    required this.initialTimeRange,
    required this.onTimeRangeSelected,
    this.timeRanges = const [
      '08h-09h', '09h-10h', '10h-11h', '11h-12h', '12h-13h', '13h-14h', '14h-15h',
      '15h-16h', '16h-17h', '17h-18h', '18h-19h', '19h-20h', '20h-21h', '21h-22h',
      '22h-23h', '23h-00h'
    ],
    this.label = 'Heure',
    this.width,
    this.height,
    this.radius,
    this.paddingH,
    this.paddingV,
    this.responsive = false,
    this.textSize,
    this.iconSize,
    this.contentPadding,
    this.fill = true,
    this.fillColor,
    this.icon,
    this.validator,
    this.withBorderRadius = true,
    this.borderRadius,
    this.labelSize,
    this.controller,
    });

  @override
  State<CtrtTimePicker> createState() => _CtrtTimePickerState();
}

class _CtrtTimePickerState extends State<CtrtTimePicker> {
  late String? selectedTimeRange;

  @override
  void initState() {
    super.initState();
    selectedTimeRange = widget.initialTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    return  TextFormField(
      readOnly: true,
      controller: widget.controller ?? TextEditingController(
        text: selectedTimeRange ?? '12h - 13h',
      ),
      onTap: () => _selectTime(context),
      style: CtrtThemes.fieldStyle(fontSize: widget.textSize ?? 16),
      decoration: InputDecoration(
        constraints: widget.height != null ? BoxConstraints(
          maxHeight: widget.height?? 45,
          minHeight: widget.height?? 45,
        ): null,
        contentPadding: widget.contentPadding,
        prefixIcon: widget.icon,
        suffixIcon: Icon(Icons.access_time, color: CtrtColors.textPrimary, size: 20), 
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
    
    //  GestureDetector(
    //   onTap: () => _selectTime(context),
    //   child: Container(
    //     width: widget.width,
    //     height: widget.height,
    //     padding: EdgeInsets.symmetric(vertical: widget.paddingV ?? 12, horizontal: widget.paddingH ?? 16),
    //     decoration: BoxDecoration(
    //       color: Colors.white,
    //       borderRadius: BorderRadius.circular(widget.radius ?? 8),
    //       border: Border.all(color: Colors.grey[300]!),
    //     ),
    //     child: Row(
    //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //       children: [
    //         Text(
    //           selectedTimeRange,
    //           style: CtrtThemes.fieldStyle(fontSize: widget.textSize),
    //         ),
    //         Icon(Icons.access_time, size: widget.iconSize ?? 24),
    //       ],
    //     ),
    //   ),
    // );
  }

  void _selectTime(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Sélectionner une plage horaire'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: widget.timeRanges.map((timeRange) {
              return ListTile(
                title: Text(timeRange),
                onTap: () {
                  setState(() {
                    selectedTimeRange = timeRange;
                    if (widget.controller != null) {
                      widget.controller?.text = timeRange;
                    }
                  });
                  widget.onTimeRangeSelected(timeRange);
                  Navigator.pop(context);
                },
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
