import 'package:flutter/material.dart';

class Addunit extends StatefulWidget {
  const Addunit({super.key, required this.onCategoryAdded});
  final Function(Map<String, String>) onCategoryAdded; // Callback type

  @override
  State<Addunit> createState() => _AddunitState();
}

class _AddunitState extends State<Addunit> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _symbolEditingController =
      TextEditingController();

  void _cancel() {
    setState(() {
      _nameEditingController.clear();
      _symbolEditingController.clear();
    });
  }

  void _save() {
    String name = _nameEditingController.text;
    String symbol = _symbolEditingController.text;

    // Create a map for the new category
    Map<String, String> newCategory = {
      'name': name,
      'symbol': symbol,
    };

    // Pass the new category back to the CategorySetup page
    widget.onCategoryAdded(newCategory);
    Navigator.pop(context); // Go back to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Add Unit',
          style: TextStyle(fontSize: 20.0),
          
        ),
        elevation: 5,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Name *',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Text(
                    'Symbol *',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ]),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: TextField(
                    controller: _nameEditingController,
                    decoration: InputDecoration(
                        hintText: 'E.g Kilogram',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * .4,
                  child: TextField(
                    controller: _symbolEditingController,
                    decoration: InputDecoration(
                        hintText: 'E.g KG,GM',
                        hintStyle: TextStyle(color: Colors.grey[400]),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20,),
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
    );
  }
}
