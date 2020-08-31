import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function inputController;

  NewTransaction(this.inputController);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0) {
      return;
    }

    widget.inputController(enteredTitle, enteredAmount);
    Navigator.of(context).pop();
  }

  void _displayDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2020),
            lastDate: DateTime.now())
        .then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
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
              controller: _titleController,
              keyboardType: TextInputType.text,
              onSubmitted: (_) => _submitData(),
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitData(),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(
                    _selectedDate == null
                        ? 'No date chosen: '
                        : DateFormat().format(_selectedDate),
                  ),
                  FlatButton(
                    onPressed: _displayDatePicker,
                    child: Text(
                      'Chose Date: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    textColor: Theme.of(context).primaryColorDark,
                  ),
                ],
              ),
            ),
            RaisedButton(
              child: Text(
                'Add Transaction',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              color: Theme.of(context).accentColor,
              textColor: Theme.of(context).primaryColorDark,
              onPressed: _submitData,
            ),
          ],
        ),
      ),
    );
  }
}
