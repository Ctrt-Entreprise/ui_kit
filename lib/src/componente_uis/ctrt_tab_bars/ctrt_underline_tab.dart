import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class CtrtUnderlineTab extends StatefulWidget {
  final List<String> tabs;
  final double width, height;
  final Function(int) handleSelect;
  final bool isExpanded;
  final double? textSize;   
  const CtrtUnderlineTab({
    super.key,
    required this.tabs,
    required this.width,
    required this.height,
    required this.handleSelect,
    this.isExpanded = false,
    this.textSize,
  });

  @override
  State<CtrtUnderlineTab> createState() => _CtrtUnderlineTabState();
}

class _CtrtUnderlineTabState extends State<CtrtUnderlineTab> {
  String select = '';

  @override
  void initState() {
    super.initState();
    select = widget.tabs.first;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: CtrtColors.lightGrey, width: 0.5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 10.w,
        children: [
          for (var i = 0; i < widget.tabs.length; i++)
            (widget.isExpanded) ? Expanded(
                child: InkWell(
                  onTap: () {
                    select = widget.tabs[i];
                    widget.handleSelect(i);
                    setState(() {});
                  },
                  child: ItemTabBar(
                    tab: widget.tabs[i],
                    actif: widget.tabs[i] == select,
                    textSize: widget.textSize,
                  ),
                ),
              )
            : InkWell(
                onTap: () {
                  select = widget.tabs[i];
                  widget.handleSelect(i);
                  setState(() {});
                },
                child: ItemTabBar(
                  tab: widget.tabs[i],
                  actif: widget.tabs[i] == select,
                  textSize: widget.textSize,
                ),
              ),
        ],
      ),
    );
  }
}

class ItemTabBar extends StatelessWidget {
  final String tab;
  final bool actif;
  final double? textSize;
  const ItemTabBar({super.key, required this.tab, required this.actif, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38.h,
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: actif ? CtrtColors.primaryCarange : Colors.transparent,
          ),
        ),
      ),
      child: Center(child: CtrtText.bold(text: tab, textSize: textSize ?? 11.spMin)),
    );
  }
}
