import 'package:flutter/material.dart'; 
import 'package:hariyali_abhiyan/components/CustomappBar.dart';
import 'package:hariyali_abhiyan/components/Customdrawer.dart';
import 'package:hariyali_abhiyan/components/charts.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  @override
  Widget build(BuildContext context) {
    // Get the screen width and height
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar:  const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.3, // Adjust height based on screen height
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  buildCounter('Accessories', 59, screenWidth),
                  buildCounter('Vehicles', 56, screenWidth),
                  buildCounter('Seeds', 78, screenWidth),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              height: screenHeight * 0.7, // Adjust chart height based on screen height
              width: screenWidth * 0.95, // Adjust chart width based on screen width
              child: const ChartWidgets(),
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildCounter(String label, int count, double screenWidth) {
  return SizedBox(
    width: screenWidth * 0.3, // Adjust width based on screen width
    height: 120, // Fixed height
    child: Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          // Label at the top inside the container
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.blue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  label,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          // Number at the bottom-right inside the container
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundColor: Colors.grey[100],
                child: Text(
                  count.toString(),
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
