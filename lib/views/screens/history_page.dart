import 'package:currency_converter/helpers/db_helper.dart';
import 'package:flutter/material.dart';
import '../../modals/currency.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextStyle? textStyle2 = Theme.of(context).textTheme.titleMedium;
    TextStyle? textStyle = Theme.of(context).textTheme.titleLarge?.merge(
          TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        );

    return Scaffold(
      appBar: AppBar(
        title: const Text("History"),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: DBHelper.dbHelper.fetchAllRecords(),
        builder: (context, snapShot) {
          if (snapShot.hasData) {
            List<CurrencyDB>? data = snapShot.data as List<CurrencyDB>;
            List<CurrencyDB> historyList = data.reversed.toList();
            return ListView.builder(
              itemCount: historyList.length,
              itemBuilder: (context, i) {
                return Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Text(historyList[i].date, style: textStyle2),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(historyList[i].amount, style: textStyle),
                                Text(historyList[i].from, style: textStyle2),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.compare_arrows,
                            size: 35,
                            color:
                                Theme.of(context).primaryColor.withOpacity(0.9),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(historyList[i].difference,
                                    style: textStyle),
                                Text(historyList[i].to, style: textStyle2),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                );
              },
            );
          } else if (snapShot.hasError) {
            return Center(
              child: Text("${snapShot.error}"),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
