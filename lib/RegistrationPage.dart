import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/home_page.dart';

// ignore: camel_case_types
class Registration_page extends StatelessWidget {
  const Registration_page({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register here' ),
        backgroundColor:Colors.greenAccent[200]?.withOpacity(1),
        centerTitle: true,
        elevation: 5.0,
      ),
      body: Container(
        color: Colors.greenAccent[200]?.withOpacity(1),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey,
                      radius: 50.0,
                    ),
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.photo_size_select_actual),
                        color: Colors.grey,
                        // Icon used for navigation
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                decoration: InputDecoration(
                   filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter your  Full Name',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter your Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.mail),
                ),
                
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                obscureText: false,
                decoration: InputDecoration(
                   filled: true,
                  fillColor: Colors.white,
                  labelText: 'Enter password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('already have an account?'),
                  ),
                  GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage())),
                      child: const Text(
                        'login',
                        style: TextStyle(fontSize: 16.0, color: Colors.blue),
                      ))
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                width: double.infinity,
                height: 40.0,
                decoration: BoxDecoration(
                    border: Border.all(width: 3.0, color: Colors.grey),
                    color: Colors.orange[400],
                    borderRadius: BorderRadius.circular(7.0)),
                child: const Text(
                  'Sign up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
