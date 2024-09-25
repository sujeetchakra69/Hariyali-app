import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/Subcomponents/Add_fiscalyear.dart';
import 'package:hariyali_abhiyan/components/CustomDrawer.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';

class FiscalSetup extends StatefulWidget {
  const FiscalSetup({super.key});

  @override
  State<FiscalSetup> createState() => _FiscalSetupState();
}

class _FiscalSetupState extends State<FiscalSetup> {
  List<Map<String, String>> categories = []; // Initialize the categories list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
       
      ),
      drawer: const CustomDrawer(), // Use your custom Drawer
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Add some padding for better layout
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Fiscal Year',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AddFiscalyear()),
                    );

                    // Check if result is not null
                    if (result != null) {
                      setState(() {
                        categories.add(result as Map<String,
                            String>); // Add the result to categories
                      });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Add Fiscal Year',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                  ),
                )
              ],
            ),
            const SizedBox(height: 10.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: const Color.fromARGB(255, 211, 211, 211),
                  ),
                ),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('S.N',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ),
                    DataColumn(
                      label: Text('Fiscal Year',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ),
                    DataColumn(
                      label: Text('Status',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ),
                    DataColumn(
                      label: Text('Status',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ),
                    DataColumn(
                      label: Text('Actions',
                          style: TextStyle(fontStyle: FontStyle.italic)),
                    ),
                  ],
                  rows: categories.asMap().entries.map<DataRow>((entry) {
                    int index = entry.key;
                    Map<String, String> category = entry.value;

                    return DataRow(cells: <DataCell>[
                      DataCell(Text('${index + 1}')),
                      DataCell(Text(
                          category['fiscal_year']!)), // Use the correct key
                      DataCell(Text(category[
                          'status']!)), // Ensure 'status' key is correctly defined
                      DataCell(
                        Switch(
                          value: category['status'] == 'Activated',
                          onChanged: (bool newValue) {
                            setState(() {
            if (newValue) {
              // Set all other statuses to Deactivated
              for (var cat in categories) {
                cat['status'] = 'Deactivated';
              }
              category['status'] = 'Activated'; // Activate the current one
            } else {
              category['status'] = 'Deactivated'; // Just deactivate
            }

            //  if (newValue) {
            //   // Set all other statuses to Deactivated
            //   for (var cat in categories) {
            //     cat['status'] = 'Activated';
            //   }
            //   category['status'] = 'Activated'; // Activate the current one
            // } else {
            //   category['status'] = 'Deactivated'; // Just deactivate
            // }

          });
                          },
                        ),
                      ),
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
                                setState(() {
                                  categories
                                      .removeAt(index); // Remove the category
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }).toList(),
                ),
              ),
            ),
            const SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 90.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Previous',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Container(
                  width: 90.0,
                  decoration: BoxDecoration(
                    border: Border.all(width: 0.5),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Next',
                      textAlign: TextAlign.center,
                    ),
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


