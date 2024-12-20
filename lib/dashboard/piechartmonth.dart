import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartSample extends StatelessWidget {
  final double remainingRevenue; // Revenue/profit value
  final double lossAmount; // Loss value

  PieChartSample({
    required this.remainingRevenue,
    required this.lossAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200, // Chart height
      child: PieChart(
        PieChartData(
          sections: _buildChartSections(),
          centerSpaceRadius: 40, // Space in center
          sectionsSpace: 2, // Space between sections
        ),
      ),
    );
  }

  List<PieChartSectionData> _buildChartSections() {
    double total = remainingRevenue + lossAmount;

    // Minimum visible value for small sections
    double minValue = 0.05;
    double adjustedLoss =
        (lossAmount / total) < minValue ? total * minValue : lossAmount;

    double adjustedRevenue = total - adjustedLoss;

    return [
      PieChartSectionData(
        color: Colors.green, // Revenue color
        value: adjustedRevenue,
        title:
            'Revenue\n${((adjustedRevenue / total) * 100).toStringAsFixed(1)}%',
        radius: 60, // Section size
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      PieChartSectionData(
        color: Colors.red, // Loss color
        value: adjustedLoss,
        title: 'Loss\n${((adjustedLoss / total) * 100).toStringAsFixed(1)}%',
        radius: adjustedLoss == total * minValue ? 60 : 60, // Adjust radius
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    ];
  }
}
