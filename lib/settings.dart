import 'package:flutter/material.dart';
import 'package:hp_customer/home.dart';
import 'package:hp_customer/profile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
@override
Widget build(BuildContext context) {
  int currentPage = 2;
  return Scaffold(
    appBar: AppBar(
        title: const Text('Settings'),
        backgroundColor: Color.fromARGB(255, 255, 132, 0),
      ),
      body: Center(child: Text("kms"))
  );
  }
}