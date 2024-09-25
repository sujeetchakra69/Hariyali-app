import 'package:flutter/material.dart';

class Addopeningstocks extends StatefulWidget {
  const Addopeningstocks({super.key, required this.onCategoryAdded});
    final Function(Map<String, String>) onCategoryAdded; // Callback type


  @override
  _AddopeningstocksState createState() => _AddopeningstocksState();
}

class _AddopeningstocksState extends State<Addopeningstocks> {
  // Controllers for text fields
  TextEditingController totalpriceController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController quantityController = TextEditingController();
  TextEditingController rateController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController remarksController = TextEditingController();

  // Dropdown values
  String? selectedmaterial;
  String? selectedsubcategory;
  String? item;
  String? selectedCategory;
    String? selectedvendor;


  // List of options for dropdowns
  final List<String> material = ['ada'];
  final List<String> categorytype = ['vategorysss','category'];
  final List<String> subcategories = ['asdasd'];
  final List<String> items = ['asdasd'];
    final List<String> vendor = ['asdasdasd'];


  // Date pickers
  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = picked.toLocal().toString().split(' ')[0]; // Format date to YYYY-MM-DD
      });
    }
  }


  void _cancel() {
    setState(() {
      totalpriceController.clear();
      
      priceController.clear();

      quantityController.clear();

      rateController.clear();

      purchaseDateController.clear();

      expiryDateController.clear();

      remarksController.clear();



    });
  }

  void _save() {
    String material = selectedmaterial!;
    String categorytype = selectedCategory!;
    String subcategories = selectedsubcategory!;
    String items = item!;


    // Create a map for the new category
    Map<String, String> newCategory = {
      'name': material,
      'categories': categorytype,
      'subcategories': subcategories,
      'items':items,
    };

    // Pass the new category back to the CategorySetup page
    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Vehicle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Opening Stocks',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Vehicle Company Dropdown
              DropdownButtonFormField<String>(
                value: selectedmaterial,  
                decoration: const InputDecoration(
                  labelText: 'Type of material*',
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
              const SizedBox(height: 10.0),

              // Vehicle Type Dropdown
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'category of material *',
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
              const SizedBox(height: 10.0),

              // Vehicle Use Dropdown
              DropdownButtonFormField<String>(
                value: selectedsubcategory,
                decoration: const InputDecoration(
                  labelText: 'sub category *',
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
              const SizedBox(height: 10.0),

              // Vehicle Category Dropdown
              DropdownButtonFormField<String>(
                value: item,
                decoration: const InputDecoration(
                  labelText: 'Items *',
                  border: OutlineInputBorder(),
                ),
                items: items.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    item = newValue;
                  });
                },
              ),
              const SizedBox(height: 10.0),

              // Vehicle No. TextField
              TextField(
                controller: rateController,
                decoration: const InputDecoration(
                  labelText: 'Rate *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Register No. TextField
              TextField(
                controller: quantityController,
                decoration: const InputDecoration(
                  labelText: 'Quantity *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Engine No. TextField
              TextField(
                controller: priceController,
                decoration: const InputDecoration(
                  labelText: 'Price.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Chiyaci No. TextField
              TextField(
                controller: totalpriceController,
                decoration: const InputDecoration(
                  labelText: 'Total Price',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

             

              // Purchase Date DatePicker
              TextField(
                controller: purchaseDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Purchase Date *',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, purchaseDateController),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // Given Date DatePicker
              TextField(
                controller: expiryDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Given Date',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, expiryDateController),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // BlueBook Renewal Date DatePicker
              TextField(
                controller: remarksController,
                
                decoration: const InputDecoration(
                  labelText: 'Remarks',
                  border:  OutlineInputBorder(),
                 
                ),
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

