import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import './widgets/new_transaction.dart';
import './widgets/transactions_list.dart';

import './models/transaction.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Expenses',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          accentColor: Colors.amber,
          textTheme:
              GoogleFonts.robotoMonoTextTheme(Theme.of(context).textTheme),
          appBarTheme: AppBarTheme(
            textTheme: ThemeData.light().textTheme.copyWith(
                  headline6: GoogleFonts.robotoMono(
                    textStyle: Theme.of(context).textTheme.headline6,
                    color: Colors.white,
                  ),
                ),
          ),
        ),
        home: MyHomePage(title: 'Personal Expenses'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransactions = [
    // Transaction(id: '1', amount: 34.99, date: DateTime.now(), title: 'AirTag'),
    // Transaction(id: '2', amount: 30.99, date: DateTime.now(), title: 'MagSafe'),
    // Transaction(
    //     id: '3', amount: 959.00, date: DateTime.now(), title: 'iPhone 12'),
  ];

  void _addTransaction(title, amount) {
    final transaction = Transaction(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _userTransactions.add(transaction);
    });
  }

  void _showAddTransactionModal(BuildContext ctx) {
    showModalBottomSheet(
        context: ctx,
        builder: (_) {
          return GestureDetector(
            onTap: () {},
            child: NewTransaction(_addTransaction),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Theme.of(context).primaryColorDark,
        actions: [
          IconButton(
            onPressed: () => _showAddTransactionModal(context),
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: Column(
        children: [
          // Top Banner
          Container(
            height: 100,
            width: double.infinity,
            child: Card(
              child: Text('top banner'),
              elevation: 5,
            ),
          ),
          TransactionsList(_userTransactions),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddTransactionModal(context),
        child: Icon(Icons.add),
        backgroundColor: Theme.of(context).accentColor,
      ),
    );
  }
}
