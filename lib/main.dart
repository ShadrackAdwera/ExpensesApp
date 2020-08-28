import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('t1', 'Breakfast', 200.2, DateTime.now()),
    Transaction('t2', 'Lunch', 100.8, DateTime.now())
  ];
  
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
            Column(
              children: transactions
                  .map(
                    (tx) => Card(
                        color: Colors.black87,
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.yellowAccent, width: 2),
                              ),
                              child: Text(
                                'Ksh. ${tx.amount.toString()}',
                                style: TextStyle(
                                    color: Colors.yellowAccent,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  tx.name,
                                  style: TextStyle(
                                      color: Colors.yellowAccent,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                Text(
                                  DateFormat().format(tx.date),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            )
                          ],
                        )),
                  )
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
