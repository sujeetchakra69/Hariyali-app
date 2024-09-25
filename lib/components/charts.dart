 import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ChartWidgets extends StatefulWidget {
  const ChartWidgets({super.key});

  @override
  State<ChartWidgets> createState() => _ChartWidgetsState();
}

class _ChartWidgetsState extends State<ChartWidgets> {
  final List<ChartData> chartdata = [
    ChartData(month: 'Jan', data: 13),
    ChartData(month: 'Feb', data: 23),
    ChartData(month: 'Mar', data: 20),
    ChartData(month: 'Apr', data: 8),
    ChartData(month: 'May', data: 13),
    ChartData(month: 'Jun', data: 27),
    ChartData(month: 'Jul', data: 15),
    ChartData(month: 'Aug', data: 20),
    ChartData(month: 'Sep', data: 8),
    ChartData(month: 'Oct', data: 13),
    ChartData(month: 'Nov', data: 27),
    ChartData(month: 'Dec', data: 15),
  ];

  final List<ChartData> vehicledata = [
    ChartData(month: 'Jan', data: 44),
    ChartData(month: 'Feb', data: 55),
    ChartData(month: 'Mar', data: 41),
    ChartData(month: 'Apr', data: 67),
    ChartData(month: 'May', data: 22),
    ChartData(month: 'Jun', data: 43),
    ChartData(month: 'Jul', data: 65),
   
  ];

  final List<ChartData> seeddata = [
    ChartData(month: 'Jan', data: 13),
    ChartData(month: 'Feb', data: 23),
    ChartData(month: 'Mar', data: 20),
    ChartData(month: 'Apr', data: 8),
    ChartData(month: 'May', data: 13),
    ChartData(month: 'Jun', data: 27),
    ChartData(month: 'Jul', data: 15),
    ChartData(month: 'Aug', data: 20),
    ChartData(month: 'Sep', data: 8),
    ChartData(month: 'Oct', data: 13),
    ChartData(month: 'Nov', data: 27),
    ChartData(month: 'Dec', data: 15),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 400.0,
        child: SfCartesianChart(
          
          primaryXAxis: const CategoryAxis(
            title: AxisTitle(text: 'Month'),
          ),
          primaryYAxis: const NumericAxis(
          ),
          legend: const Legend(isVisible: true), // Display legend
          tooltipBehavior: TooltipBehavior(enable: true), // Enable tooltips
          series: <CartesianSeries>[
            // Stacked series for AccessoriesData
            StackedColumnSeries<ChartData, String>(
              xValueMapper: (ChartData accessories, _) => accessories.month,
              yValueMapper: (ChartData accessories, _) => accessories.data,
              dataSource: chartdata,
              color: Colors.green,
              name: 'Accessories',
            ),
            // Stacked series for VehicleData
            StackedColumnSeries<ChartData, String>(
              xValueMapper: (ChartData vehicle, _) => vehicle.month,
              yValueMapper: (ChartData vehicle, _) => vehicle.data,
              dataSource: vehicledata,
              color: Colors.blue,
              name: 'Vehicles',
            ),
            // Stacked series for SeedData
            StackedColumnSeries<ChartData, String>(
              xValueMapper: (ChartData seed, _) => seed.month,
              yValueMapper: (ChartData seed, _) => seed.data,
              dataSource: seeddata,
              color: Colors.red,
              name: 'Seeds',
            ),
          ],
        ),
      ),
    );
  }
}

class ChartData {
  final String month;
  final double data;

  ChartData({
    required this.month,
    required this.data,
  });
}
