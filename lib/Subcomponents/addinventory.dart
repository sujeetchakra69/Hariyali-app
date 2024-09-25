import 'package:flutter/material.dart';

class AddInventory extends StatefulWidget {
  const AddInventory({super.key});

  @override
  _AddInventoryState createState() => _AddInventoryState();
}

class _AddInventoryState extends State<AddInventory> {
  String? selectedProject;
  String? paymentMethod = 'Cash';
  String? selectedType;
  String? selectedCategory;
  String? selectedSubCategory;
  String? selectedItem;
  String? selectedRate;
  double cashAmount = 0.0;
  double creditAmount = 0.0; // For handling credit
  int quantityRemaining = 0;
  int profitPercentage = 0;
  int quantity = 0;
  double totalPrice = 0.0;
  DateTime? selectedDate;
  final _dateController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Inventory'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Project Dropdown
                buildDropdown(
                  "Project",
                  selectedProject,
                  ['Project A', 'Project B', 'Project C'],
                  (value) => setState(() => selectedProject = value),
                ),
                const SizedBox(height: 16.0),

                // Date Picker
                TextFormField(
                  controller: _dateController,
                  decoration: const InputDecoration(
                    labelText: "Date",
                    border: OutlineInputBorder(),
                  ),
                  readOnly: true,
                  onTap: () async {
                    DateTime? date = await showDatePicker(
                      context: context,
                      initialDate: selectedDate ?? DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                    );
                    if (date != null) {
                      setState(() {
                        selectedDate = date;
                        _dateController.text =
                            date.toLocal().toString().split(' ')[0];
                      });
                    }
                  },
                ),
                const SizedBox(height: 16.0),

                // Total Price Field
                buildTextField("Total Price", (value) {
                  totalPrice = double.tryParse(value) ?? 0.0;
                }),
                const SizedBox(height: 16.0),

                // Payment Method
                const Text(
                  "Payment Method",
                  style: TextStyle(fontSize: 20.0),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  decoration: BoxDecoration(border: Border.all(width: 1)),
                  child: Column(
                    children: [
                      buildRadio("Cash", paymentMethod),
                      buildRadio("Credit", paymentMethod),
                      buildRadio("Both ", paymentMethod),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),

                // Cash Amount or Credit Amount Field
                if (paymentMethod == "Cash")
                  buildTextField("Cash Amount", (value) {
                    setState(() {
                      cashAmount = double.tryParse(value) ?? 0.0;
                    });
                  }),
                if (paymentMethod == "Credit")
                  buildTextField("Credit Amount", (value) {
                    setState(() {
                      creditAmount = double.tryParse(value) ?? 0.0;
                    });
                  }),
                if (paymentMethod == "Both")
                  Column(
                    children: [
                      buildTextField("Credit Amount", (value) {
                        setState(() {
                          creditAmount = double.tryParse(value) ?? 0.0;
                        });
                      }),
                      buildTextField("Cash Amount", (value) {
                        setState(() {
                          cashAmount = double.tryParse(value) ?? 0.0;
                        });
                      }),
                    ],
                  ),
                const SizedBox(height: 16.0),

                // Type, Category, Sub Category, Item, Rate dropdowns
                buildDropdown(
                  "Type",
                  selectedType,
                  ['Type A', 'Type B', 'Type C'],
                  (value) => setState(() => selectedType = value),
                ),
                const SizedBox(height: 16.0),

                buildDropdown(
                  "Category",
                  selectedCategory,
                  ['Category A', 'Category B'],
                  (value) => setState(() => selectedCategory = value),
                ),
                const SizedBox(height: 16.0),

                buildDropdown(
                  "Sub Category",
                  selectedSubCategory,
                  ['Sub A', 'Sub B'],
                  (value) => setState(() => selectedSubCategory = value),
                ),
                const SizedBox(height: 16.0),

                buildDropdown(
                  "Item",
                  selectedItem,
                  ['Item 1', 'Item 2'],
                  (value) => setState(() => selectedItem = value),
                ),
                const SizedBox(height: 16.0),

                buildDropdown(
                  "Rate",
                  selectedRate,
                  ['Rate 1', 'Rate 2'],
                  (value) => setState(() => selectedRate = value),
                ),
                const SizedBox(height: 16.0),

                // Quantity Remaining, Profit, Quantity, Final Price
                buildTextField("Quantity Remaining", (value) {
                  quantityRemaining = int.tryParse(value) ?? 0;
                }),
                const SizedBox(height: 16.0),
                buildTextField("Profit %", (value) {
                  profitPercentage = int.tryParse(value) ?? 0;
                }),
                const SizedBox(height: 16.0),
                buildTextField("Quantity", (value) {
                  quantity = int.tryParse(value) ?? 0;
                }),
                const SizedBox(height: 16.0),
                buildTextField("Final Price", (value) {
                  totalPrice = double.tryParse(value) ?? 0.0;
                }),
                const SizedBox(height: 16.0),

                // Submit and Back buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                        }
                      },
                      child: const Text("Submit"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Back"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Dropdown builder with callback for updating selected value
  Widget buildDropdown(String label, String? selectedValue,
      List<String> options, Function(String?) onChanged) {
    return DropdownButtonFormField<String>(
      value: selectedValue,
      onChanged: onChanged,
      items: options.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }

  // Text Field builder with basic validation
  Widget buildTextField(String label, Function(String) onChanged) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
      keyboardType: TextInputType.number,
      onChanged: onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter $label';
        }
        return null;
      },
    );
  }

  // Radio button builder
  Widget buildRadio(String title, String? groupValue) {
    return RadioListTile<String>(
      title: Text(title),
      value: title,
      groupValue: groupValue,
      onChanged: (String? value) {
        setState(() {
          paymentMethod = value;
        });
      },
    );
  }
}
