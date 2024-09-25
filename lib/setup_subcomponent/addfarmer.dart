import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/dropdown_model.dart';


class Addfarmer extends StatefulWidget {
  const Addfarmer({Key? key, required this.onCategoryAdded}) : super(key: key);
  final Function(Map<String, String>) onCategoryAdded; // Callback type

  @override
  _AddfarmerState createState() => _AddfarmerState();
}

class _AddfarmerState extends State<Addfarmer> {
  // Controllers for text fields
  TextEditingController projectnameController = TextEditingController();
  TextEditingController namecontroller = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController panvatController = TextEditingController();
  TextEditingController wardController = TextEditingController();
  TextEditingController toleController = TextEditingController();
  TextEditingController houseController = TextEditingController();
  TextEditingController accountnumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  // Dropdown values
  String? selectedproject;
  String? selectedmanager;
  String? selectedProvince;
  String? selectedDistrict;
  String? selectedMunicipality;
  String? selectedbank;
  String? selectedgroup;

  // List of options for dropdowns
  final List<String> projectname = ['ada'];
  final List<String> groupname = ['ada'];

  final List<String> manager = ['ada'];
  final List<String> bank = ['asdasdasd'];

  void _cancel() {
    setState(() {
      namecontroller.clear();
      emailController.clear();
      panvatController.clear();
      accountnumberController.clear();
      wardController.clear();
      toleController.clear();
      houseController.clear();
      selectedproject = null;
      selectedProvince = null;
      selectedDistrict = null;
      selectedMunicipality = null;
      selectedbank = null;
      selectedmanager = null;
      selectedgroup = null;
    });
  }

  void _save() {
    // Validate that dropdowns are selected
    if (selectedproject == null || selectedmanager == null || selectedgroup == null) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Please select all required dropdowns'),
      ));
      return;
    }

    String projectname = selectedproject!;
    String groupname = namecontroller.text;
    String managername = selectedmanager!;
    String email = emailController.text;
    String farmer = namecontroller.text;
    String number = numberController.text;

    // Create a map for the new category
    Map<String, String> newCategory = {
      'projectname': projectname,
      'managername': managername,
      'groupname': groupname,
      'farmer': farmer,
      'email': email,
      'number': number
    };

    // Pass the new category back to the CategorySetup page
    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Farmer'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Farmer',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Dropdowns and TextFields
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedproject,
                      decoration: const InputDecoration(
                        labelText: 'Project Name*',
                        border: OutlineInputBorder(),
                      ),
                      items: projectname.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedproject = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedmanager,
                      decoration: const InputDecoration(
                        labelText: 'Manager Name*',
                        border: OutlineInputBorder(),
                      ),
                      items: manager.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedmanager = newValue;
                        });
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedgroup,
                      decoration: const InputDecoration(
                        labelText: 'Group Name*',
                        border: OutlineInputBorder(),
                      ),
                      items: groupname.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedgroup = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: namecontroller,
                      decoration: const InputDecoration(
                        labelText: 'Farmer Name *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
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
              
              TextField(
                controller: panvatController,
                decoration: const InputDecoration(
                  labelText: 'PAN/VAT number *',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10.0),
              MunicipalityDropdown(
                selectedProvince: selectedProvince,
                selectedDistrict: selectedDistrict,
                selectedMunicipality: selectedMunicipality,
                onProvinceChanged: (String? newValue) {
                  setState(() {
                    selectedProvince = newValue;
                    selectedDistrict = null;
                    selectedMunicipality = null;
                  });
                },
                onDistrictChanged: (String? newValue) {
                  setState(() {
                    selectedDistrict = newValue;
                    selectedMunicipality = null;
                  });
                },
                onMunicipalityChanged: (String? newValue) {
                  setState(() {
                    selectedMunicipality = newValue;
                  });
                },
              ),
              const SizedBox(height: 20.0),

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
              const Row(
                children: [
                  Expanded(child: Divider(height: 1)),
                  Text('  B a n k D e t a i l  '),
                  Expanded(child: Divider(height: 1)),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: DropdownButtonFormField<String>(
                      value: selectedbank,
                      decoration: const InputDecoration(
                        labelText: 'Bank *',
                        border: OutlineInputBorder(),
                      ),
                      items: bank.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (newValue) {
                        setState(() {
                          selectedbank = newValue;
                        });
                      },
                    ),
                  ),
                  const SizedBox(width: 10.0),
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
              const SizedBox(height: 20.0),

              // Buttons
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      _cancel();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .07,
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
                    onTap: () {
                      _save();
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * .2,
                      height: MediaQuery.of(context).size.height * .07,
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
