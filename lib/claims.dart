import 'package:flutter/material.dart';
import 'package:hp_customer/billing.dart';
import 'package:hp_customer/featured.dart';
import 'package:hp_customer/profile.dart';
import 'package:hp_customer/home.dart';

class ClaimsPage extends StatefulWidget {
  const ClaimsPage({super.key});

  @override
  State<ClaimsPage> createState() => _ClaimsPageState();
}

class _ClaimsPageState extends State<ClaimsPage> {
  int currentPage = 2; 

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
          (route) => false, 
        );
        return false; 
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Claims'),
          centerTitle: true,
        ),
        body: const Center(
          child: Text('Claims Page Content'),
        ),
        bottomNavigationBar: NavigationBar(
          indicatorColor: const Color.fromARGB(255, 0, 174, 255),
          destinations: const [
            NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
            NavigationDestination(icon: Icon(Icons.wallet), label: 'Billing'),
            NavigationDestination(icon: Icon(Icons.add_box_rounded), label: 'Claims'),
            NavigationDestination(icon: Icon(Icons.star_rate_outlined), label: 'Featured'),
            NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
            switch (index) {
              case 0:
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                  (route) => false, // Remove all previous routes
                );
                break;
              case 1:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BillingPage()),
                );
                break;
              case 3:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const FeaturedPage()),
                );
                break;
              case 4:
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
                break;
            }
          },
          selectedIndex: currentPage,
        ),
      ),
    );
  }
}
