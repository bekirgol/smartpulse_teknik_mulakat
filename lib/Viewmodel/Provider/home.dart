// ignore_for_file: constant_identifier_names, avoid_function_literals_in_foreach_calls

import 'package:flutter/cupertino.dart';
import 'package:smartpulse_teknik_test/Model/product.dart';
import 'package:smartpulse_teknik_test/Model/productPh.dart';
import 'package:smartpulse_teknik_test/Service/product.dart';

enum PageState { LOADING, SUCCES, IDLE, ERROR }

class HomeProvider with ChangeNotifier {
  late ProductService service;
  Product? product;
  late PageState _pageState;
  PageState get pageState => _pageState;
  set pageState(PageState value) {
    _pageState = value;
    notifyListeners();
  }

  HomeProvider() {
    service = ProductService();
    _pageState = PageState.IDLE;
    getData();
  }

  Future<Product?> getData() async {
    try {
      pageState = PageState.LOADING;
      product = await service.getProduct();
      pageState = PageState.SUCCES;
      return product;
    } catch (e) {
      pageState = PageState.ERROR;
    }
  }

  ProductPh getProduct(String conract) {
    num transactionQuantity = 0;
    num transactionAmount = 0;
    num avgAmount = 0;
    product!.body!.intraDayTradeHistoryList!
        .where((element) => element.conract == conract)
        .forEach((element) {
      transactionAmount += (element.price! * element.quantity!) / 10;
      transactionQuantity += element.quantity! / 10;
      avgAmount = transactionAmount / transactionQuantity;
    });
    ProductPh model = ProductPh(
        contract: conract,
        transactionAmount: transactionAmount,
        transactionQuantity: transactionQuantity,
        avgAmont: avgAmount);

    return model;
  }
}
