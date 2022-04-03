// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:smartpulse_teknik_test/Constand/constand.dart';
import 'package:smartpulse_teknik_test/Constand/styles.dart';
import 'package:smartpulse_teknik_test/Model/productPh.dart';
import 'package:smartpulse_teknik_test/Viewmodel/Provider/home.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<HomeProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            physics: ScrollPhysics(),
            child: buildBodyColumn(context, provider)),
      ),
    );
  }

  Widget buildBodyColumn(BuildContext context, HomeProvider provider) {
    switch (provider.pageState) {
      case PageState.LOADING:
        {
          return Center(
              child: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: CircularProgressIndicator(),
          ));
        }
      case PageState.SUCCES:
        {
          return Column(
            children: [
              buildHeader(context, provider),
              buildBody(context, provider),
            ],
          );
        }
      case PageState.ERROR:
        {
          return Center(
            child: Text("Bir hata oluştu"),
          );
        }

      default:
        {
          return Container();
        }
    }
  }

  Widget buildBody(BuildContext context, HomeProvider provider) {
    final f = NumberFormat("###,###.###", "tr_TR");
    return Center(
      child: ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 24,
        itemBuilder: (BuildContext context, int index) {
          String date = index < 10
              ? "${Constand.formattedDate2} 0$index:00"
              : "${Constand.formattedDate2} $index:00";
          String contractIndex = index < 10
              ? "${Constand.concract}0$index"
              : "${Constand.concract}$index";
          ProductPh product = provider.getProduct(contractIndex);
          return Container(
            padding:
                EdgeInsets.only(top: 10.0, bottom: 10.0, left: 2.0, right: 10),
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
            width: MediaQuery.of(context).size.width * 0.7,
            decoration: BoxDecoration(border: Border.all(width: 1.0)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.16,
                  child: Text(date, style: Styles.textStyle),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.20,
                  child: Text(
                      f.format(num.parse(
                          product.transactionQuantity.toStringAsFixed(2))),
                      style: Styles.textStyle),
                ),
                Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width * 0.19,
                  child: Text(
                      f.format(num.parse(
                          product.transactionAmount.toStringAsFixed(2))),
                      style: Styles.textStyle),
                ),
                Container(
                    alignment: Alignment.centerRight,
                    width: MediaQuery.of(context).size.width * 0.19,
                    child: Text(
                        f.format(
                            num.parse(product.avgAmont.toStringAsFixed(2))),
                        style: Styles.textStyle)),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildHeader(BuildContext context, HomeProvider provider) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            child: Text("Tarih", style: Styles.headerStyle),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            child:
                Text("Toplam İşlem Miktarı (MWh)", style: Styles.headerStyle),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.18,
            child: Text("Toplam İşlem Tutarı (TL)", style: Styles.headerStyle),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.20,
            child: Text("Ağırlık Ortalama Fiyat (TL/MWh)",
                style: Styles.headerStyle),
          ),
        ],
      ),
    );
  }

  Widget buildCircilarProcesIndicator(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
