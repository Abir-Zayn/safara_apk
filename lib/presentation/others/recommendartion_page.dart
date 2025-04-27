import 'package:flutter/material.dart';

class RecommendartionPage extends StatefulWidget {
  const RecommendartionPage({super.key});

  @override
  State<RecommendartionPage> createState() => _RecommendartionPageState();
}

class _RecommendartionPageState extends State<RecommendartionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Center(
          child: Text(
            'Recommendation Page',
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
