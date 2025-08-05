import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtTextField extends StatefulWidget {
  final String? label, prefixText, hintText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final Widget? prefixIcon, suffixIcon;
  final bool readOnly;
  final void Function()? onTap;
  final Color? fillColor;
  final bool fill;
  final int? maxLines;
  final FocusNode? focusNode;
  final bool withBorderRadius;
  final double? borderRadius, textSize, labelSize;
  final EdgeInsets? contentPadding;
  final double? height;
  final bool responsive;
  const CtrtTextField({
    super.key,
    this.label,
    this.prefixText,
    this.hintText,
    this.onChanged,
    this.validator = CtrtValidator.requiredValidation,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.prefixIcon,
    this.readOnly = false,
    this.onTap,
    this.fill = true,
    this.fillColor,
    this.maxLines,
    this.suffixIcon,
    this.focusNode,
    this.withBorderRadius = true,
    this.borderRadius = 12,
    this.textSize = 12.5,
    this.labelSize = 11,
    this.contentPadding,
    this.responsive = false,
    this.height,
    });

  @override
  State<CtrtTextField> createState() => _CtrtTextFieldState();
}

class _CtrtTextFieldState extends State<CtrtTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      onChanged: widget.onChanged,
      validator: widget.validator,
      cursorColor: CtrtColors.textPrimary,
      readOnly: widget.readOnly,
      onTap: widget.onTap,
      maxLines: widget.maxLines,
      style: CtrtThemes.fieldStyle(fontSize: widget.textSize),
      decoration: InputDecoration(
        constraints: widget.height != null ? BoxConstraints(
          maxHeight: widget.height?? 45,
          minHeight: widget.height?? 45,
        ): null,
        contentPadding: widget.contentPadding,
        prefixIcon: widget.prefixIcon,
        prefixText: widget.prefixText,
        suffixIcon: widget.suffixIcon,
        labelText: widget.label,
        hintText: widget.hintText,
        filled: widget.fill,
        fillColor: widget.fillColor ?? CtrtColors.white,
        labelStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize),
        hintStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.textSize),
        border: CtrtThemes.fieldBorderRadius(radius: widget.borderRadius, whithBoder: widget.withBorderRadius),
        enabledBorder: CtrtThemes.fieldBorderRadius(radius: widget.borderRadius, whithBoder: widget.withBorderRadius),
        focusedBorder: CtrtThemes.fieldSelectedBorder(radius: widget.borderRadius, whithBoder: widget.withBorderRadius),
      ),
    );
  }
}
