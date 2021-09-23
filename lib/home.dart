import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './setup/transaction.dart';
import 'package:intl/intl.dart';

class home extends StatefulWidget {
  final String title;
  home({Key? key, required this.title}) : super(key: key);

  @override
  _homeState createState() => _homeState();
}

class _homeState extends State<home> {
  List<transaction> listTransaction = [
    transaction(id: "t-1", title: "Apple", amount: 10.59, date: DateTime.now()),
    transaction(
        id: "t-2", title: "Banana", amount: 18.59, date: DateTime.now()),
    transaction(
        id: "t-3", title: "Pineapple", amount: 16.99, date: DateTime.now()),
  ];
  late String title;
  late String amount;
  @override
  Widget build(BuildContext context) {
    Locale locale = Localizations.localeOf(context);
    var format =
        NumberFormat.simpleCurrency(locale: locale.toString(), name: 'BDT');
    return Scaffold(
        appBar: AppBar(title: Text(widget.title)),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Card(
                color: Colors.blue.shade600,
                child: Text('Chart Example'),
                elevation: 5,
              ),
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    TextField(
                      onChanged: (txt) => title = txt,
                      decoration: InputDecoration(label: Text("Title")),
                    ),
                    TextField(
                      onChanged: (txt) => amount = txt,
                      decoration: InputDecoration(label: Text("Amount")),
                    ),
                    RaisedButton(
                      onPressed: () {
                        print(title);
                        print(amount);
                      },
                      color: Colors.purple.shade400,
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Column(
                children: listTransaction
                    .map((tx) => Card(
                          child: Row(children: <Widget>[
                            Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      width: 1, color: Colors.purple.shade400)),
                              child: Text(
                                '${format.currencySymbol}${tx.amount}',
                                style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.purple),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  tx.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                                Text(
                                  DateFormat('dd-MM-yyyy hh:mm a')
                                      .format(tx.date),
                                  style: TextStyle(color: Colors.grey),
                                )
                              ],
                            )
                          ]),
                        ))
                    .toList())
          ],
        ));
  }
}
