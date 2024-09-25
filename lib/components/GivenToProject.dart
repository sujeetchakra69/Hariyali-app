import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/Subcomponents/addinventory.dart';
import 'package:hariyali_abhiyan/components/CustomDrawer.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';

class Giventoproject extends StatelessWidget {
  const Giventoproject ({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  const CustomAppBar(),
      drawer: const CustomDrawer(), // Use your custom Drawer
      body: Padding(
        padding:
            const EdgeInsets.all(16.0), // Add some padding for better layout
        child: Column(
          children: [
            Row(
              children: [
                const Text(
                  'Given To Project',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddInventory()));},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text(
                    'Add Inventory',
                    style: TextStyle(color: Colors.white, fontSize: 13.0),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, // Make DataTable scrollable horizontally
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                  width: 1.0,
                  color: const Color.fromARGB(255, 211, 211, 211),
                )),
                child: DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'S.N',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Company',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' Project',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' No. of Item',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' Payment Status',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' Due Amount',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' Toal Price',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' Actions',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('1')),
                        const DataCell(Text('Expendable Goods')),
                        const DataCell(Text('Haariyali Seeds')),
                        const DataCell(Text('Matar')),
                        const DataCell(Text('Dried Green Pea')),
                        const DataCell(Text('100')),
                                                const DataCell(Text('100')),

                        DataCell(ElevatedButton(
                            onPressed: () {}, child: const Text('View Item'))),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('2')),
                        const DataCell(Text('Expendable Goods')),
                        const DataCell(Text('Hariyali Seeds')),
                        const DataCell(Text('Matar')),
                        const DataCell(Text('Dried White Pea')),
                        const DataCell(Text('90')),
                        const DataCell(Text('100')),

                        DataCell(ElevatedButton(
                            onPressed: () {}, child: const Text('View Item'))),
                      ],
                    ),

                    DataRow(
                      cells: <DataCell>[
                        const DataCell(Text('4')),
                        const DataCell(Text('Expendable Goods')),
                        const DataCell(Text('Hariyali Seeds')),
                        const DataCell(Text('Channa')),
                        const DataCell(Text('Brown Channa')),
                        const DataCell(Text('5')),
                        const DataCell(Text('100')),

                        DataCell(ElevatedButton(
                            onPressed: () {}, child: const Text('View Item'))),
                      ],
                    ),
                    // Add more rows as needed
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 90.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Previous',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Container(
                  width: 90.0,
                  decoration: BoxDecoration(
                      border: Border.all(width: 0.5),
                      borderRadius: BorderRadius.circular(8.0)),
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
