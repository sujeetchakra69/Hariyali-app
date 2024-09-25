import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/home_page.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
 
  const  CustomAppBar({  super.key });

  @override
  Widget build(BuildContext context) {
    return AppBar(       
        
        elevation: 5.0,
        toolbarHeight: 70.0,
        actions: [
          Row(
            children: [
                const Text( " Welcome Hariyali", style: TextStyle(fontSize: 20.0),
              ),
              
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm Logout'),
                        content: const Text('Are you sure you want to log out?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()),
                              ); // Navigate to HomePage
                            },
                            child:  const Text('Log Out'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child:  const Text(
                    "Log Out",
                    style:  TextStyle(color: Colors.white),
                  ),
                  
                ),
              ),
            ],
          )
        ],
      );
      
  }
   @override
  Size get preferredSize => const Size.fromHeight(70.0); // Set the height of the AppBar
}
