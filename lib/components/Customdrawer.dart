import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hariyali_abhiyan/Vehicle_components/CompanySetup.dart';
import 'package:hariyali_abhiyan/Vehicle_components/Vehicle.dart';
import 'package:hariyali_abhiyan/Vehicle_components/VehicleCategory.dart';
import 'package:hariyali_abhiyan/Vehicle_components/VehicleTypeSetup.dart';
import 'package:hariyali_abhiyan/Vehicle_components/VehicleUseSetup.dart';
import 'package:hariyali_abhiyan/MainSetup/BankSetup.dart';
import 'package:hariyali_abhiyan/MainSetup/CategorySetup.dart';
import 'package:hariyali_abhiyan/MainSetup/FiscalSetup.dart';
import 'package:hariyali_abhiyan/MainSetup/Items.dart';
import 'package:hariyali_abhiyan/MainSetup/SubCategorySetup.dart';
import 'package:hariyali_abhiyan/MainSetup/UnitSetup.dart';
import 'package:hariyali_abhiyan/MainSetup/Vendor_setup.dart';
import 'package:hariyali_abhiyan/components/GivenToProject.dart';
import 'package:hariyali_abhiyan/components/IncomingRequest.dart';
import 'package:hariyali_abhiyan/components/dashboard.dart';
import 'package:hariyali_abhiyan/home_page.dart';
import 'package:hariyali_abhiyan/setup/BusinessManager.dart';
import 'package:hariyali_abhiyan/setup/Farmergroup.dart';
import 'package:hariyali_abhiyan/setup/Farmers.dart';
import 'package:hariyali_abhiyan/setup/HariyaliProject.dart';
import 'package:hariyali_abhiyan/stocks/ClosingStocks.dart';
import 'package:hariyali_abhiyan/stocks/OpeningStocks.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const DrawerHeader(
              curve: Curves.fastLinearToSlowEaseIn,
              child: Image(image: AssetImage('images/logo.png')),
            ),
            ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Dashboard'),
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DashBoard()));
                }),
            ExpansionTile(
              title: const ListTile(
                leading: Icon(Icons.settings),
                title: Text('Main Setup'),

              ),
              children: [
                ListTile(
                  title: const Text('Category Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CategorySetup(
                                
                              ))),
                ),
                ListTile(
                  title: const Text('Sub-Category Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SubCategorySetup())),
                ),
                ListTile(
                  title: const Text('Item Setup'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Items())),
                ),
                ListTile(
                  title: const Text('Vendor Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VendorSetup())),
                ),
                ListTile(
                  title: const Text('Bank Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BankSetup())),
                ),
                ListTile(
                  title: const Text('Unit Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const UnitSetup())),
                ),
                ListTile(
                  title: const Text('Fiscal Year'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FiscalSetup())),
                ),
              ],
            ),
            ExpansionTile(
              title: const ListTile(
                leading: Icon(Icons.fire_truck),
                title: Text('Vehicle'),
              ),
              children: [
                ListTile(
                  title: const Text('Company Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CompanySetup())),
                ),
                ListTile(
                  title: const Text('Vehicle Type Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicleTypeSetup())),
                ),
                ListTile(
                  title: const Text('Vehicle Use Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicleUseSetup())),
                ),
                ListTile(
                  title: const Text('Category Setup'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const VehicleCategory())),
                ),
                ListTile(
                  title: const Text('Vehicle'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Vehicle())),
                ),
              ],
            ),
            ExpansionTile(
              title: const ListTile(
                leading: Icon(FontAwesomeIcons.arrowTrendUp),
                title: Text('Stocks'),
              ),
              children: [
                ListTile(
                  title: const Text('Opening Stocks'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const OpeningStocks())),
                ),
                ListTile(
                  title: const Text('Closing Stocks'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClosingStocks())),
                ),
              ],
            ),
            ExpansionTile(
              title: const ListTile(
                leading: Icon(FontAwesomeIcons.gears),
                title: Text('Setup'),
              ),
              children: [
                ListTile(
                  title: const Text('Hariyali Project'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HariyaliProject())),
                ),
                ListTile(
                  title: const Text('Business Manager'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Businessmanager())),
                ),
                ListTile(
                  title: const Text('Farmer Group'),
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Farmergroup())),
                ),
                ListTile(
                  title: const Text('Farmers'),
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Farmers())),
                ),
              ],
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.calendar),
              title: const Text('Incoming Requests'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Incomingrequest())),
            ),
            ListTile(
              leading: const Icon(FontAwesomeIcons.gear),
              title: const Text('Given To Project'),
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Giventoproject())),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Confirm Logout'),
                        content:
                            const Text('Are you sure you want to log out?'),
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
                            child: const Text('Log Out'),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  child: const Text(
                    'Log Out',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
