import 'dart:math';

import 'package:flutter/material.dart';

import './new_transaction.dart';
import './transaction_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  @override
  _UserTransactionsState createState() => _UserTransactionsState();
}

class _UserTransactionsState extends State<UserTransactions> {

 final List<Transaction> _userTransactions = [
    Transaction('t1', 'Breakfast', 200.2, DateTime.now()),
    Transaction('t2', 'Lunch', 100.8, DateTime.now())
  ];

  void _addTransaction(String txTitle, double txAmount) {
    final newTransaction = Transaction(Random().toString(), txTitle, txAmount, DateTime.now() );
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(_addTransaction),
        TransactionList(_userTransactions)
      ],
    );
  }
}