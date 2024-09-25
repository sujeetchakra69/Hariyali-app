import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/Subcomponents/Add_category.dart';
import 'package:hariyali_abhiyan/components/CustomDrawer.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';

class CategorySetup extends StatefulWidget {
  const CategorySetup({super.key});

  @override
  _CategorySetupState createState() => _CategorySetupState();
}

class _CategorySetupState extends State<CategorySetup> {
  List<Map<String, String>> categories = []; // Initialize the categories list

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Material Setup',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AddCategory(
                          onCategoryAdded: (newCategory) {
                            setState(() {
                              categories.add(newCategory); // Update the state
                            });
                          },
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: const Text(
                    'Add Material',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(width: 1.0, color: const Color.fromARGB(255, 211, 211, 211)),
                ),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(label: Text('S.N', style: TextStyle(fontStyle: FontStyle.italic))),
                    DataColumn(label: Text('Material Type', style: TextStyle(fontStyle: FontStyle.italic))),
                    DataColumn(label: Text('Material Category', style: TextStyle(fontStyle: FontStyle.italic))),
                    DataColumn(label: Text('Actions', style: TextStyle(fontStyle: FontStyle.italic))),
                  ],
                  rows: categories.asMap().entries.map<DataRow>((entry) {
                    int index = entry.key;
                    Map<String, String> category = entry.value;
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text('${index + 1}')),
                        DataCell(Text(category['type']!)),
                        DataCell(Text(category['name']!)),
                        DataCell(
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.edit),
                                onPressed: () {
                                  // Implement edit functionality if needed
                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete),
                                onPressed: () {
                                  // Implement delete functionality if needed
                                  setState(() {
                                    categories.removeAt(index); // Remove the category
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Previous', textAlign: TextAlign.center),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: screenWidth * 0.25,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text('Next', textAlign: TextAlign.center),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
