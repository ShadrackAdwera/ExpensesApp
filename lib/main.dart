import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Expenses',
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        body: Column(
          children: [
            Card(
              child: Text('Chart Card'),
            ),
            Card(
              child: Text('Expenses List'),
            )
          ],
        ),
      ),
    );
  }
}
