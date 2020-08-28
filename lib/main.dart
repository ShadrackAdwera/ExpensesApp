import 'package:flutter/material.dart';

import './widgets/user_transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'My Expenses',
            style: TextStyle(color: Colors.yellow),
          ),
          backgroundColor: Colors.black87,
        ),
        body: ListView(
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart Card'),
                elevation: 5,
              ),
            ),
            UserTransactions(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.add,
            color: Colors.black87,
          ),
          backgroundColor: Colors.yellowAccent,
          onPressed: () {},
        ),
      ),
    );
  }
}
