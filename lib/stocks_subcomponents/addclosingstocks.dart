import 'package:flutter/material.dart';

class Addclosingstocks extends StatefulWidget {
  const Addclosingstocks({super.key, required this.onCategoryAdded});
    final Function(Map<String, String>) onCategoryAdded; // Callback type


  @override
  _AddclosingstocksState createState() => _AddclosingstocksState();
}

class _AddclosingstocksState extends State<Addclosingstocks> {
  // Controllers for text fields
  TextEditingController quantityController = TextEditingController();
 
  // Dropdown values
  String? selectedmaterial;
  String? selectedsubcategory;
  String? selectedCategory;
  String? selectedname;


  // List of options for dropdowns
  final List<String> material = ['ada'];
  final List<String> categorytype = ['vategorysss','category'];
  final List<String> subcategories = ['asdasd'];
 
    final List<String> name = ['asdasdasd'];




  void _cancel() {
    setState(() {
      quantityController.clear();
    });
  }

  void _save() {
    String material = selectedmaterial!;
    String categorytype = selectedCategory!;
    String subcategories = selectedsubcategory!;
    String name=selectedname!;
   


    // Create a map for the new category
    Map<String, String> newCategory = {
      'material': material,
      'categories': categorytype,
      'subcategories': subcategories,
      'name': name
    };

    // Pass the new category back to the CategorySetup page
    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add closing Stocks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Closing Stocks',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Vehicle Company Dropdown
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedmaterial,  
                      decoration: const InputDecoration(
                        labelText: 'Type of goods*',
                        border: OutlineInputBorder(),
                      ),
                      items: material.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedmaterial = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  
                  // Vehicle Type Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedCategory,
                      decoration: const InputDecoration(
                        labelText: 'category of goods *',
                        border: OutlineInputBorder(),
                      ),
                      items: categorytype.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedCategory = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  
                  // Vehicle Use Dropdown
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedsubcategory,
                      decoration: const InputDecoration(
                        labelText: 'sub category of goods *',
                        border: OutlineInputBorder(),
                      ),
                      items: subcategories.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedsubcategory = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Vehicle Category Dropdown
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedname,
                      decoration: const InputDecoration(
                        labelText: 'name of goods *',
                        border: OutlineInputBorder(),
                      ),
                      items: name.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedname = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  
                               
                  // Register No. TextField
                  Expanded(
                    child: TextField(
                      controller: quantityController,
                      decoration: const InputDecoration(
                        labelText: 'Quantity *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),

             

              // Buttons
              Row(
              children: [
                GestureDetector(
                  onTap: () {
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
                GestureDetector(
                  onTap: () {
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
            ],
          ),
        ),
      ),
    );
  }
}

