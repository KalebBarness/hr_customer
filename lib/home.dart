import 'package:flutter/material.dart';
import 'package:hp_customer/claimready.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueGrey[500],
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 30),
          SizedBox(
            height: 80,
            width: 200,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[500], shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Claimready()),
              );
            },
            child: Text('Go to Claim Ready', style: TextStyle(color: Colors.white)),
          ),
          ),
          const SizedBox(height: 30),
          SizedBox(
            height: 80,
            width: 200,
            child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blueGrey[500], shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(10))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Claimready()),
              );
            },
            child: Text('Go to Claim Ready', style: TextStyle(color: Colors.white)),
          ),
          ),
        ],
      )),
    );
  }
}
