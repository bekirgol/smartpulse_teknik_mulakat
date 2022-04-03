import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:smartpulse_teknik_test/Constand/constand.dart';
import 'package:smartpulse_teknik_test/Model/product.dart';

class ProductService {
  Future<Product> getProduct() async {
    String url =
        "https://seffaflik.epias.com.tr/transparency/service/market/intra-day-trade-history?endDate=${Constand.formattedDate}&startDate=${Constand.formattedDate}";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final result = productFromJson(response.body);
      return result;
    }

    throw "data yok";
  }
}
