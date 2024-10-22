import 'package:flutter/material.dart';
import 'package:hp_customer/home.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
@override
Widget build(BuildContext context) {
  int currentPage = 1;
  return Scaffold(
    appBar: AppBar(
        title: const Text('Profile'),
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
           if (index == 0) {
           Navigator.push( 
              context,
              MaterialPageRoute(
                builder: (context) => HomePage()
        ),
      );
            
          }
        },
        selectedIndex: currentPage,
      ),
    body: Center(child: Text("gay"))
  );
  }
}