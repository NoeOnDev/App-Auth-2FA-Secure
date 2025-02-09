import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.only(bottom: 200),
          child: Text(
            'Welcome to the Application',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
