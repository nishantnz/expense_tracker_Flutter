import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final List<Transactions> transaction = [
    Transactions(
      id: 't1',
      title: "new Shoes",
      amount: 12,
      date: DateTime.now(),
    ),
    Transactions(
      id: 't2',
      title: "new car",
      amount: 1200,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Container(
          width: double.infinity,
          child: Card(
            child: Text("chart"),
            elevation: 10.76,
            color: Colors.blue,
          ),
        ),
        Column(
          children: transaction.map((tx) {
            return Card(
              child: Row(
                children: [
                  Container(
                    child: Text(
                      tx.amount.toString(),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        tx.title,
                      ),
                      Text(
                        tx.date.toString(),
                      ),
                    ],
                  )
                ],
              ),
            );
          }).toList(),
        ),
      ]),
    ));
  }
}
