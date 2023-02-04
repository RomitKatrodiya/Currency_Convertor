import 'package:currency_converter/controllers/currency_controller.dart';
import 'package:flutter/material.dart';
import '../../helpers/currency_api_helper.dart';
import '../../helpers/db_helper.dart';
import '../../modals/currency.dart';

futureBuilder(context, CurrencyController controller) {
  TextStyle? textStyle2 = Theme.of(context).textTheme.titleMedium;
  TextStyle? textStyle = Theme.of(context).textTheme.titleLarge?.merge(
        TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.bold,
        ),
      );

  return Column(
    children: [
      const SizedBox(height: 20),
      Container(
        padding: const EdgeInsets.symmetric(vertical: 15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: FutureBuilder(
          future: CurrencyConvertAPI.currencyConvertAPI
              .getData(controller: controller),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              Currency data = snapShot.data as Currency;
              if (controller.isConvert.value) {
                DBHelper.dbHelper.insertRecord(
                  from: data.from,
                  to: data.to,
                  date: data.date,
                  amount: data.amount.toStringAsFixed(2),
                  difference: data.difference.toStringAsFixed(2),
                );
              }
              return Column(
                children: [
                  Text(data.date, style: textStyle2),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text(data.amount.toString(), style: textStyle),
                            Text(data.from, style: textStyle2),
                          ],
                        ),
                      ),
                      Icon(
                        Icons.compare_arrows,
                        size: 35,
                        color: Theme.of(context).primaryColor.withOpacity(0.9),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(data.difference.toStringAsFixed(2),
                                style: textStyle),
                            Text(data.to, style: textStyle2),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                ],
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
      ),
    ],
  );
}
