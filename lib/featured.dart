import 'package:flutter/material.dart';
import 'package:hp_customer/billing.dart';
import 'package:hp_customer/profile.dart';
import 'package:hp_customer/home.dart';
import 'package:hp_customer/claims.dart';

class FeaturedPage extends StatefulWidget {
  const FeaturedPage({super.key});

  @override
  State<FeaturedPage> createState() => _FeaturedPageState();
}

class _FeaturedPageState extends State<FeaturedPage> {
  @override
  Widget build(BuildContext context) {
    int currentPage = 3;
    return WillPopScope(
        onWillPop: () async {
          // Intercept the back button press and navigate back to HomePage
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
            (route) => false, // This removes all previous routes from the stack
          );
          return false; // Prevent the default back navigation behavior
        },
        child: Scaffold(
            appBar: AppBar(
              title: const Text('Featured'),
              centerTitle: true,
            ),
            bottomNavigationBar: NavigationBar(
              indicatorColor: const Color.fromARGB(255, 0, 174, 255),
              destinations: const [
                NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                NavigationDestination(
                    icon: Icon(Icons.wallet), label: 'Billing'),
                NavigationDestination(
                    icon: Icon(Icons.add_box_rounded), label: 'Claims'),
                NavigationDestination(
                    icon: Icon(Icons.star_rate_outlined), label: 'Featured'),
                NavigationDestination(
                    icon: Icon(Icons.person), label: 'Profile'),
              ],
              onDestinationSelected: (int index) {
                setState(() {
                  currentPage = index;
                });
                switch (index) {
                  case 0:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                    break;
                  case 1:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BillingPage()),
                    );
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ClaimsPage()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ProfilePage()),
                    );
                    break;
                }
              },
              selectedIndex: currentPage,
            )
          )
        );
  }
}
