import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../utils/check_connectivity.dart';
import '../views/components/snack_bar.dart';

class CurrencyController extends GetxController {
  Rx<bool> isLight = true.obs;
  Rx<bool> isPressed = false.obs;
  Rx<bool> isConvert = false.obs;
  Rx<String> fromCurrency = "".obs;
  Rx<String> toCurrency = "".obs;
  Rx<int> amount = 0.obs;

  RxList<String> currency = [
    "AED",
    "AFN",
    "AMD",
    "ANG",
    "AOA",
    "ARS",
    "AUD",
    "AWG",
    "AZN",
    "BAM",
    "BBD",
    "BDT",
    "BGN",
    "BHD",
    "BIF",
    "BMD",
    "BND",
    "BOB",
    "BRL",
    "BSD",
    "BTC",
    "BTN",
    "BWP",
    "BYN",
    "BZD",
    "CAD",
    "CDF",
    "CHF",
    "CLF",
    "CLP",
    "CNH",
    "CNY",
    "COP",
    "CRC",
    "CUC",
    "CUP",
    "CVE",
    "CZK",
    "DJF",
    "DKK",
    "DOP",
    "DZD",
    "EGP",
    "ERN",
    "ETB",
    "EUR",
    "FJD",
    "FKP",
    "GBP",
    "GEL",
    "GGP",
    "GHS",
    "GIP",
    "GMD",
    "GNF",
    "GTQ",
    "GYD",
    "HKD",
    "HNL",
    "HRK",
    "HTG",
    "HUF",
    "IDR",
    "ILS",
    "IMP",
    "INR",
    "IQD",
    "IRR",
    "ISK",
    "JEP",
    "JMD",
    "JOD",
    "JPY",
    "KES",
    "KGS",
    "KHR",
    "KMF",
    "KPW",
    "KRW",
    "KWD",
    "KYD",
    "KZT",
    "LAK",
    "LBP",
    "LKR",
    "LRD",
    "LSL",
    "LYD",
    "MAD",
    "MDL",
    "MGA",
    "MKD",
    "MMK",
    "MNT",
    "MOP",
    "MRU",
    "MUR",
    "MVR",
    "MWK",
    "MXN",
    "MYR",
    "MZN",
    "NAD",
    "NGN",
    "NIO",
    "NOK",
    "NPR",
    "NZD",
    "OMR",
    "PAB",
    "PEN",
    "PGK",
    "PHP",
    "PKR",
    "PLN",
    "PYG",
    "QAR",
    "RON",
    "RSD",
    "RUB",
    "RWF",
    "SAR",
    "SBD",
    "SCR",
    "SDG",
    "SEK",
    "SGD",
    "SHP",
    "SLL",
    "SOS",
    "SRD",
    "SSP",
    "STD",
    "STN",
    "SVC",
    "SYP",
    "SZL",
    "THB",
    "TJS",
    "TMT",
    "TND",
    "TOP",
    "TRY",
    "TTD",
    "TWD",
    "TZS",
    "UAH",
    "UGX",
    "USD",
    "UYU",
    "UZS",
    "VES",
    "VND",
    "VUV",
    "WST",
    "XAF",
    "XAG",
    "XAU",
    "XCD",
    "XDR",
    "XOF",
    "XPD",
    "XPF",
    "XPT",
    "YER",
    "ZAR",
    "ZMW",
    "ZWL"
  ].obs;
  RxList searchList = [].obs;

  convertButtonOnTap() async {
    if (fromCurrency.value == "") {
      snackBar(
        title: "Form Country",
        subTitle: "Please Select Form Country",
        icon: Icons.error,
      );
      return false;
    } else if (toCurrency.value == "") {
      snackBar(
        title: "To Country",
        subTitle: "Please Select To Country",
        icon: Icons.error,
      );
    } else {
      bool connectivity = await checkConnectivityNow();
      if (connectivity) {
        isPressed.value = true;
      }
    }
  }

  searchMechanism(val) {
    searchList.value = [];
    if (val.isEmpty) {
      searchList.value = currency;
    } else {
      searchList.value = currency
          .where((element) => element.toLowerCase().contains(val.toLowerCase()))
          .toList();
    }
  }

  isLightChange() {
    isLight.value = !isLight.value;
  }
}
