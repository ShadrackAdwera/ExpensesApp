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
                    child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
                      margin:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColorDark,
                        border: Border.all(
                            width: 2,
                            color: Theme.of(context).primaryColorDark),
                      ),
                      child: Text(
                        'Ksh. ${userTransactions[index].amount.toStringAsFixed(2)}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).accentColor),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          userTransactions[index].name,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          DateFormat().format(userTransactions[index].date),
                          style: TextStyle(color: Colors.blueGrey),
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
