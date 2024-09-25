import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/Subcomponents/Add_subcategory.dart';
import 'package:hariyali_abhiyan/components/CustomDrawer.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';

class SubCategorySetup extends StatefulWidget {
  const SubCategorySetup({super.key});
  

  @override
  State<SubCategorySetup> createState() => _SubCategorySetupState();
}

class _SubCategorySetupState extends State<SubCategorySetup> {
  List<Map<String, String>> categories = []; 
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
                  'Sub Category Setup',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>AddSubcategory(onCategoryAdded:(newCategory) {
                            setState(() {
                              categories.add(newCategory); // Update the state
                            });
                          }, )));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Add Sub Category',style: TextStyle(color: Colors.white, fontSize: 13.0),),
                  
                )
              ],
            ),
            const SizedBox(height: 10.0,),
            SingleChildScrollView(
              scrollDirection:
                  Axis.horizontal, // Make DataTable scrollable horizontally
              child: Container(decoration: BoxDecoration(border: Border.all(
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
                        'Material Category',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Material Sub Category',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Actions',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                  ],

                  rows: categories.asMap().entries.map<DataRow>((entry) {
                    int index = entry.key;
                    Map<String, String> category = entry.value;
                    return DataRow(
                      cells: <DataCell>[
                        DataCell(Text('${index + 1}')),
                        // DataCell(Text(category['type']!)),
                        DataCell(Text(category['category']!)),
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
                  // rows: <DataRow>[
                  //   DataRow(
                  //     cells: <DataCell>[
                  //       const DataCell(Text('1')),
                  //       const DataCell(Text('Hariyali Seeds')),
                  //       const DataCell(Text('Matar')),
                  //       DataCell(Row(
                  //         children: [
                  //           IconButton(
                  //             icon: const Icon(Icons.edit),
                  //             onPressed: () {},
                  //           ),
                  //           IconButton(
                  //             icon: const Icon(Icons.delete),
                  //             onPressed: () {},
                  //           ),
                  //         ],
                  //       )),
                  //     ],
                  //   ),
                  //   DataRow(
                  //     cells: <DataCell>[
                  //       const DataCell(Text('2')),
                  //       const DataCell(Text('Hariyali Seeds')),
                  //       const DataCell(Text('Channa')),
                  //       DataCell(Row(
                  //         children: [
                  //           IconButton(
                  //             icon: const Icon(Icons.edit),
                  //             onPressed: () {
                  //               // Implement edit functionality
                  //             },
                  //           ),
                  //           IconButton(
                  //             icon: const Icon(Icons.delete),
                  //             onPressed: () {
                  //               // Implement delete functionality
                  //             },
                  //           ),
                  //         ],
                  //       )),
                  //     ],
                  //   ),

                  //   DataRow(
                  //     cells: <DataCell>[
                  //       const DataCell(Text('3')),
                  //       const DataCell(Text('Hariyali Live Stock')),
                  //       const DataCell(Text('Cow')),
                  //       DataCell(Row(
                  //         children: [
                  //           IconButton(
                  //             icon: const Icon(Icons.edit),
                  //             onPressed: () {
                  //               // Implement edit functionality
                  //             },
                  //           ),
                  //           IconButton(
                  //             icon: const Icon(Icons.delete),
                  //             onPressed: () {
                  //               // Implement delete functionality
                  //             },
                  //           ),
                  //         ],
                  //       )),
                  //     ],
                  //   ),
                  //   DataRow(
                  //     cells: <DataCell>[
                  //       const DataCell(Text('4')),
                  //       const DataCell(Text('Hariyali Live Stocks')),
                  //       const DataCell(Text('Goat')),
                  //       DataCell(Row(
                  //         children: [
                  //           IconButton(
                  //             icon: const Icon(Icons.edit),
                  //             onPressed: () {
                  //               // Implement edit functionality
                  //             },
                  //           ),
                  //           IconButton(
                  //             icon: const Icon(Icons.delete),
                  //             onPressed: () {
                  //               // Implement delete functionality
                  //             },
                  //           ),
                  //         ],
                  //       )),
                  //     ],
                  //   ),
                  //   // Add more rows as needed
                  // ],
                ),
              ),
            ),
            const SizedBox(height: 20.0,),
            Row( mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(width: 90.0,
              decoration: BoxDecoration(border:Border.all(width: 0.5),
              borderRadius: BorderRadius.circular(8.0)),
              child: const Padding(
                padding:  EdgeInsets.all(15.0),
                child:  Text('Previous',textAlign: TextAlign.center,),
                
              ),),
              const SizedBox(width: 10.0,),
                
                Container(width: 90.0,
                  decoration: BoxDecoration(border:Border.all(width: 0.5),
                  borderRadius: BorderRadius.circular(8.0)),
                  child: const Padding(
                    padding:  EdgeInsets.all(15.0),
                    child:  Text('Next',textAlign: TextAlign.center,),
                    
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
