import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

enum PaymentMethod { yas, wave, om }

class PaymentMethodSelector extends StatefulWidget {
  final List<PaymentMethod> options;
  final Function(PaymentMethod) onMethodSelected;
  final PaymentMethod? initialSelection;

  const PaymentMethodSelector({
    super.key,
    required this.options,
    required this.onMethodSelected,
    this.initialSelection,
  });

  @override
  State<PaymentMethodSelector> createState() => _PaymentMethodSelectorState();
}

class _PaymentMethodSelectorState extends State<PaymentMethodSelector> {
  PaymentMethod? _selectedMethod;

  @override
  void initState() {
    super.initState();
    _selectedMethod = widget.initialSelection;
  }

  void _handleMethodSelection(PaymentMethod method) {
    setState(() {
      _selectedMethod = method;
    });
    widget.onMethodSelected(method);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 10.h,
      children: [
        CtrtText.regular(text: 'Payez via', textSize: 14.spMin),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            for (var i = 0; i < widget.options.length; i++)
              PaymentMethodItem(
                method: widget.options[i],
                isSelected: _selectedMethod == widget.options[i],
                onTap: _handleMethodSelection,
              ),
          ],
        ),
      ],
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  final PaymentMethod method;
  final bool isSelected;
  final Function(PaymentMethod) onTap;

  const PaymentMethodItem({
    super.key,
    required this.method,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(method),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            width: 75.w,
            height: 75.h,
            margin: EdgeInsets.only(right: 15.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.13.r),
              border: isSelected ? Border.all(color: Colors.green, width: 2) : null,
              image: DecorationImage(
                image: _getMethodIcon(),
                fit: BoxFit.cover
              )
            ),
            
          ),
          if (isSelected)
            Positioned(
              right: 5.w,
              top: 0.h,
              child: Container(
                width: 20.w,
                height: 20.h,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, color: Colors.white, size: 15.spMin),
              ),
            ),
        ],
      ),
    );
  }

  ImageProvider _getMethodIcon() {
    switch (method) {
      case PaymentMethod.yas:
        return AssetImage(SharedAssets.mixx);
      case PaymentMethod.wave:
        return AssetImage(SharedAssets.wave);
      case PaymentMethod.om:
        return AssetImage(SharedAssets.orangeMoney);
    }
  }
}
