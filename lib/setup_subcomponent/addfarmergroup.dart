import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/dropdown_model.dart';

class Addfarmergroup extends StatefulWidget {
  const Addfarmergroup({super.key, required this.onCategoryAdded});
  final Function(Map<String, String>) onCategoryAdded;

  @override
  _AddfarmergroupState createState() => _AddfarmergroupState();
}

class _AddfarmergroupState extends State<Addfarmergroup> {
  // Controllers for text fields
  TextEditingController projectnameController = TextEditingController();
  TextEditingController groupnamecontroller = TextEditingController();
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
  String? selectedMunicipality;
  String? selectedDistrict;
  String? selectedProvince;
  String? selectedbank;

  // List of options for dropdowns
  final List<String> projectname = ['ada'];
  final List<String> manager = ['ada'];
  final List<String> bank = ['asdasdasd'];

  void _cancel() {
    setState(() {
      projectnameController.clear();
      groupnamecontroller.clear();
      numberController.clear();
      emailController.clear();
      panvatController.clear();
      accountnumberController.clear();
      wardController.clear();
      toleController.clear();
      houseController.clear();
      selectedproject = null;
      selectedDistrict = null;
      selectedMunicipality = null;
      selectedProvince = null;
      selectedbank = null;
      selectedmanager = null;
    });
  }

  void _save() {
    if (selectedproject == null || selectedmanager == null || groupnamecontroller.text.isEmpty || emailController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
      return;
    }

    String projectname = selectedproject!;
    String groupname = groupnamecontroller.text;
    String managername = selectedmanager!;
    String email = emailController.text;

    // Create a map for the new category
    Map<String, String> newCategory = {
      'projectname': projectname,
      'managername': managername,
      'groupname': groupname,
      'email': email,
    };

    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Farmer Group'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Farmer Group',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20.0),

              // Project and Manager Dropdown
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

              // Group Name and Contact Number
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: groupnamecontroller,
                      decoration: const InputDecoration(
                        labelText: 'Group Name *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: numberController,
                      decoration: const InputDecoration(
                        labelText: 'Contact number *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Email and PAN/VAT
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: panvatController,
                      decoration: const InputDecoration(
                        labelText: 'PAN/VAT number *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
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
              const SizedBox(height: 20),

              // Ward, Tole, House Number
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: wardController,
                      decoration: const InputDecoration(
                        labelText: 'Ward Number *',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: toleController,
                      decoration: const InputDecoration(
                        labelText: 'Tole number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10.0),
                  Expanded(
                    child: TextField(
                      controller: houseController,
                      decoration: const InputDecoration(
                        labelText: 'House number *',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),

              // Password
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  labelText: 'Password *',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 10.0),

              // Bank and Account Number
              const Row(crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text('-  -  -  -  -  -  -  -  -  - B a n k -  -  -  -  -  -  -  -  -  -', style: TextStyle(fontSize: 18),),
                   
                ],
              ),
              const SizedBox(height: 20,),
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

              // Save and Cancel Buttons
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
