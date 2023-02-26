import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transactions> transaction;
  final Function deleteTx;

  TransactionList(this.transaction, this.deleteTx, {super.key});

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: [
                const Text(
                  "No transactions Added yet!",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/image/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            );
          })
        : ListView.builder(
            itemBuilder: ((context, index) {
              return Card(
                elevation: 10,
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(5),
                      child: FittedBox(
                        child: Text(
                          "₹${transaction[index].amount.toStringAsFixed(2)}",
                          // style: TextStyle(
                          //   //   fontWeight: FontWeight.bold,
                          //   fontSize: 500,
                          // ),
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  subtitle: Text(
                    DateFormat.yMMMMEEEEd().format(transaction[index].date),
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: () {
                      HapticFeedback.heavyImpact();
                      deleteTx(
                        transaction[index].id,
                      );
                    },
                  ),
                ),
              );
              /* you can use your custom widget but alternative(Listtile) also can be used
                return Card(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColorLight,
                          border: Border.all(color: Colors.black, width: 2),
                        ),
                        child: Text(
                          "₹${transaction[index].amount.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        width:
                            200, //added fix width to prevent overflowing of pixels
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              transaction[index].title,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            Text(
                              DateFormat.yMMMMEEEEd()
                                  .add_Hm()
                                  .format(transaction[index].date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );*/
            }),
            itemCount: transaction.length,
          );
  }
}
