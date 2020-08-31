import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function inputController;

  NewTransaction(this.inputController);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.parse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.inputController(enteredTitle, enteredAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Expense'),
              controller: titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text('No date chosen: '),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Chose Date: ', style: TextStyle(fontWeight: FontWeight.bold),),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text('Add Transaction', style: TextStyle(fontWeight: FontWeight.bold),),
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).primaryColorDark,
              onPressed: submitData,
            ),
          ],
        ),
      ),
    );
  }
}
