import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtSelectedTab extends StatefulWidget {
  final String? label;
  final List<String> items;
  String selectedItem;
  final Function(String) onSelect;

  CtrtSelectedTab({
    super.key,
    this.label,
    required this.items,
    required this.selectedItem,
    required this.onSelect,
  });

  @override
  State<CtrtSelectedTab> createState() => _CtrtSelectedTabState();
}

class _CtrtSelectedTabState extends State<CtrtSelectedTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: widget.label != null,
            child: Column(
              children: [
                CtrtText.extraRegular(
                  text: widget.label ?? "",
                  textSize: 12.5.sp,
                  textColor: CtrtColors.black,
                ),
                SizedBox(height: 10.h),
              ],
            ),
          ),
          Row(
            spacing: 10.w,
            children:
                widget.items
                    .map(
                      (item) => Expanded(
                        child: GestureDetector(
                          onTap: () => setState(() {
                            widget.selectedItem = item;
                            widget.onSelect(item);
                          }),
                          child: Container(
                            padding: EdgeInsets.symmetric(vertical: 10.h),
                            decoration: BoxDecoration(
                              color: widget.selectedItem == item
                              ? CtrtColors.black
                              : CtrtColors.lightGrey,
                              borderRadius: BorderRadius.circular(5.w),
                            ),
                            child: Center(
                              child: CtrtText.medium(
                                text: item,
                                textSize: 14.sp,
                                textColor: widget.selectedItem == item
                                ? CtrtColors.white
                                : CtrtColors.black,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ).toList(),
          ),
        ],
      ),
    );
  }
}
