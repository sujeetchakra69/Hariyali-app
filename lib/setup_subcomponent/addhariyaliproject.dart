import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/dropdown_model.dart';

class HariyaliProjectForm extends StatefulWidget {
  const HariyaliProjectForm({super.key, required this.onCategoryAdded});
  final Function(Map<String, String>) onCategoryAdded; // Callback type

  @override
  _HariyaliProjectFormState createState() => _HariyaliProjectFormState();
}

class _HariyaliProjectFormState extends State<HariyaliProjectForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController projectnamecontroller = TextEditingController();
  final TextEditingController chiefnamecontroller = TextEditingController();
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController numbercontroller = TextEditingController();
  final TextEditingController panvatcontroller = TextEditingController();
  final TextEditingController accountcontroller = TextEditingController();

  String? selectedProvince;

  String? selectedDistrict;
  String? selectedMunicipality;
  String? selectedBank;


  @override
  void dispose(){
    projectnamecontroller.dispose();
    chiefnamecontroller.dispose();
    emailcontroller.dispose();
    numbercontroller.dispose();
    panvatcontroller.dispose();
    accountcontroller.dispose();
    super.dispose();
    
    }

  void _cancel() {
    setState(() {
      projectnamecontroller.clear();
      chiefnamecontroller.clear();
      emailcontroller.clear();
      numbercontroller.clear();
      panvatcontroller.clear();
      selectedProvince = null;
      selectedDistrict = null;
      selectedMunicipality = null;
    });
  }

  void _save() {
    String projectname = projectnamecontroller.text;
    String chiefname = chiefnamecontroller.text;
    String email = emailcontroller.text;

    // Create a map for the new category
    Map<String, String> newCategory = {
      'projectname': projectname,
      'chiefname': chiefname,
      'email': email,
    };

    // Pass the new category back to the CategorySetup page
    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Hariyali Project'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: projectnamecontroller,
                        decoration: const InputDecoration(
                          labelText: 'Project Name *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the project name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: chiefnamecontroller,
                        decoration: const InputDecoration(
                          labelText: 'Project Chief Name *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the chief name';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: emailcontroller,
                        decoration: const InputDecoration(
                          labelText: 'Email *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the email';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: numbercontroller,
                        decoration: const InputDecoration(
                          labelText: 'Contact Number *',
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.phone,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the contact number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: panvatcontroller,
                  decoration: const InputDecoration(
                    labelText: 'PAN/VAT Number',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value){
                    if(value==null ||value.isEmpty){
                      return 'Please enter PAN/VAT';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Ward Number *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the ward number';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Password *',
                          border: OutlineInputBorder(),
                        ),
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a password';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Tole Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'House Number',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Bank Details',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        decoration: const InputDecoration(
                          labelText: 'Bank Name *',
                          border: OutlineInputBorder(),
                        ),
                        items: ['Bank 1', 'Bank 2']
                            .map((bank) => DropdownMenuItem(
                                  value: bank,
                                  child: Text(bank),
                                ))
                            .toList(),
                        onChanged: (value) {},
                        validator: (value) {
                          if (value == null) {
                            return 'Please select a bank';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Account Number *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the account number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form is valid, you can submit
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form submitted')),
                          );
                        }
                        _save();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text('Save'),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _cancel();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text('Cancel'),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        ));
  }
}
