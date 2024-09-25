import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/dropdown_model.dart';

class VendorForm extends StatefulWidget {
  const VendorForm({super.key, required this.onCategoryAdded});
  final Function(Map<String, String>) onCategoryAdded;

  @override
  _VendorFormState createState() => _VendorFormState();
}

class _VendorFormState extends State<VendorForm> {
  final _formKey = GlobalKey<FormState>();

  // Controllers for text fields
  final vendorNameController = TextEditingController();
  final contactNumberController = TextEditingController();
  final panVatController = TextEditingController();
  final wardNumberController = TextEditingController();
  final tollNumberController = TextEditingController();
  final houseNumberController = TextEditingController();
  final contactPersonNameController = TextEditingController();
  final contactPersonNumberController = TextEditingController();
  final contactPersonDetailController = TextEditingController();

  String? selectedProvince;
  String? selectedDistrict;
  String? selectedMunicipality;

  @override
  void dispose() {
    vendorNameController.dispose();
    contactNumberController.dispose();
    panVatController.dispose();
    wardNumberController.dispose();
    tollNumberController.dispose();
    houseNumberController.dispose();
    contactPersonNameController.dispose();
    contactPersonNumberController.dispose();
    contactPersonDetailController.dispose();
    super.dispose();

    
      selectedProvince = null;
    selectedDistrict = null;
    selectedMunicipality = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Vendor'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text(
                  'Create Vendor',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),

                // Vendor Information
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: vendorNameController,
                        decoration: const InputDecoration(
                          labelText: 'Vendor Name *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the vendor name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: contactPersonNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Contact Number *',
                          border: OutlineInputBorder(),
                        ),
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
                  controller: panVatController,
                  decoration: const InputDecoration(
                    labelText: 'Pan/Vat *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter PAN/VAT';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),

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
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: wardNumberController,
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
                        controller: tollNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Toll Number *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the toll number';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: houseNumberController,
                  decoration: const InputDecoration(
                    labelText: 'House No. *',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter the house number';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Contact Person Information
                const Text(
                  'Contact Person',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: contactPersonNameController,
                        decoration: const InputDecoration(
                          labelText: 'Name *',
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter the contact person\'s name';
                          }
                          return null;
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: contactPersonNumberController,
                        decoration: const InputDecoration(
                          labelText: 'Contact Number *',
                          border: OutlineInputBorder(),
                        ),
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
                  controller: contactPersonDetailController,
                  decoration: const InputDecoration(
                    labelText: 'Detail *',
                    hintText: 'Eg. Branch Manager',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter details';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Save and Cancel buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form Submitted')),
                          );
                          Map<String, String> newCategory = {
                            'name': vendorNameController.text,
                            'contactno': contactPersonNumberController.text,
                          };
                          widget.onCategoryAdded(newCategory);
                          Navigator.pop(context);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
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
}
