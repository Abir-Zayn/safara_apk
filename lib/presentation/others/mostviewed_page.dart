import 'package:flutter/material.dart';

class MostviewedPage extends StatefulWidget {
  const MostviewedPage({super.key});

  @override
  State<MostviewedPage> createState() => _MostviewedPageState();
}

class _MostviewedPageState extends State<MostviewedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text(
            'Most Viewed Page',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
