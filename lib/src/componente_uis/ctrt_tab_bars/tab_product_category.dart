import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:ui_kit/ui_kit.dart';

class TabProductCategory extends StatefulWidget {
  final List<CtrtTabModel> tabs;
  CtrtTabModel selected;
  final Color? activeColor;
  
  TabProductCategory({
    super.key,
    required this.tabs,
    required this.selected,
    this.activeColor,
  });

  @override
  State<TabProductCategory> createState() => _TabProductCategoryState();
}

class _TabProductCategoryState extends State<TabProductCategory> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: ListView(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        children: [
          for (var i = 0; i < widget.tabs.length; i++)
            ItemTab(
              value: widget.tabs[i],
              active: widget.selected.value == widget.tabs[i].value,
              activeColor: widget.activeColor,
            ),
        ],
      ),
    );
  }
}

class ItemTab extends StatelessWidget {
  final CtrtTabModel value;
  final bool active;
  final Color? activeColor;
  const ItemTab({
    super.key,
    required this.active,
    required this.value,
    this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        color: active
        ? activeColor ?? CtrtColors.primary
        : CtrtColors.transparentGrey,
        border: Border.all(
          color: active ? Colors.transparent : CtrtColors.lightGrey,
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Center(
        child: CtrtText.extraMedium(
          text: value.label,
          textSize: 13,
          textColor: active ? CtrtColors.white : CtrtColors.textPrimary,
        ),
      ),
    );
  }
}
