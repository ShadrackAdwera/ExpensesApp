import 'package:flutter/material.dart';
import './transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction('t1', 'Breakfast', 200.2, DateTime.now()),
    Transaction('t2', 'Lunch', 100.8, DateTime.now())
  ];

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
            Container(
              width: double.infinity,
              child: Card(
                child: Text('Chart Card'),
                elevation: 5,
              ),
            ),
            Column(
              children: transactions
                  .map((tx) => Row(
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.yellowAccent, width: 2),
                            ),
                            child: Text(
                              tx.amount.toString(),
                            ),
                          ),
                          Column(
                            children: [
                              Text(tx.name),
                              Text(tx.date.toString()),
                            ],
                          )
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
