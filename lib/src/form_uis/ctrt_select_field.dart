import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_kit/ui_kit.dart';



class CtrtSelectField extends StatefulWidget {
  final String? label;
  final String? hint;
  final void Function(dynamic)? onChanged;
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
  final List<CtrtSelectItem> suggestions;
  final bool withBorderRadius;
  final dynamic defaultValue;
  final bool whithBoder;
  final double? radius;
  final double? fontSize, labelFontSize;
  final double? suffixIconSize;
  // final bool responsive;

  const CtrtSelectField({
    super.key,
    this.label,
    this.hint,
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
    required this.suggestions,
    this.withBorderRadius = true,
    this.defaultValue,
    this.whithBoder = true,
    this.radius,
    this.fontSize,
    this.labelFontSize,
    this.suffixIconSize,
    // this.responsive = false,
  });

  @override
  _CtrtSelectFieldState createState() => _CtrtSelectFieldState();
}

class _CtrtSelectFieldState extends State<CtrtSelectField> {
  late TextEditingController _textEditingController;
  late FocusNode _focusNode;
  List<CtrtSelectItem> _filteredSuggestions = [];

  @override
  void initState() {
    super.initState();
    _textEditingController = widget.controller ?? TextEditingController();
    _focusNode = FocusNode();
    _filteredSuggestions = widget.suggestions;

    if (widget.defaultValue != null && widget.suggestions.isNotEmpty) {
      final defaultItem = widget.suggestions.firstWhere(
        (item) => item.value == widget.defaultValue,
        orElse: () => widget.suggestions.first,
      );
      _textEditingController.text = defaultItem.label ?? "";
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onChanged?.call(defaultItem.value);
      });
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() {
          _filteredSuggestions = widget.suggestions;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RawAutocomplete<CtrtSelectItem>(
      textEditingController: _textEditingController,
      focusNode: _focusNode,
      optionsBuilder: (TextEditingValue textEditingValue) {
        final String input = textEditingValue.text.toLowerCase();
        if (_focusNode.hasFocus && input.isEmpty) {
          _filteredSuggestions = widget.suggestions;
          return _filteredSuggestions;
        }
        _filteredSuggestions =
            widget.suggestions
                .where(
                  (suggestion) => suggestion.label?.toLowerCase().contains(input) ?? false,
                )
                .toList();
        return _filteredSuggestions;
      },
      onSelected: (CtrtSelectItem selection) {
        setState(() {
          _textEditingController.text = selection.label ?? "";
          _filteredSuggestions = [];
        });
        _focusNode.unfocus();
        widget.onChanged?.call(selection.value);
      },
      fieldViewBuilder: (
        BuildContext context,
        TextEditingController controller,
        FocusNode focusNode,
        VoidCallback onFieldSubmitted,
      ) {
        return TextFormField(
          controller: controller,
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          onChanged: (value) {
            setState(() {
              _filteredSuggestions =
                  widget.suggestions
                      .where(
                        (suggestion) => suggestion.label?.toLowerCase().contains(
                          value.toLowerCase(),
                        ) ?? false,
                      )
                      .toList();
            });
            widget.onChanged?.call(value);
          },
          validator: widget.validator,
          cursorColor: CtrtColors.textPrimary,
          readOnly: widget.readOnly,
          onTap: widget.onTap,
          maxLines: 1, //widget.maxLines,
          style: CtrtThemes.fieldStyle(fontSize: widget.fontSize ?? 16),
          focusNode: focusNode,
          decoration: InputDecoration(
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon ??Icon(Icons.arrow_drop_down, color: CtrtColors.textPrimary, size: 20), 
            labelText: widget.label,
            filled: widget.fill,
            fillColor: widget.fillColor ?? CtrtColors.white,
            labelStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.labelFontSize ?? 16),
            border: CtrtThemes.fieldBorderRadius(radius: widget.radius, whithBoder: widget.withBorderRadius),
            enabledBorder: CtrtThemes.fieldBorderRadius(radius: widget.radius, whithBoder: widget.withBorderRadius),
            focusedBorder: CtrtThemes.fieldSelectedBorder(radius: widget.radius, whithBoder: widget.withBorderRadius),
          ),

          // decoration: InputDecoration(
          //   prefixIcon: widget.prefixIcon,
          //   suffixIcon: widget.suffixIcon ?? Icon(Icons.expand_more_outlined, color: CtrtColors.textPrimary, size: widget.suffixIconSize ?? 20),
          //   labelText: widget.label,
          //   hintText: widget.hint,
          //   hintStyle: CtrtThemes.fieldLabelStyle(fontSize: (widget.fontSize ?? 16)),
          //   filled: widget.fill,
          //   fillColor: widget.fillColor ?? CtrtColors.primaryTransparentColor,
          //   contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          //   labelStyle: CtrtThemes.fieldLabelStyle(fontSize: (widget.fontSize ?? 16)),
          //   border: CtrtThemes.fieldBorderRadius(whithBoder: widget.whithBoder, radius: widget.radius ?? 12),
          //   enabledBorder: CtrtThemes.fieldBorderRadius(whithBoder: widget.whithBoder, radius: widget.radius ?? 12),
          //   focusedBorder: CtrtThemes.fieldSelectedBorder(whithBoder: widget.whithBoder, radius: widget.radius ?? 12),
          // ),
        );
      },
      optionsViewBuilder: (
        BuildContext context,
        AutocompleteOnSelected<CtrtSelectItem> onSelected,
        Iterable<CtrtSelectItem> options,
      ) {
        return Align(
          alignment: Alignment.topLeft,
          child: Material(
            elevation: 4,
            color: CtrtColors.white,
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: options.length,
                itemBuilder: (BuildContext context, int index) {
                  final String option = options.elementAt(index).label ?? "";
                  return ListTile(
                    title: Text(option),
                    onTap: () => onSelected(options.elementAt(index)),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }
}



// class CtrtSelectField extends StatefulWidget {
//   final String? label;
//   final void Function(dynamic)? onChanged;
//   final String? Function(String?)? validator;
//   final TextInputType? keyboardType;
//   final List<TextInputFormatter>? inputFormatters;
//   final TextEditingController? controller;
//   final Widget? prefixIcon, suffixIcon;
//   final bool readOnly;
//   final void Function()? onTap;
//   final Color? fillColor;
//   final bool fill;
//   final int? maxLines;
//   final List<CtrtSelectItem> suggestions;
//   final bool withBorderRadius;
//   final dynamic defaultValue;
//   final double? borderRadius, textSize, labelSize;


//   final bool responsive;
//   const CtrtSelectField({
//     super.key,
//     this.label,
//     this.onChanged,
//     this.validator = CtrtValidator.requiredValidation,
//     this.keyboardType,
//     this.inputFormatters,
//     this.controller,
//     this.prefixIcon,
//     this.readOnly = false,
//     this.onTap,
//     this.fill = true,
//     this.fillColor,
//     this.maxLines,
//     this.suffixIcon,
//     required this.suggestions,
//     this.withBorderRadius = true,
//     this.defaultValue,
//     this.responsive = false,
//     this.borderRadius,
//     this.textSize,
//     this.labelSize,
//   });

//   @override
//   _CtrtSelectFieldState createState() => _CtrtSelectFieldState();
// }

// class _CtrtSelectFieldState extends State<CtrtSelectField> {
//   late TextEditingController _textEditingController;
//   late FocusNode _focusNode;
//   List<CtrtSelectItem> _filteredSuggestions = [];
//   CtrtSelectItem? _selectedItem;

//   @override
//   void initState() {
//     super.initState();
//     _textEditingController = widget.controller ?? TextEditingController();
//     _focusNode = FocusNode();
//     _filteredSuggestions = widget.suggestions;

//     _setDefaultValue();

//     _focusNode.addListener(() {
//       if (_focusNode.hasFocus) {
//         setState(() {
//           _filteredSuggestions = widget.suggestions;
//         });
//       }
//     });
//   }

//   @override
//   void didUpdateWidget(CtrtSelectField oldWidget) {
//     super.didUpdateWidget(oldWidget);
//     if (oldWidget.defaultValue != widget.defaultValue) {
//       _setDefaultValue();
//     }
//   }

//   void _setDefaultValue() {
//     if (widget.suggestions.isNotEmpty && widget.defaultValue != null) {
//       try {
//         _selectedItem = widget.suggestions.firstWhere(
//           (item) => item.value == widget.defaultValue,
//           orElse: () => widget.suggestions.first,
//         );
        
//         _textEditingController.text = _selectedItem?.label ?? "";
        
//         WidgetsBinding.instance.addPostFrameCallback((_) {
//           widget.onChanged?.call(_selectedItem?.value);
//         });
//       } catch (e) {
//         print('Erreur lors de la sélection du defaultValue: $e');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return RawAutocomplete<CtrtSelectItem>(
//       textEditingController: _textEditingController,
//       focusNode: _focusNode,
//       optionsBuilder: (TextEditingValue textEditingValue) {
//         final String input = textEditingValue.text.toLowerCase();
        
//         if (widget.suggestions.isEmpty) {
//           return const <CtrtSelectItem>[];
//         }
        
//         if (_focusNode.hasFocus && input.isEmpty) {
//           _filteredSuggestions = widget.suggestions;
//           return _filteredSuggestions;
//         }
        
//         _filteredSuggestions = widget.suggestions
//         .where((suggestion) => suggestion.label?.toLowerCase().contains(input) ?? false)
//         .toList();
        
//         return _filteredSuggestions;
//       },
//       onSelected: (CtrtSelectItem selection) {
//         setState(() {
//           _selectedItem = selection;
//           _textEditingController.text = selection.label ?? "";
//           _filteredSuggestions = [];
//         });
//         _focusNode.unfocus();
//         widget.onChanged?.call(selection.value);
//       },
//       fieldViewBuilder: (BuildContext context,  TextEditingController controller,  FocusNode focusNode, VoidCallback onFieldSubmitted) {
//         return TextFormField(
//           controller: controller,
//           keyboardType: widget.keyboardType,
//           inputFormatters: widget.inputFormatters,
//           onChanged: (value) {
//             setState(() {
//               _filteredSuggestions = widget.suggestions.where((suggestion) => suggestion.label?.toLowerCase().contains(value.toLowerCase()) ?? false).toList();
//             });
//             widget.onChanged?.call(value);
//           },
//           validator: widget.validator,
//           cursorColor: CtrtColors.textPrimary,
//           readOnly: widget.readOnly,
//           onTap: widget.onTap,
//           maxLines: widget.maxLines,
//           style: CtrtThemes.fieldStyle(fontSize: widget.textSize),
//           focusNode: focusNode,
//           decoration: InputDecoration(
//             prefixIcon: widget.prefixIcon,
//             suffixIcon: widget.suffixIcon ??Icon(Icons.arrow_drop_down, color: CtrtColors.textPrimary, size: 20), 
//             labelText: widget.label,
//             filled: widget.fill,
//             fillColor: widget.fillColor ?? CtrtColors.white,
//             labelStyle: CtrtThemes.fieldLabelStyle(fontSize: widget.labelSize),
//             border: CtrtThemes.fieldBorderRadius(radius: widget.borderRadius, whithBoder: widget.withBorderRadius),
//             enabledBorder: CtrtThemes.fieldBorderRadius(radius: widget.borderRadius, whithBoder: widget.withBorderRadius),
//             focusedBorder: CtrtThemes.fieldSelectedBorder(radius: widget.borderRadius, whithBoder: widget.withBorderRadius),
//           ),
//         );
//       },
//       optionsViewBuilder: (BuildContext context,  AutocompleteOnSelected<CtrtSelectItem> onSelected, Iterable<CtrtSelectItem> options) {
//         if (options.isEmpty) {
//           return const SizedBox.shrink();
//         }
//         return Align(
//           alignment: Alignment.topLeft,
//           child: Material(
//             elevation: 4,
//             color: CtrtColors.white,
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(maxHeight: 200),
//               child: ListView.builder(
//                 padding: EdgeInsets.zero,
//                 itemCount: options.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final String option = options.elementAt(index).label ?? "";
//                   return ListTile(
//                     title: Text(option),
//                     onTap: () => onSelected(options.elementAt(index)),
//                   );
//                 },
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }