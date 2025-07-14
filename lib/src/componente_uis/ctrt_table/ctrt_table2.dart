import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';
import 'cell_table.dart';
import 'numbered_pagibation.dart';

enum Paginationtype{number, button}


class CtrtTable2 extends StatelessWidget {
  final List<String> columns;
  final List<String> largeColumns;
  final List<CtrtTableItem> items;
  final Function()? onSelectRow;
  final Function()? onNextPage;
  final Function()? onPrevPage;
  final void Function(dynamic)? onSelect;
  final double? tableHeight, headerheight, rowSpacing, rowHeight;
  final bool withfooter;
  final Paginationtype paginationtype;
  const CtrtTable2({
    super.key,
    this.items = const [],
    this.columns = const [],
    this.largeColumns = const [],
    this.onSelectRow,
    this.onNextPage,
    this.onPrevPage,
    this.onSelect,
    this.tableHeight,
    this.headerheight,
    this.rowSpacing,
    this.rowHeight,
    this.withfooter = false,
    this.paginationtype = Paginationtype.number
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: tableHeight ?? 289.h,
      child: Column(
        children: [
          Container(
            height: headerheight ?? 48.h,
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            decoration: BoxDecoration(
              color: CtrtColors.lightGreyProStock,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r)
              )
            ),
            child: Row(
              children: columns.map(
                (col) => Expanded(
                  child: CtrtText.bold(text: col, textSize: 12.spMin),
                ),
              ).toList(),
            ),
          ),
          Expanded(
            child: items.isEmpty ?
            EmptySmalView()
            : ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 10.h),
              itemCount: items.length,
              separatorBuilder:(context, index) => Divider(height: 1.h, thickness: 1, color: CtrtColors.borderProStock),
              itemBuilder: (context, index) {
                var item = items[index];
                return InkWell(
                  onTap: onSelectRow,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                    children: item.cells.map(
                      (cell) => Expanded(
                        child: SizedBox(
                          height: rowHeight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [getCustomWidget(cell)],
                          ),
                        ),
                      ),
                    ).toList(),
                  ),
                  ),
                );
              },
            ),
          ),
          if(withfooter)
            Divider(height: 0.2.h, thickness: 1, color: CtrtColors.lightGrey),
          if(withfooter)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CtrtText.medium(text: 'Lignes par page:'),
                      const SizedBox(width: 8),
                      DropdownButton<int>(
                        underline: Container(),
                        isDense: true,
                        items: [],
                        onChanged: (newValue) {},
                      ),
                    ],
                  ),
                  paginationtype == Paginationtype.number?
                  NumberedPagination(
                    initialPage: 1,
                    totalPages: 100,
                    onPageChanged: (p) {},
                    activeColor: CtrtColors.primaryProStock,
                    inactiveColor: CtrtColors.darkGrey,
                  ): Container(),
                ],
              ),
            ),
          // Divider(height: 0.2, thickness: 1, color: CtrtColors.lightGrey),
        ],
      ),
    );
  }
}


