import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class NewTransaction extends StatelessWidget {
  final Function newTransactionHandler;
  NewTransaction(this.newTransactionHandler, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(children: [
          TextField(
            autofocus: true,
            decoration: InputDecoration(labelText: "Title"),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(labelText: "Amount"),
            controller: amountController,
          ),
          TextButton(
              onPressed: () => {
                    newTransactionHandler(titleController.text,
                        double.parse(amountController.text))
                  },
              child: Text("Add Transaction"))
        ]),
      ),
    );
  }
}
