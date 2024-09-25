import 'package:flutter/material.dart';
import '../dropdown_model.dart'; // Assuming this includes your MunicipalityDropdown

class Addprojectmanager extends StatefulWidget {
  const Addprojectmanager({super.key, required this.onCategoryAdded});
  final Function(Map<String, String>) onCategoryAdded; // Callback type

  @override
  _AddprojectmanagerState createState() => _AddprojectmanagerState();
}

class _AddprojectmanagerState extends State<Addprojectmanager> {
  // Controllers for text fields
  TextEditingController projectnameController = TextEditingController();
  TextEditingController managernamecontroller = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController panvatController = TextEditingController();
  TextEditingController wardController = TextEditingController();
  TextEditingController toleController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Dropdown values
  String? selectedProject;
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedMunicipality;
  String? selectedBank;

  // List of options for dropdowns
  final List<String> projectNames = ['Project A', 'Project B']; // Example projects
  final List<String> banks = ['Bank A', 'Bank B']; // Example banks

  void _cancel() {
    setState(() {
      projectnameController.clear();
      managernamecontroller.clear();
      emailController.clear();
      panvatController.clear();
      accountnumberController.clear();
      wardController.clear();
      toleController.clear();
      houseController.clear();
      selectedProject = null;
      selectedBank = null;
      selectedProvince = null;
      selectedDistrict = null;
      selectedMunicipality = null;
    });
  }

  void _save() {
    // Validate your inputs here before saving
    String projectName = selectedProject ?? '';
    String managerName = managernamecontroller.text;
    String number = numberController.text;

    // Create a map for the new category
    Map<String, String> newCategory = {
      'projectname': projectName,
      'managername': managerName,
      'number': number,
      'municipality': selectedMunicipality ?? '',
      // Add other fields if necessary
    };

    // Pass the new category back to the CategorySetup page
    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business Manager'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Business Manager',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Project Dropdown
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedProject,
                      decoration: const InputDecoration(
                        labelText: 'Project Name*',
                        border: OutlineInputBorder(),
                      ),
                      items: projectNames.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedProject = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  
                  Expanded(
                    child: TextField(
                      controller: managernamecontroller,
                      decoration: const InputDecoration(
                        labelText: 'Manager Name *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              
              // Contact Number and Email
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: numberController,
                      decoration: const InputDecoration(
                        labelText: 'Contact number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // PAN/VAT Number
              TextField(
                controller: panvatController,
                decoration: const InputDecoration(
                  labelText: 'PAN/VAT number *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),

              // Municipality Dropdown
              MunicipalityDropdown(
                selectedProvince: selectedProvince,
                selectedDistrict: selectedDistrict,
                selectedMunicipality: selectedMunicipality,
                onProvinceChanged: (String? newValue) {
                  setState(() {
                    selectedProvince = newValue;
                    // Reset district and municipality when province changes
                    selectedDistrict = null;
                    selectedMunicipality = null;
                  });
                },
                onDistrictChanged: (String? newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                    // Reset municipality when district changes
                    selectedMunicipality = null;
                  });
                },
                onMunicipalityChanged: (String? newValue) {
                  setState(() {
                    selectedMunicipality = newValue;
                  });
                },
              ),

              const SizedBox(height: 16,),
              // Ward and Tole
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: wardController,
                      decoration: const InputDecoration(
                        labelText: 'Ward Number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: toleController,
                      decoration: const InputDecoration(
                        labelText: 'Tole number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // House Number and Password
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: houseController,
                      decoration: const InputDecoration(
                        labelText: 'House number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: passwordController,
                      decoration: const InputDecoration(
                        labelText: 'Password *',
                        border: OutlineInputBorder(),
                      ),
                      obscureText: true,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Bank Section
              const Row(children: [
                Expanded(child: Divider(height: 1)),
                Text('  B a n k  '),
                Expanded(child: Divider(height: 1))
              ]),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedBank,
                      decoration: const InputDecoration(
                        labelText: 'Bank *',
                        border: OutlineInputBorder(),
                      ),
                      items: banks.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedBank = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: accountnumberController,
                      decoration: const InputDecoration(
                        labelText: 'Account Number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                children: [
                  GestureDetector(
                    onTap: _cancel,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      height: MediaQuery.of(context).size.height * .1,
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
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20.0),
                  GestureDetector(
                    onTap: _save,
                    child: Container(
                      width: MediaQuery.of(context).size.width * .3,
                      height: MediaQuery.of(context).size.height * .1,
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
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
