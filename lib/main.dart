// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smartpulse_teknik_test/View/Pages/home.dart';
import 'package:smartpulse_teknik_test/Viewmodel/Provider/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(),
        )
      ],
      child: MaterialApp(
        title: 'Material App',
        home: HomePage(),
      ),
    );
  }
}
