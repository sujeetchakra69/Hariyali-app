import 'package:flutter/material.dart';

class CreateVehiclePage extends StatefulWidget {
  const CreateVehiclePage({super.key, required this.onCategoryAdded});
    final Function(Map<String, String>) onCategoryAdded; // Callback type


  @override
  _CreateVehiclePageState createState() => _CreateVehiclePageState();
}

class _CreateVehiclePageState extends State<CreateVehiclePage> {
  // Controllers for text fields
  TextEditingController vehicleNoController = TextEditingController();
  TextEditingController registerNoController = TextEditingController();
  TextEditingController engineNoController = TextEditingController();
  TextEditingController chiyaciNoController = TextEditingController();
  TextEditingController modelNoController = TextEditingController();
  TextEditingController purchaseDateController = TextEditingController();
  TextEditingController givenDateController = TextEditingController();
  TextEditingController blueBookRenewController = TextEditingController();

  // Dropdown values
  String? selectedCompany;
  String? selectedType;
  String? selectedUse;
  String? selectedCategory;

  // List of options for dropdowns
  final List<String> companies = ['Toyota', 'Honda', 'Tesla'];
  final List<String> types = ['SUV', 'Sedan', 'Truck'];
  final List<String> uses = ['Personal', 'Commercial'];
  final List<String> categories = ['Heavy', 'Light', 'Two-Wheeler'];

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
      vehicleNoController.clear();
      
      engineNoController.clear();

      registerNoController.clear();

      chiyaciNoController.clear();

      modelNoController.clear();

      purchaseDateController.clear();

      givenDateController.clear();

      blueBookRenewController.clear();


    });
  }

  void _save() {
    String name = selectedType !;
    String RegNO = registerNoController.text;
    String Modelno = modelNoController.text;
    String vehicleno = vehicleNoController.text;
    // Create a map for the new category
    Map<String, String> newCategory = {
      'name': name,
      'Regno': RegNO,
      'Modelno': Modelno,
      'vehicleno':vehicleno,
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
                'Vehicle Information',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Vehicle Company Dropdown
              DropdownButtonFormField<String>(
                value: selectedCompany,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Company *',
                  border: OutlineInputBorder(),
                ),
                items: companies.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedCompany = newValue;
                  });
                },
              ),
              const SizedBox(height: 10.0),

              // Vehicle Type Dropdown
              DropdownButtonFormField<String>(
                value: selectedType,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Type *',
                  border: OutlineInputBorder(),
                ),
                items: types.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedType = newValue;
                  });
                },
              ),
              const SizedBox(height: 10.0),

              // Vehicle Use Dropdown
              DropdownButtonFormField<String>(
                value: selectedUse,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Use *',
                  border: OutlineInputBorder(),
                ),
                items: uses.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedUse = newValue;
                  });
                },
              ),
              const SizedBox(height: 10.0),

              // Vehicle Category Dropdown
              DropdownButtonFormField<String>(
                value: selectedCategory,
                decoration: const InputDecoration(
                  labelText: 'Vehicle Category *',
                  border: OutlineInputBorder(),
                ),
                items: categories.map((String value) {
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

              // Vehicle No. TextField
              TextField(
                controller: vehicleNoController,
                decoration: const InputDecoration(
                  labelText: 'Vehicle No. *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Register No. TextField
              TextField(
                controller: registerNoController,
                decoration: const InputDecoration(
                  labelText: 'Register No. *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Engine No. TextField
              TextField(
                controller: engineNoController,
                decoration: const InputDecoration(
                  labelText: 'Engine No.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Chiyaci No. TextField
              TextField(
                controller: chiyaciNoController,
                decoration: const InputDecoration(
                  labelText: 'Chiyaci No.',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Model No. TextField
              TextField(
                controller: modelNoController,
                decoration: const InputDecoration(
                  labelText: 'Model No. *',
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
                controller: givenDateController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Given Date',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, givenDateController),
                  ),
                ),
              ),
              const SizedBox(height: 10.0),

              // BlueBook Renewal Date DatePicker
              TextField(
                controller: blueBookRenewController,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'BlueBook Renewal Date',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, blueBookRenewController),
                  ),
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

