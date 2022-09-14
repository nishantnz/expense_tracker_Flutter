import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/new_transaction.dart';
import 'package:expense_tracker/widgets/transactions_list.dart';
import 'package:expense_tracker/widgets/user_transations.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
            //mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                child: Card(
                  child: Text("chart"),
                  elevation: 10.76,
                  color: Colors.blue,
                ),
              ),
              UserTransaction()
            ]),
      ),
    ));
  }
}
