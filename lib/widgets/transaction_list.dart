import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;

  TransactionList(this.userTransactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 600,
      child: userTransactions.isEmpty
          ? Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  margin: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
                  elevation: 5,
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text(
                                  'Ksh. ${userTransactions[index].amount}'))),
                    ),
                    title: Text(
                      '${userTransactions[index].name}',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        '${DateFormat().format(userTransactions[index].date)}'),
                  ),
                );
              },
              itemCount: userTransactions.length,
            ),
    );
  }
}
