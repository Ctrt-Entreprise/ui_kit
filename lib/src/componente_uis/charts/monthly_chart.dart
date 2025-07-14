import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class MonthlyChart extends StatelessWidget {
  final Widget? header;
  List<int>? monthlySalesData;
  final double maxY;
  final List<String> months;
  final Color lineColor;
  final Color gradientColor;

  MonthlyChart({
    super.key,
    this.header,
    this.monthlySalesData,
    this.maxY = 600,
    this.months = const [
      'Jan',
      'Fev',
      'Mar',
      'Avr',
      'Mai',
      'Jui',
      'Jul',
      'Aoû',
      'Sep',
      'Oct',
      'Nov',
      'Déc',
    ],
    this.lineColor = CtrtColors.primaryProStock,
    this.gradientColor = CtrtColors.primaryProStockTransparent,
  });

  @override
  Widget build(BuildContext context) {
    // Corrigé ici - s'assurer que les données correspondent aux 12 mois
    monthlySalesData ??= List.filled(12, 0);
    
    // Assurer que les données ont la bonne longueur
    if (monthlySalesData!.length > 12) {
      monthlySalesData = monthlySalesData!.sublist(0, 12);
    } else if (monthlySalesData!.length < 12) {
      monthlySalesData = [
        ...monthlySalesData!,
        ...List.filled(12 - monthlySalesData!.length, 0)
      ];
    }
    
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header ?? const SizedBox(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 0.w, top: 0.h),
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: FlTitlesData(
                    rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1, // Ajout de l'interval pour éviter la répétition
                        getTitlesWidget: (value, meta) {
                          final index = value.toInt();
                          if (index >= 0 && index < months.length) {
                            return Padding(
                              padding: EdgeInsets.only(top: 8.h),
                              child: CtrtText.regular(
                                text: months[index],
                                textColor: CtrtColors.textSecondaryProStock,
                                textSize: 12.spMin,
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                        reservedSize: 30.w,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 60.w, // Augmenté pour plus d'espace
                        getTitlesWidget: (value, meta) {
                          if (value % 100 == 0 && value > 0) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 4.0),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: CtrtText.regular(
                                  text: '${value.toInt()}',
                                  textColor: CtrtColors.textSecondaryProStock,
                                  textSize: 11.spMin, // Légèrement réduit
                                ),
                              ),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: 11, // Fixé à 11 pour les 12 mois (indices 0-11)
                  minY: 0,
                  maxY: maxY,
                  lineBarsData: [
                    LineChartBarData(
                      spots: List.generate(
                        12, // Fixé à 12 mois
                        (i) => FlSpot(
                          i.toDouble(),
                          i < monthlySalesData!.length 
                              ? monthlySalesData![i].toDouble() 
                              : 0.0,
                        ),
                      ),
                      isCurved: true,
                      color: lineColor,
                      barWidth: 3.w,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: gradientColor.withValues(alpha: 0.3),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: 8.r,
                      tooltipBorder: BorderSide(
                        color: Colors.grey,
                        width: 0.5.w,
                      ),
                      getTooltipItems: (List<LineBarSpot> spots) {
                        return spots.map((spot) {
                          return LineTooltipItem(
                            '${spot.y.toInt()} FCFA',
                            const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}