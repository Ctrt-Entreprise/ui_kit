import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/src/themes/index.dart';

class CtrtPasswordField extends StatefulWidget {
  final String? label, hintText;
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
  final bool responsive;
  final double? textSize, labelSize, borderRadius;
  final bool withBorderRadius;
  final EdgeInsets? contentPadding;
  final double? height;
  const CtrtPasswordField({
    super.key,
    this.label,
    this.hintText,
    this.onChanged,
    this.validator,
    this.keyboardType,
    this.inputFormatters,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.readOnly = false,
    this.onTap,
    this.fill = true,
    this.fillColor,
    this.responsive = false,
    this.textSize,
    this.labelSize,
    this.borderRadius,
    this.withBorderRadius = true,
    this.contentPadding,
    this.height,
  });

  @override
  State<CtrtPasswordField> createState() => _CtrtPasswordFieldState();
}

class _CtrtPasswordFieldState extends State<CtrtPasswordField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: widget.inputFormatters,
        onChanged: widget.onChanged,
        validator: widget.validator ?? CtrtValidator.requiredValidation,
        cursorColor: CtrtColors.textPrimary,
        readOnly: widget.readOnly,
        onTap: widget.onTap,
        maxLines: 1,
        obscureText: _obscureText,
        style: CtrtThemes.fieldStyle(fontSize: widget.textSize),
        decoration: InputDecoration(
          constraints: widget.height != null ? BoxConstraints(
            maxHeight: widget.height?? 45,
            minHeight: widget.height?? 45,
          ): null,
          contentPadding: widget.contentPadding,
          prefixIcon: widget.prefixIcon,
          suffixIcon: widget.suffixIcon ?? IconButton(
            icon: Icon(
              color: CtrtColors.darkGrey,
              _obscureText ? Icons.visibility : Icons.visibility_off,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
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
