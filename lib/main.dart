import 'package:flutter/material.dart';

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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart Card'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Title'), controller: titleController,
                    ),
                    TextField(
                      decoration: InputDecoration(labelText: 'Amount'), controller: amountController,
                    ),
                    FlatButton(
                      child: Text('Add Transaction'),
                      onPressed: () {},
                      color: Colors.black87,
                      textColor: Colors.yellowAccent,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
