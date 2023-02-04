class Currency {
  final double difference;
  final double rate;
  final String date;
  final int amount;
  final String from;
  final String to;

  Currency({
    required this.difference,
    required this.rate,
    required this.date,
    required this.amount,
    required this.from,
    required this.to,
  });

  factory Currency.fromJSON({required Map<String, dynamic> data}) {
    return Currency(
      difference: data["result"],
      date: data["date"],
      rate: data["info"]["rate"],
      from: data["query"]["from"],
      to: data["query"]["to"],
      amount: data["query"]["amount"],
    );
  }
}

class CurrencyDB {
  final String difference;
  final String id;
  final String date;
  final String amount;
  final String from;
  final String to;

  CurrencyDB({
    required this.difference,
    required this.id,
    required this.date,
    required this.amount,
    required this.from,
    required this.to,
  });

  factory CurrencyDB.fromJSON({required Map<String, dynamic> data}) {
    return CurrencyDB(
      difference: data["difference"],
      date: data["date"],
      id: "${data["id"]}",
      from: data["fromCurrency"],
      to: data["toCurrency"],
      amount: data["amount"],
    );
  }
}
