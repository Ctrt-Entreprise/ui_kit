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

  const CtrtTimePicker({
    Key? key,
    required this.initialTimeRange,
    required this.onTimeRangeSelected,
    this.timeRanges = const ['08h - 12h', '12h - 16h', '16h - 20h'],
    this.label = 'Heure',
    this.width,
    this.height,
    this.radius,
    this.paddingH,
    this.paddingV,
    this.responsive = false,
    this.textSize,
    this.iconSize,
  }) : super(key: key);

  @override
  State<CtrtTimePicker> createState() => _CtrtTimePickerState();
}

class _CtrtTimePickerState extends State<CtrtTimePicker> {
  late String selectedTimeRange;

  @override
  void initState() {
    super.initState();
    selectedTimeRange = widget.initialTimeRange;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectTime(context),
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
              selectedTimeRange,
              style: CtrtThemes.fieldStyle(fontSize: widget.textSize),
            ),
            Icon(Icons.access_time, size: widget.iconSize ?? 24),
          ],
        ),
      ),
    );
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
