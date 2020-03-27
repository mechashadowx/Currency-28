import 'package:currency/home/CurrencyConverter.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Color(0xFF210F3F),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              height: data.size.height * 0.25,
              child: Center(
                child: Text(
                  'Currency Converter',
                  style: TextStyle(
                    color: Color(0xFFF4F0F5),
                    fontSize: data.size.width * 0.12,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            CurrencyConverter(),
            SizedBox(
              height: data.size.height * 0.25,
            ),
          ],
        ),
      ),
    );
  }
}
