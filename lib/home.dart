
import 'package:flutter/material.dart';
import 'package:hp_customer/claimready.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 250, 
                  height: 75,
                  child: FloatingActionButton(
                    onPressed: () { Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Claimready()),
                      );
                  },
                    child: const Text('ClaimReady Request'),
                  ),
                ),
                SizedBox(height: 20), 
                Container(
                  width: 250, 
                  height: 75,
                  child: FloatingActionButton(
                    onPressed: () { Navigator.push(
                       context,
                       MaterialPageRoute(builder: (context) => Claimready()),
                      );
                  },
                    child: const Text('ClaimReady Request'),
                  ),
                ),
              ],
        ),
      ),
    );
  }      
}         

  
    

