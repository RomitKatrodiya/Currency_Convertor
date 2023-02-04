import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/currency_controller.dart';

searchDialog(
    {required CurrencyController controller,
    required bool isFrom,
    required context}) {
  controller.searchList.value = controller.currency;
  Get.bottomSheet(
    BottomSheet(
      onClosing: () {},
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SizedBox(height: 5),
              Text(
                "Select Currency",
                style: Theme.of(context).textTheme.titleMedium?.merge(
                      TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                      ),
                    ),
              ),
              const SizedBox(height: 15),
              TextField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.search),
                  hintText: "Search Currency",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onChanged: (val) {
                  controller.searchMechanism(val);
                },
              ),
              const SizedBox(height: 15),
              Expanded(
                child: Obx(
                  () => (controller.searchList.isNotEmpty)
                      ? ListView.builder(
                          itemCount: controller.searchList.length,
                          itemBuilder: (context, i) {
                            return Card(
                              child: ListTile(
                                onTap: () {
                                  (isFrom)
                                      ? controller.fromCurrency.value =
                                          controller.searchList[i]
                                      : controller.toCurrency.value =
                                          controller.searchList[i];
                                  Get.back();
                                },
                                title: Text(
                                  controller.searchList[i],
                                ),
                              ),
                            );
                          },
                        )
                      : const Center(
                          child: Text("No Currency Found"),
                        ),
                ),
              ),
            ],
          ),
        );
      },
    ),
  );
}
