import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';
class AddCategory extends StatefulWidget {
  const AddCategory({super.key, required this.onCategoryAdded}); // Add a callback
  final Function(Map<String, String>) onCategoryAdded; // Callback type

  @override
  State<AddCategory> createState() => _AddCategoryState();
}

class _AddCategoryState extends State<AddCategory> {
  String? _selectedValue;
  final List<String> _dropdownItems = [
    'Expendable Goods',
    'Likely Being Spent',
    'Miscellaneous',
    'Repairable'
  ];

  final TextEditingController _textEditingController = TextEditingController();

  void _cancel() {
    setState(() {
      _selectedValue = null;
      _textEditingController.clear();
    });
  }

  void _save() {
    String categoryName = _textEditingController.text;
    if (_selectedValue != null && categoryName.isNotEmpty) {
      // Create a map for the new category
      Map<String, String> newCategory = {
        'type': _selectedValue!,
        'name': categoryName,
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
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Material Type', style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 10),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedValue,
              hint: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('-- Select --', style: TextStyle(fontSize: 16)),
              ),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedValue = newValue;
                });
              },
              items: _dropdownItems
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
            const SizedBox(height: 20.0),
            const Text('Category Name', style: TextStyle(fontSize: 20.0)),
            const SizedBox(height: 10.0),
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: 'Category Name',
                hintStyle: const TextStyle(color: Colors.grey),
              ),
            ),
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
                    onTap: () => {_cancel(),
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
          
          
            // Row(
            //   children: [
            //     ElevatedButton(
            //       onPressed: _cancel,
            //       style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            //       child: const Text('Cancel', style: TextStyle(color: Colors.white)),
            //     ),
            //     const SizedBox(width: 20.0),
            //     ElevatedButton(
            //       onPressed: _save,
            //       style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            //       child: const Text('Save', style: TextStyle(color: Colors.white)),
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}
