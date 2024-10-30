import 'package:flutter/material.dart';

class PreviousClaimsPage extends StatefulWidget {
  const PreviousClaimsPage({super.key});

  @override
  State<PreviousClaimsPage> createState() => _PreviousClaimsPageState();
}

class _PreviousClaimsPageState extends State<PreviousClaimsPage> {
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('Previous Claims'),
      ),
    );
  }
}