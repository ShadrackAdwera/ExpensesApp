import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final titleController = TextEditingController();
  final amountController = TextEditingController();

  final Function inputController;

  NewTransaction(this.inputController);

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
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
              keyboardType: TextInputType.text,
            ),
            TextField(
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            FlatButton(
              child: Text('Add Transaction'),
              onPressed: () {
                inputController(titleController.text, double.parse(amountController.text));
              },
              color: Colors.black87,
              textColor: Colors.yellowAccent,
            ),
          ],
        ),
      ),
    );
  }
}
