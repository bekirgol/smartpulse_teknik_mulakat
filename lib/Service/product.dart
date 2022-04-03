import 'package:http/http.dart' as http;
import 'package:smartpulse_teknik_test/Model/product.dart';

class ProductService {
  Future<Product> getProduct() async {
    String url =
        "https://seffaflik.epias.com.tr/transparency/service/market/intra-day-trade-history?endDate=2022-04-03&startDate=2022-04-03";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = productFromJson(response.body);
      return result;
    }

    throw "data yok";
  }
}
