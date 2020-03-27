import 'dart:convert';
import 'package:currency/home/BottomConverter.dart';
import 'package:currency/home/TopConverter.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CurrencyConverter extends StatefulWidget {
  static final String apiKey = 'bd91d430ec95532be95bc2d477c9614f';

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final urlSymbols =
      'http://data.fixer.io/api/symbols?access_key=${CurrencyConverter.apiKey}';

  List<String> symbols;
  int activeFrom, activeTo;
  double amount;
  bool changing;

  @override
  void initState() {
    super.initState();
    symbols = List();
    activeFrom = activeTo = -1;
    amount = 0;
    getDataSymbols();
  }

  Future getDataSymbols() async {
    var response = await http.get(urlSymbols);
    Map<String, dynamic> symbolsData = jsonDecode(response.body);
    Map<String, dynamic> symbolsMap = symbolsData['symbols'];
    setState(() {
      symbolsMap.forEach((k, v) {
        symbols.add(k.toString());
      });
      for (int i = 0; i < symbols.length; i++) {
        if (symbols[i] == 'JOD') {
          activeFrom = i;
        }
        if (symbols[i] == 'USD') {
          activeTo = i;
        }
      }
      changing = false;
    });
    getNewData();
  }

  change(int pos, int index) {
    setState(() {
      if (pos == 1) {
        activeFrom = index;
      } else {
        activeTo = index;
      }
      changing = false;
    });
    getNewData();
  }

  Future getNewData() async {
    // final url =
    //     'http://data.fixer.io/api/latest?access_key=${CurrencyConverter.apiKey}&base=${symbols[activeFrom]}&symbols=${symbols[activeTo]}';
    // var response = await http.get(url);
    // Map<String, dynamic> rateData = jsonDecode(response.body);
    // double rate = rateData['rates'][symbols[activeTo]];
    // print(rate);
  }

  activate() {
    setState(() {
      changing = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    final data = MediaQuery.of(context);
    if (activeFrom == -1) {
      return Container();
    }
    return Container(
      height: data.size.height * 0.5,
      width: data.size.width * 0.8,
      child: Stack(
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TopConverter(
                currencies: symbols,
                active: activeFrom,
                change: change,
                changing: changing,
                activate: activate,
                from: symbols[activeFrom],
                to: symbols[activeTo],
              ),
              BottomConverter(
                currencies: symbols,
                active: activeTo,
                change: change,
                changing: changing,
                activate: activate,
                from: symbols[activeFrom],
                to: symbols[activeTo],
              ),
            ],
          ),
          Center(
            child: AnimatedContainer(
              height: (changing ? 0.0 : data.size.width * 0.15),
              width: (changing ? 0.0 : data.size.width * 0.15),
              duration: const Duration(milliseconds: 200),
              child: Center(
                child: Image.asset(
                  'images/convert.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
