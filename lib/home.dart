import 'package:flutter/material.dart';
import 'package:hp_customer/myreports.dart';
import 'package:hp_customer/previousclaims.dart';
import 'package:hp_customer/profile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentPage = 0;

  void _navigateToFileInspectionReportPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const _FileInspectionReportPage(),
      ),
    );
  }
  void _navigateToServiceProvidersPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const _ServiceProvidersPage(),
      ),
    );
  }
void _navigateToinsurancepolicyPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const _insurancepolicyPage(),
      ),
    );
  }

  void _navigateToContactPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const _ContactPage(),
      ),
    );
  }

  void _onHelpButtonPressed() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Help'),
        content:
            const Text('I think this should navigate to a FAQ page instead'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child:
                  const Text('Close', style: TextStyle(color: Colors.black))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClaimReady+', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 255, 136, 0),
        actions: [
          IconButton(
            icon: const Icon(Icons.help),
            onPressed: _onHelpButtonPressed,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Untitled_design.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(height: 25),
            Container(
              width: 150.0,
              height: 150.0,
              decoration: const BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.zero,
                image: DecorationImage(
                  image: NetworkImage(
                      "https://preview.redd.it/i-got-bored-so-i-decided-to-draw-a-random-image-on-the-v0-4ig97vv85vjb1.png?width=1280&format=png&auto=webp&s=7177756d1f393b6e093596d06e1ba539f723264b"),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Center(
              child: ElevatedButton(
                onPressed: _navigateToFileInspectionReportPage,
                child: const Text('Schedule Inspection'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: Size(300, 75),
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            const SizedBox(height: 35),
            Center(
              child: ElevatedButton(
                onPressed: _navigateToServiceProvidersPage,
                child: const Text('Service Providers'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                  minimumSize: Size(300, 75),
                  textStyle: const TextStyle(fontSize: 20),
                ),
              ),
            ),
            SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _navigateToContactPage,
                  child: const Text('Contact Agent'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    minimumSize: Size(100, 75),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(width:10),
                ElevatedButton(
                  onPressed: _navigateToinsurancepolicyPage,
                  child: const Text(' Insurance Policy'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 0, 0, 0),
                    minimumSize: Size(75, 75),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: NavigationBar(
        indicatorColor: const Color.fromARGB(255, 0, 174, 255),
        destinations: const [
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
                builder: (context) => const ProfilePage(),
              ),
            );
          }
        },
        selectedIndex: currentPage,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 56, 141, 239),
              ),
              child: Text(
                'Menu',
                style: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.align_horizontal_left_rounded),
              title: const Text('My Reports'),
              onTap: () {
                Navigator.pop(context); // Close the drawer first
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyreportsPage(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.history),
              title: const Text('Previous Claims'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PreviousClaimsPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


class _FileInspectionReportPage extends StatelessWidget {
  const _FileInspectionReportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Your Appointment!'),
      ),
      body: Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _ContactPage extends StatelessWidget {
  const _ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Agent'),
      ),
      body: Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
  
}

class _insurancepolicyPage extends StatelessWidget {
  const _insurancepolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insurance Policy'),
      ),
      body: Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class _ServiceProvidersPage extends StatelessWidget {
  const _ServiceProvidersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Providers'),
      ),
      body: Center(
        child: Text(
          'text',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
