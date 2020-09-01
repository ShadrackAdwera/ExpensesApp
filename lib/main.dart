import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';

import './widgets/new_transaction.dart';
import './models/transaction.dart';
import './widgets/transaction_list.dart';
import './widgets/chart.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations(
  //   [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  // );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.amber,
        errorColor: Colors.red,
        fontFamily: 'Quicksand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
                headline6: TextStyle(
                    fontFamily: 'OpenSans',
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _showChart = false;

  final List<Transaction> _userTransactions = [
    // Transaction('t1', 'Breakfast', 200.2, DateTime.now()),
    // Transaction('t2', 'Lunch', 100.8, DateTime.now())
  ];
  List<Transaction> get _recentTransactions {
    return _userTransactions.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)));
    }).toList();
  }

  void _addTransaction(String txTitle, double txAmount, DateTime chosenDate) {
    final newTransaction =
        Transaction(DateTime.now().toString(), txTitle, txAmount, chosenDate);
    setState(() {
      _userTransactions.add(newTransaction);
    });
  }

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return NewTransaction(_addTransaction);
        });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransactions.removeWhere((element) => element.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final PreferredSizeWidget appBar = Platform.isIOS
        ? CupertinoNavigationBar(
            middle: Text('Personal Expenses'),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  child: Icon(CupertinoIcons.add),
                  onTap: () => _startAddNewTransaction(context),
                )
              ],
            ),
          )
        : AppBar(
            title: Text(
              'Personal Expenses',
            ),
          );
    final txWidget = Container(
        height: (MediaQuery.of(context).size.height -
                appBar.preferredSize.height -
                MediaQuery.of(context).padding.top) *
            0.7,
        child: TransactionList(_userTransactions, _deleteTransaction));
    final appBody = SafeArea(
        child: ListView(
      children: [
        if (isLandScape)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Show Chart', style: Theme.of(context).textTheme.headline6,),
              Switch.adaptive(
                  activeColor: Theme.of(context).accentColor,
                  value: _showChart,
                  onChanged: (val) {
                    setState(() {
                      _showChart = val;
                    });
                  }),
            ],
          ),
        if (!isLandScape)
          Container(
            height: (MediaQuery.of(context).size.height -
                    appBar.preferredSize.height -
                    MediaQuery.of(context).padding.top) *
                0.3,
            child: Chart(_recentTransactions),
          ),
        if (!isLandScape) txWidget,
        if (isLandScape)
          _showChart
              ? Container(
                  height: (MediaQuery.of(context).size.height -
                          appBar.preferredSize.height -
                          MediaQuery.of(context).padding.top) *
                      0.7,
                  child: Chart(_recentTransactions),
                )
              : txWidget
      ],
    ));
    return Platform.isIOS
        ? CupertinoPageScaffold(
            child: appBody,
            navigationBar: appBar,
          )
        : Scaffold(
            appBar: appBar,
            body: appBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: Icon(
                      Icons.add,
                    ),
                    onPressed: () => _startAddNewTransaction(context),
                  ),
          );
  }
}
