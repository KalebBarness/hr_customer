import 'package:flutter/material.dart';
import 'package:hp_customer/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClaimReady+'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('FloatingActionButton');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.blue.shade300,
        destinations: [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index; 
            print(currentPage);
          });
           if (index == 1) {
           Navigator.push( 
              context,
              MaterialPageRoute(
                builder: (context) => ProfilePage(),
        ),
      ); 
          }
        },
        selectedIndex: currentPage,
      ),
    );
  }
}

