import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> userTransactions;
  final Function _removeTransaction;

  TransactionList(this.userTransactions, this._removeTransaction);

  @override
  Widget build(BuildContext context) {
    return userTransactions.isEmpty
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
                margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                elevation: 8,
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
                      '${DateFormat().add_yMMMMd().format(userTransactions[index].date)}'),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () =>
                        _removeTransaction(userTransactions[index].id),
                  ),
                ),
              );
            },
            itemCount: userTransactions.length,
          );
  }
}
