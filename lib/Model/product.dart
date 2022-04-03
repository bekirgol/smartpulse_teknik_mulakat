// To parse this JSON data, do
//
//     final welcome2 = welcome2FromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
  Product({
    this.body,
  });

  Body? body;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        body: Body.fromJson(json["body"]),
      );

  Map<String, dynamic> toJson() => {
        "body": body?.toJson(),
      };
}

class Body {
  Body({
    this.intraDayTradeHistoryList,
    this.statistics,
  });

  List<IntraDayTradeHistoryList>? intraDayTradeHistoryList;
  Statistics? statistics;

  factory Body.fromJson(Map<String, dynamic> json) => Body(
        intraDayTradeHistoryList: List<IntraDayTradeHistoryList>.from(
            json["intraDayTradeHistoryList"]
                .map((x) => IntraDayTradeHistoryList.fromJson(x))),
        // statistics: Statistics.fromJson(json["statistics"]),
      );

  Map<String, dynamic> toJson() => {
        "intraDayTradeHistoryList": List<dynamic>.from(
            intraDayTradeHistoryList!.map((x) => x.toJson())),
        "statistics": statistics?.toJson(),
      };
}

class IntraDayTradeHistoryList {
  IntraDayTradeHistoryList({
    this.id,
    this.date,
    this.conract,
    this.price,
    this.quantity,
  });

  int? id;
  String? date;
  String? conract;
  double? price;
  int? quantity;

  factory IntraDayTradeHistoryList.fromJson(Map<String, dynamic> json) =>
      IntraDayTradeHistoryList(
        id: json["id"],
        date: json["date"],
        conract: json["conract"],
        price: json["price"].toDouble(),
        quantity: json["quantity"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "date": date,
        "conract": conract,
        "price": price,
        "quantity": quantity,
      };
}

class Statistics {
  Statistics({
    this.date,
    this.priceWeightedAverage,
    this.priceMin,
    this.priceMax,
    this.quantityMin,
    this.quantityMax,
    this.quantitySum,
  });

  String? date;
  double? priceWeightedAverage;
  double? priceMin;
  double? priceMax;
  int? quantityMin;
  int? quantityMax;
  int? quantitySum;

  factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
        date: json["date"],
        priceWeightedAverage: json["priceWeightedAverage"].toDouble(),
        priceMin: json["priceMin"].toDouble(),
        priceMax: json["priceMax"].toDouble(),
        quantityMin: json["quantityMin"],
        quantityMax: json["quantityMax"],
        quantitySum: json["quantitySum"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "priceWeightedAverage": priceWeightedAverage,
        "priceMin": priceMin,
        "priceMax": priceMax,
        "quantityMin": quantityMin,
        "quantityMax": quantityMax,
        "quantitySum": quantitySum,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }
}






// // To parse this JSON data, do
// //
// //     final product = productFromJson(jsonString);

// import 'dart:convert';

// Product productFromJson(String str) => Product.fromJson(json.decode(str));

// String productToJson(Product data) => json.encode(data.toJson());

// class Product {
//   IntraDayTradeHistoryResponse? intraDayTradeHistoryResponse;
//   String? omitXmlDeclaration;

//   Product({
//     this.intraDayTradeHistoryResponse,
//     this.omitXmlDeclaration,
//   });

//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//         intraDayTradeHistoryResponse: IntraDayTradeHistoryResponse.fromJson(
//             json["intraDayTradeHistoryResponse"]),
//         omitXmlDeclaration: json["#omit-xml-declaration"],
//       );

//   Map<String, dynamic> toJson() => {
//         "intraDayTradeHistoryResponse": intraDayTradeHistoryResponse!.toJson(),
//         "#omit-xml-declaration": omitXmlDeclaration,
//       };
// }

// class IntraDayTradeHistoryResponse {
//   Body? body;
//   String? resultCode;
//   String? resultDescription;

//   IntraDayTradeHistoryResponse({
//     this.body,
//     this.resultCode,
//     this.resultDescription,
//   });

//   factory IntraDayTradeHistoryResponse.fromJson(Map<String, dynamic> json) =>
//       IntraDayTradeHistoryResponse(
//         body: Body.fromJson(json["body"]),
//         resultCode: json["resultCode"],
//         resultDescription: json["resultDescription"],
//       );

//   Map<String, dynamic> toJson() => {
//         "body": body!.toJson(),
//         "resultCode": resultCode,
//         "resultDescription": resultDescription,
//       };
// }

// class Body {
//   String? xmlnsXsi;
//   String? xsiType;
//   List<IntraDayTradeHistoryList>? intraDayTradeHistoryList;
//   Statistics? statistics;

//   Body({
//     this.xmlnsXsi,
//     this.xsiType,
//     this.intraDayTradeHistoryList,
//     this.statistics,
//   });

//   factory Body.fromJson(Map<String, dynamic> json) => Body(
//         xmlnsXsi: json["-xmlns:xsi"],
//         xsiType: json["-xsi:type"],
//         intraDayTradeHistoryList: List<IntraDayTradeHistoryList>.from(
//             json["intraDayTradeHistoryList"]
//                 .map((x) => IntraDayTradeHistoryList.fromJson(x))),
//         statistics: Statistics.fromJson(json["statistics"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "-xmlns:xsi": xmlnsXsi,
//         "-xsi:type": xsiType,
//         "intraDayTradeHistoryList": List<dynamic>.from(
//             intraDayTradeHistoryList!.map((x) => x.toJson())),
//         "statistics": statistics!.toJson(),
//       };
// }

// class IntraDayTradeHistoryList {
//   String? id;
//   DateTime? date;
//   String? conract;
//   String? price;
//   String? quantity;

//   IntraDayTradeHistoryList({
//     this.id,
//     this.date,
//     this.conract,
//     this.price,
//     this.quantity,
//   });

//   factory IntraDayTradeHistoryList.fromJson(Map<String, dynamic> json) =>
//       IntraDayTradeHistoryList(
//         id: json["id"],
//         date: DateTime.parse(json["date"]),
//         conract: json["conract"],
//         price: json["price"],
//         quantity: json["quantity"],
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "date": date?.toIso8601String(),
//         "conract": conract,
//         "price": price,
//         "quantity": quantity,
//       };
// }

// class Statistics {
//   DateTime? date;
//   String? priceWeightedAverage;
//   String? priceMin;
//   String? priceMax;
//   String? quantityMin;
//   String? quantityMax;
//   String? quantitySum;

//   Statistics({
//     this.date,
//     this.priceWeightedAverage,
//     this.priceMin,
//     this.priceMax,
//     this.quantityMin,
//     this.quantityMax,
//     this.quantitySum,
//   });

//   factory Statistics.fromJson(Map<String, dynamic> json) => Statistics(
//         date: DateTime.parse(json["date"]),
//         priceWeightedAverage: json["priceWeightedAverage"],
//         priceMin: json["priceMin"],
//         priceMax: json["priceMax"],
//         quantityMin: json["quantityMin"],
//         quantityMax: json["quantityMax"],
//         quantitySum: json["quantitySum"],
//       );

//   Map<String, dynamic> toJson() => {
//         "date": date?.toIso8601String(),
//         "priceWeightedAverage": priceWeightedAverage,
//         "priceMin": priceMin,
//         "priceMax": priceMax,
//         "quantityMin": quantityMin,
//         "quantityMax": quantityMax,
//         "quantitySum": quantitySum,
//       };
// }
