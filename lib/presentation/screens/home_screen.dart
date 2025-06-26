import 'package:flutter/material.dart';
import 'package:training_schedule_app/presentation/screens/week_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WeekScreen()),
            );
          },
          child: Text('Training plan'),
        ),
      ),
    );
  }
}
