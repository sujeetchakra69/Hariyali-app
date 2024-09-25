import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';

class AddItems extends StatefulWidget {
  const AddItems(
      {super.key, required this.onCategoryAdded}); // Add a callback
  final Function(Map<String, String>) onCategoryAdded; // Callback type

  @override
  State<AddItems> createState() => _AddSubcategoryState();
}

class _AddSubcategoryState extends State<AddItems> {
  String? _selectedValue1;
  String? _selectedValue2;
  String? _selectedValue3;
  String? _selectedValue4;
  final List<String> _MaterialItems = [
    'Expendable Goods',
    'Likely Being Spent',
    'Miscellaneous',
    'Repairable'
  ];
  final List<String> _categoryItems = [
    'Hariyali Seeds	',
    'Hariyali Live Stock',
    'Vehicle',
    'Hariyali Fertilizer'
  ];
  final List<String> _Units = [
    'KG',
    'GM',
    'Piece',
  ];
  final List<String> _SubCategoryItems = [
    'Expendable Goods',
    'Likely Being Spent',
    'Miscellaneous',
    'Repairable'
  ];

  final TextEditingController _textEditingController = TextEditingController();
    final TextEditingController _SpecificationController = TextEditingController();


  void _cancel() {
    setState(() {
      _selectedValue1 = null;
      _selectedValue2 = null;
      _selectedValue3 = null;
      _selectedValue4 = null;

      _textEditingController.clear();
    });
  }

  void _save() {
    String specification= _SpecificationController.text;
    String itemName = _textEditingController.text;
    if (_selectedValue1 != null &&
        itemName.isNotEmpty &&
        _selectedValue2 != null &&
        _selectedValue3 != null &&
        _selectedValue4 != null) {
      // Create a map for the new category
      Map<String, String> newCategory = {
        'type': _selectedValue1!,
        'category': _selectedValue2!,
        'subcategory':_selectedValue3!,
        'unit': _selectedValue4!,
        'name': itemName,
        'specification': specification,
      };

      // Pass the new category back to the CategorySetup page
      widget.onCategoryAdded(newCategory);
      Navigator.pop(context); // Go back to the previous screen
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [//Materail type dropdown
        
              const Row(
                children: [
                  Text('Material Type', style: TextStyle(fontSize: 20.0)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedValue1,
                hint: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-- Select --', style: TextStyle(fontSize: 16)),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue1 = newValue;
                  });
                },
                items:
                    _MaterialItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
        
              //category dropdown
        
              const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Text('Category Type', style: TextStyle(fontSize: 20.0)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedValue2,
                hint: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-- Select --', style: TextStyle(fontSize: 16)),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue2 = newValue;
                  });
                },
                items:
                    _categoryItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
        
        
            //subcategory dropdown
                 const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Text('Sub Category Type', style: TextStyle(fontSize: 20.0)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedValue4,
                hint: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-- Select --', style: TextStyle(fontSize: 16)),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue4 = newValue;
                  });
                },
                items:
                    _SubCategoryItems.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
                  const SizedBox(
                height: 20.0,
              ),
        
              //item Name textfield
        
                const Row(
                children: [
                  Text('Item Name', style: TextStyle(fontSize: 20.0)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
                          const SizedBox(height: 10),
                    
        
                    TextField(
                controller: _textEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Item Name',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
        
        
        
              //item unit dropdown
              
                 const SizedBox(
                height: 20.0,
              ),
              const Row(
                children: [
                  Text('Item Unit Type', style: TextStyle(fontSize: 20.0)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
              const SizedBox(height: 10),
              DropdownButton<String>(
                isExpanded: true,
                value: _selectedValue3,
                hint: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('-- Select --', style: TextStyle(fontSize: 16)),
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedValue3 = newValue;
                  });
                },
                items:
                    _Units.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
        
        
        //specification textfield
        const Row(
                children: [
                  Text('Specification', style: TextStyle(fontSize: 20.0)),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red),
                  )
                ],
              ),
                          const SizedBox(height: 10),
                    
        
                    TextField(
                controller: _SpecificationController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                  hintText: 'Specification',
                  hintStyle: const TextStyle(color: Colors.grey),
                ),
              ),
        
        
        
        
        
        
        
        
        
        
              // const SizedBox(height: 20.0),
              // const Text('Sub-Category Name', style: TextStyle(fontSize: 20.0)),
              // const SizedBox(height: 10.0),
              // TextField(
              //   controller: _textEditingController,
              //   decoration: InputDecoration(
              //     border:
              //         OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              //     hintText: 'Sub-Category Name',
              //     hintStyle: const TextStyle(color: Colors.grey),
              //   ),
              // ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Container(
                    width: MediaQuery.sizeOf(context).width * .3,
                    height: MediaQuery.sizeOf(context).height * .1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.red,
                    ),
                    child: Center(
                        child: GestureDetector(
                      onTap: () => {
                        _cancel(),
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Container(
                    width: MediaQuery.sizeOf(context).width * .3,
                    height: MediaQuery.sizeOf(context).height * .1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.green,
                    ),
                    child: Center(
                        child: GestureDetector(
                      onTap: () => {
                        _save(),
                      },
                      child: const Text(
                        'Save',
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    )),
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
