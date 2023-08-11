import 'dart:async'; // Agrega esta línea para importar la clase Timer

import 'package:flutter/material.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClockScreen(),
    );
  }
}

class ClockScreen extends StatefulWidget {
  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  String currentTime = '';

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        final now = DateTime.now();
        currentTime = '${_formatTwoDigits(now.hour)}:${_formatTwoDigits(now.minute)}:${_formatTwoDigits(now.second)}';
      });
    });
  }

  String _formatTwoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clock App'),
      ),
      body: Center(
        child: ClockWidget(currentTime: currentTime),
      ),
    );
  }
}

class ClockWidget extends StatelessWidget {
  final String currentTime;

  ClockWidget({required this.currentTime});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: MediaQuery.of(context).size.width * 0.8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.grey[200],
      ),
      child: Center(
        child: Text(
          currentTime,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
