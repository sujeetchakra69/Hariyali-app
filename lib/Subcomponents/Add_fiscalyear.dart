import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hariyali_abhiyan/components/CustomappBar.dart';
import 'package:hariyali_abhiyan/components/Customdrawer.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart'; // For formatting the date

class AddFiscalyear extends StatefulWidget {
  const AddFiscalyear({super.key});

  @override
  State<AddFiscalyear> createState() => _AddFiscalyearState();
}

class _AddFiscalyearState extends State<AddFiscalyear> {
  // Controllers for fiscal year and date
  final TextEditingController _fiscalyearEditingController = TextEditingController();
  final TextEditingController _startEditingController = TextEditingController();
  final TextEditingController _endyearEditingController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  // Checkbox state for activation status
  bool isActive = false;

  // Function to show date picker and update the controller
  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd')
            .format(picked); // Format and set the selected date
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding for better layout
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Fiscal Year',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                controller: _fiscalyearEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Enter Fiscal Year',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Start Year',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                controller: _startEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Start Year',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'End Year',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                controller: _endyearEditingController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'End Year',
                  hintStyle: TextStyle(
                    color: Colors.grey[400],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Start Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                controller: _startDateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Select Start Date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, _startDateController),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'End Date',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '*',
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType:
                    TextInputType.number, // Set the keyboard type to number
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly, // Allow only digits
                ],
                controller: _endDateController,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: 'Select End Date',
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () => _selectDate(context, _endDateController),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Text('Status :'),
                  Checkbox(
                    value: isActive,
                    onChanged: (bool? newValue) {
                      setState(() {
                        isActive = newValue ?? false;
                      });
                    },
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Cancel and go back to the previous screen
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Change button color to green
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 15.0),
                  ElevatedButton(
                    onPressed: () {
                      // Prepare data to pass back
                      final data = {
                        'fiscal_year': _fiscalyearEditingController.text,
                        'start_year': _startEditingController.text,
                        'end_year': _endyearEditingController.text,
                        'start_date': _startDateController.text,
                        'end_date': _endDateController.text,
                        'status': isActive ? 'Activated' : 'Deactivated',
                      };

                      // Return data to the previous screen
                      Navigator.pop(context, data);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.green, // Change button color to green
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
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
