import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentDistributionChart extends StatelessWidget {
  final String title;
  final List<PaymentCategory> categories;
  final double centerSpaceRadius;
  final double sectionRadius;
  final bool showLegend;
  final double? height;
  final double? width;
  final double? spacing;
  const PaymentDistributionChart({
    super.key,
    this.title = 'Répartition des paiements',
    required this.categories,
    this.centerSpaceRadius = 40,
    this.sectionRadius = 50,
    this.showLegend = true,
    this.height,
    this.width,
    this.spacing,
      });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              spacing: spacing ?? 20,
              children: [
                Expanded(
                  flex: showLegend ? 2 : 1,
                  child: PieChart(
                    PieChartData(
                      sectionsSpace: 0,
                      centerSpaceRadius: centerSpaceRadius,
                      sections: _generateSections(),
                      pieTouchData: PieTouchData(
                        touchCallback: (FlTouchEvent event, pieTouchResponse) {},
                      ),
                    ),
                  ),
                ),
                if (showLegend) Expanded(flex: 1, child: _buildLegend()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _generateSections() {
    return categories.map((category) {
      return PieChartSectionData(
        value: category.value,
        color: category.color,
        radius: sectionRadius,
        showTitle: false,
      );
    }).toList();
  }

  Widget _buildLegend() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children:
          categories.map((category) {
            return SizedBox(
              height: 70.h,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: 4.w, height: 40.h, color: category.color),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category.label,
                          style: TextStyle(
                            color: Color(0xFF6E7191),
                            fontSize: 12.spMin,
                          ),
                        ),
                        Text(
                          CtrtFormater.formatAmount(category.amount),
                          style: TextStyle(
                            fontSize: 15.spMin,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF14142B),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
    );
  }
}

class PaymentCategory {
  final String label;
  final double value;
  final int amount;
  final Color color;

  PaymentCategory({
    required this.label,
    required this.value,
    required this.amount,
    required this.color,
  });
}
