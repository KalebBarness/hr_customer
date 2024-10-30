import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart'; // Import url_launcher

class MyreportsPage extends StatefulWidget {
  const MyreportsPage({super.key});

  @override
  State<MyreportsPage> createState() => _MyreportsPageState();
}

class _MyreportsPageState extends State<MyreportsPage> {
  // Function to launch the URL
  void _launchURL() async {
    const url = 'https://docs.google.com/document/d/13WtswiyUYOJXtyRQKcC5xJU0QlsRDPKtM-J-pHM2n4Q/edit#heading=h.67npy1ucyyzo';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override 
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Reports'),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0), // Padding for the whole ListView
            child: ElevatedButton(
              onPressed: _launchURL, // Call the function to launch the URL
              child: const Text('Report From "MM/DD/YYYY"'),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 75),
                foregroundColor: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _Report extends StatelessWidget {
  const _Report({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Report from MM/DD/YYYY'),
      ),
      body: Center(
        child: Text(
          'insert Hyperlink to report',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
