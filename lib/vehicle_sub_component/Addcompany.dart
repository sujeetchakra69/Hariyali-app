import 'package:flutter/material.dart';

class AddCompany extends StatefulWidget {
  const AddCompany({super.key, required this.onCategoryAdded});
      final Function(Map<String, String>) onCategoryAdded; // Callback type


  @override
  State<AddCompany> createState() => _AddCompanyState();
}

class _AddCompanyState extends State<AddCompany> {
  final TextEditingController _textEditingController= TextEditingController();
  
  void _cancel() {
    setState(() {
      

      _textEditingController.clear();
    });
  }

  void _save() {
    String Companyname = _textEditingController.text;
      // Create a map for the new category
      Map<String, String> newCategory = {
        
        'name': Companyname,
      };

      // Pass the new category back to the CategorySetup page
      widget.onCategoryAdded(newCategory);
      Navigator.pop(context); // Go back to the previous screen
    
  }

  
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Add Company',style: TextStyle(fontSize: 20.0),),),

      body:  Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(children: [
          const Text('Company Name *',style: TextStyle(fontSize: 20.0),),
          TextField(
            controller: _textEditingController,
            decoration: InputDecoration(
              hintText: 'Company Name',
              hintStyle: TextStyle(color: Colors.grey[400]),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
                  
              )
            
            ),
          
          ),
          const SizedBox(height: 20.0,),
           Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      _cancel();
                    },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .3,
                      height: MediaQuery.sizeOf(context).height * .1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.red,
                      ),
                      child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(onTap: () {
                    _save();
                  },
                    child: Container(
                      width: MediaQuery.sizeOf(context).width * .3,
                      height: MediaQuery.sizeOf(context).height * .1,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.green,
                      ),
                      child: const Center(
                          child: Text(
                            'Save',
                            style: TextStyle(
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          )),
                    ),
                  ),
                ],
              )
        ],),
      ),
    );
  }
}