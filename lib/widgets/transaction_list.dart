import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemBuilder: (ctx, index) {
          return Card(
              color: Colors.black87,
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.yellowAccent, width: 2),
                    ),
                    child: Text(
                      'Ksh. ${userTransactions[index].amount.toString()}',
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
                        userTransactions[index].name,
                        style: TextStyle(
                            color: Colors.yellowAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Text(
                        DateFormat().format(userTransactions[index].date),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ));
        },
        itemCount: userTransactions.length,
      ),
    );
  }
}
