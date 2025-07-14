import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_kit/ui_kit.dart';

class PopularProductsChart extends StatelessWidget {
  final String title;
  final List<ProductData> products;
  final bool showActionButtons;
  final VoidCallback? onPeriodPressed;
  final VoidCallback? onFilterPressed;

  const PopularProductsChart({
    super.key,
    this.title = 'Produits populaires',
    required this.products,
    this.showActionButtons = true,
    this.onPeriodPressed,
    this.onFilterPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _buildBarChart(),
          ),
        ],
      ),
    );
  }

  Widget _buildBarChart() {
    // Trouver la valeur maximale pour l'échelle
    final maxValue = products.isNotEmpty
        ? products.map((p) => p.value).reduce((a, b) => a > b ? a : b)
        : 0.0;

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: maxValue * 1.2, // Ajouter un peu d'espace au-dessus
        minY: 0,
        gridData: const FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          show: true,
          leftTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          topTitles: const AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              showTitles: true,
              getTitlesWidget: (value, meta) {
                if (value.toInt() < 0 || value.toInt() >= products.length) {
                  return const SizedBox();
                }
                return Padding(
                  padding: EdgeInsets.only(top: 8.0.h),
                  child: CtrtText.medium(
                    text: products[value.toInt()].name,
                    textSize: 12.spMin
                  )
                );
              },
            ),
          ),
        ),
        barGroups: List.generate(
          products.length,
          (index) => BarChartGroupData(
            x: index,
            barRods: [
              BarChartRodData(
                toY: products[index].value,
                color: _getBarColor(index),
                width: 20,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(4),
                  topRight: Radius.circular(4),
                ),
              ),
            ],
          ),
        ),
        barTouchData: BarTouchData(
          touchTooltipData: BarTouchTooltipData(
            // tooltipBgColor: Colors.white,
            tooltipBorder: BorderSide(
              color: Colors.grey.shade300,
            ),
            tooltipRoundedRadius: 8,
            getTooltipItem: (group, groupIndex, rod, rodIndex) {
              return BarTooltipItem(
                '${products[groupIndex].value.toInt()} FCFA\n',
                const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'hausse de ${products[groupIndex].changePercentage}%',
                    style: TextStyle(
                      color: products[groupIndex].changePercentage >= 0
                          ? Colors.green
                          : Colors.red,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Color _getBarColor(int index) {
    // Premier tiers en vert clair
    if (index < products.length ~/ 3) {
      return const Color(0xFFB5EAD7); // Vert clair
    }
    // Deuxième tiers en orange clair
    else if (index < 2 * (products.length ~/ 3)) {
      return const Color(0xFFFFDCB8); // Orange clair
    }
    // Dernier tiers en rouge clair
    else {
      return const Color(0xFFFFB7B2); // Rouge clair
    }
  }
}

class ProductData {
  final String name;
  final double value;
  final double changePercentage;

  ProductData({
    required this.name,
    required this.value,
    this.changePercentage = 0,
  });
}

// Exemple d'utilisation:
// PopularProductsChart(
//   products: [
//     ProductData(name: 'AirPods', value: 200, changePercentage: 15),
//     ProductData(name: 'iPhone', value: 180, changePercentage: 10),
//     ProductData(name: 'MacBook', value: 150, changePercentage: 5),
//     ProductData(name: 'Chargeur', value: 100, changePercentage: 0),
//     ProductData(name: 'Watch', value: 90, changePercentage: -2),
//     ProductData(name: 'TV', value: 70, changePercentage: -5),
//     ProductData(name: 'HP', value: 60, changePercentage: -10),
//     ProductData(name: 'Samsung', value: 50, changePercentage: -12),
//     ProductData(name: 'Lenovo', value: 40, changePercentage: -15),
//     ProductData(name: 'Dell', value: 20, changePercentage: -20),
//   ],
// )