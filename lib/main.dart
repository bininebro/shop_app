import 'package:flutter/material.dart';

import 'pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Two Page App',
      theme: ThemeData(
        fontFamily: 'NotoSansKR',
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
