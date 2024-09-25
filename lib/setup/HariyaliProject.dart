import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/components/CustomDrawer.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';
import 'package:hariyali_abhiyan/setup_subcomponent/addhariyaliproject.dart';

class HariyaliProject extends StatefulWidget {
  const HariyaliProject({super.key});

  @override
  State<HariyaliProject> createState() => _HariyaliProjectState();
}

class _HariyaliProjectState extends State<HariyaliProject> {
  List <Map <String, String>> categories=[];
 



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
                  'hariyali Project',
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>HariyaliProjectForm(onCategoryAdded: (newCategories){
                      setState(() {
                        categories.add(newCategories);
                      });
                    })));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: const Text('Create Project',style: TextStyle(color: Colors.white, fontSize: 13.0),),
                  
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
                        'Project Name',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        ' Chief Name',
                        style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                    ),
                     DataColumn(
                      label: Text(
                        'Email',
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
                          DataCell(Text('${index + 1}')), // S.N.
                          // Category
                          DataCell(Text('${category['projectname']}')), 
                          DataCell(Text('${category['chiefname']}')), 
                          DataCell(Text('${category['email']}')), 
 

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
                                          .removeAt(index); // Remove the vendor
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }).toList(),              ),
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
