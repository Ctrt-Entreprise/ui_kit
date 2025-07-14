import 'package:core/core.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';
import 'cell_table.dart';

class CtrtTable extends StatelessWidget {
  final List<String> columns;
  final List<String> largeColumns;
  final List<CtrtTableItem> items;
  final Function()? onSelectRow;
  final Function()? onNextPage;
  final Function()? onPrevPage;
  final void Function(dynamic)? onSelect;
  final double? height;
  const CtrtTable({
    super.key,
    this.items = const [],
    this.columns = const [],
    this.largeColumns = const [],
    this.onSelectRow,
    this.onNextPage,
    this.onPrevPage,
    this.onSelect,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Column(
        children: [
          Expanded(
            child: DataTable2(
              columnSpacing: 12.h,
              horizontalMargin: 12.w,
              minWidth: 600.w,
              showCheckboxColumn: false,
              dividerThickness: 0.5.sp,
              dataRowHeight: 60.h,
              onSelectAll: (value) {},
              columns: columns.map((col) => DataColumn2(label: CtrtText.bold(text: col, textSize: 11.5.spMin), size: largeColumns.contains(col) ? ColumnSize.L : ColumnSize.M)).toList(),
              rows: items.map((item) {
                return DataRow(
                  onSelectChanged: (value) {
                    if (onSelect != null) {
                      onSelect!(item.id);
                    }
                  },
                  cells: item.cells.map((cell) => DataCell(getCustomWidget(cell))).toList(),
                );}).toList(),
              empty: EmptyView(
                title: "Aucun résultat",
                message: "Aucun élément à afficher pour le moment",
                icon: Icons.inbox_outlined,
                // onActionPressed: onNextPage,
                actionText: "Actualiser",
              ),
            ),
          ),
          Divider(thickness: 0.5.w, height: 0),
          Container(
            height: 35.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CtrtText.regular(text: "No. 30", textSize: 10.spMin),
                Row(
                  spacing: 5.w,
                  children: [
                    CtrtIconButton(
                      color: CtrtColors.black,
                      isCircle: true,
                      onClick: onPrevPage,
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: CtrtColors.white,
                        size: 12.sp,
                      ),
                    ),
                    CtrtIconButton(
                      color: CtrtColors.black,
                      isCircle: true,
                      onClick: onNextPage,
                      icon: Icon(
                        Icons.arrow_forward_ios,
                        color: CtrtColors.white,
                        size: 12.sp,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
