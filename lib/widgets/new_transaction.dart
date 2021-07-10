import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function _addTransaction;

  NewTransaction(this._addTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _handleSubmit() {
    final titleInput = titleController.text;
    final amountInput = amountController.text.length > 0
        ? double.parse(amountController.text)
        : 0;

    if ((titleInput.isEmpty) || (amountInput <= 0)) {
      return;
    }
    widget._addTransaction(
      titleInput,
      amountInput,
    );

    Navigator.of(context).pop();
  }

  final submitNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
              ),
              controller: titleController,
              onSubmitted: (_) => _handleSubmit(),
            ),
            TextField(
              focusNode: submitNode,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              onSubmitted: (_) => _handleSubmit(),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Theme.of(context).accentColor),
              child: Container(
                child: Icon(Icons.add),
                width: double.infinity,
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 0),
              ),
              onPressed: () {
                submitNode.unfocus();
                return _handleSubmit();
              },
            ),
          ],
        ),
      ),
    );
  }
}
