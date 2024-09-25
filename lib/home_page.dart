import 'package:flutter/material.dart';
import 'package:hariyali_abhiyan/RegistrationPage.dart';
import 'package:hariyali_abhiyan/components/dashboard.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Use constraints to adjust the layout
          double maxWidth = constraints.maxWidth;
          double maxHeight = constraints.maxHeight;

          return Container(
            color: Colors.greenAccent[200]?.withOpacity(1),
            height: maxHeight,
            width: maxWidth,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: maxWidth * 0.01), // Responsive padding
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'images/logo.png',
                        height: maxHeight * 0.3, // Responsive height
                        width: maxWidth * 0.6, // Responsive width
                      ),
                      const SizedBox(height: 20.0),
                      const Text(
                        'Hariyali Abhiyan Inventory System',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                      Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Email',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  TextFormField(
                                    controller: _emailController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                      hintText: 'Enter your Email',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email';
                                      }
                                      // Add further email validation if necessary
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    'Password',
                                    style: TextStyle(fontSize: 20.0),
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: Colors.white,
                                      border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        borderSide: const BorderSide(
                                          color: Colors.blue,
                                          width: 2.0,
                                        ),
                                      ),
                                      hintText: 'Enter your Password',
                                      hintStyle: const TextStyle(
                                          color: Colors.grey, fontSize: 15.0),
                                    ),
                                    obscureText: true,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 20.0),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                const Text("Don't have account."),
                                const SizedBox(width: 5.0,),
                                GestureDetector(
                                    onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const Registration_page())),
                                    child: const Text("Register Now", style: TextStyle(fontSize: 15.0,color: Colors.blue),)),
                              ],
                            ),
                            const SizedBox(height: 40.0,),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const DashBoard()),
                                  );
                                },
                                
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green[600],
                                  padding: const EdgeInsets.all(16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                
                                child: const Text(
                                  'Login',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
