import 'package:flutter/material.dart';

import '../models/transaction.dart';
import './transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionsList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Container(
                  child: Image.asset(
                    'assets/images/placeholder.png',
                    fit: BoxFit.cover,
                  ),
                  height: 200,
                ),
                SizedBox(height: 20),
                Text('Add transactions to start saving')
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, i) {
                return TransactionItem(transactions[i]);
              },
              itemCount: transactions.length,
            ),
    );
  }
}
