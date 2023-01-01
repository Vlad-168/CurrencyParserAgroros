import 'dart:async';
import 'dart:convert';

import 'package:draw_graph/draw_graph.dart';
import 'package:draw_graph/models/feature.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

Future<AgrorosModel> fetchAlbum() async {
  final response = await http
      .get(Uri.parse('https://www3.agroros.ru/include/currency.php'));

  if (response.statusCode == 200) {
    return AgrorosModel.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class AgrorosModel {
  Default? defaultt;
  Default? online;
  Offices? offices;

  AgrorosModel({this.defaultt, this.online, this.offices});

  AgrorosModel.fromJson(Map<String, dynamic> json) {
    defaultt = json['default'] != null ? Default.fromJson(json['default']) : null;
    online = json['online'] != null ? Default.fromJson(json['online']) : null;
    offices = json['offices'] != null ? Offices.fromJson(json['offices']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (defaultt != null) {
      data['default'] = defaultt!.toJson();
    }
    if (online != null) {
    data['online'] = online!.toJson();
    }
    if (offices != null) {
    data['offices'] = offices!.toJson();
    }
    return data;
  }
}

class Default {
  Currency? usd;
  Currency? eur;

  Default({this.usd, this.eur});

  Default.fromJson(Map<String, dynamic> json) {
    usd = json['usd'] != null ? Currency.fromJson(json['usd']) : null;
    eur = json['eur'] != null ? Currency.fromJson(json['eur']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (usd != null) {
      data['usd'] = usd!.toJson();
    }
    if (eur != null) {
      data['eur'] = eur!.toJson();
    }
    return data;
  }
}

class Currency {
  String? code;
  String? amount;
  String? buy;
  String? sale;

  Currency({this.code, this.amount, this.buy, this.sale});

  Currency.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    amount = json['amount'];
    buy = json['buy'];
    sale = json['sale'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['amount'] = amount;
    data['buy'] = buy;
    data['sale'] = sale;
    return data;
  }
}

class Offices {
  Office? balakovo;
  Office? volgograd;
  Office? voronej;
  Office? ijevsk;
  Office? kaliningrad;
  Office? moscow;
  Office? moscowKr;
  Office? penza;
  Office? ryazan;
  Office? peterburg;
  Office? peterburgSz;
  Office? saratov;
  Office? tambov;
  Office? tolyatty;
  Office? ulyanovsk;
  Office? engels;

  Offices({this.balakovo, this.volgograd, this.voronej, this.ijevsk, this.kaliningrad, this.moscow, this.moscowKr, this.penza, this.ryazan, this.peterburg, this.peterburgSz, this.saratov, this.tambov, this.tolyatty, this.ulyanovsk, this.engels});

  Offices.fromJson(Map<String, dynamic> json) {
    balakovo = json['balakovo'] != null ? Office.fromJson(json['balakovo']) : null;
    volgograd = json['volgograd'] != null ? Office.fromJson(json['volgograd']) : null;
    voronej = json['voronej'] != null ? Office.fromJson(json['voronej']) : null;
    ijevsk = json['ijevsk'] != null ? Office.fromJson(json['ijevsk']) : null;
    kaliningrad = json['kaliningrad'] != null ? Office.fromJson(json['kaliningrad']) : null;
    moscow = json['moscow'] != null ? Office.fromJson(json['moscow']) : null;
    moscowKr = json['moscow_kr'] != null ? Office.fromJson(json['moscow_kr']) : null;
    penza = json['penza'] != null ? Office.fromJson(json['penza']) : null;
    ryazan = json['ryazan'] != null ? Office.fromJson(json['ryazan']) : null;
    peterburg = json['peterburg'] != null ? Office.fromJson(json['peterburg']) : null;
    peterburgSz = json['peterburg_sz'] != null ? Office.fromJson(json['peterburg_sz']) : null;
    saratov = json['saratov'] != null ? Office.fromJson(json['saratov']) : null;
    tambov = json['tambov'] != null ? Office.fromJson(json['tambov']) : null;
    tolyatty = json['tolyatty'] != null ? Office.fromJson(json['tolyatty']) : null;
    ulyanovsk = json['ulyanovsk'] != null ? Office.fromJson(json['ulyanovsk']) : null;
    engels = json['engels'] != null ? Office.fromJson(json['engels']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (balakovo != null) {
      data['balakovo'] = balakovo!.toJson();
    }
    if (volgograd != null) {
      data['volgograd'] = volgograd!.toJson();
    }
    if (voronej != null) {
      data['voronej'] = voronej!.toJson();
    }
    if (ijevsk != null) {
      data['ijevsk'] = ijevsk!.toJson();
    }
    if (kaliningrad != null) {
      data['kaliningrad'] = kaliningrad!.toJson();
    }
    if (moscow != null) {
      data['moscow'] = moscow!.toJson();
    }
    if (moscowKr != null) {
      data['moscow_kr'] = moscowKr!.toJson();
    }
    if (penza != null) {
      data['penza'] = penza!.toJson();
    }
    if (ryazan != null) {
      data['ryazan'] = ryazan!.toJson();
    }
    if (peterburg != null) {
      data['peterburg'] = peterburg!.toJson();
    }
    if (peterburgSz != null) {
      data['peterburg_sz'] = peterburgSz!.toJson();
    }
    if (saratov != null) {
      data['saratov'] = saratov!.toJson();
    }
    if (tambov != null) {
      data['tambov'] = tambov!.toJson();
    }
    if (tolyatty != null) {
      data['tolyatty'] = tolyatty!.toJson();
    }
    if (ulyanovsk != null) {
      data['ulyanovsk'] = ulyanovsk!.toJson();
    }
    if (engels != null) {
      data['engels'] = engels!.toJson();
    }
    return data;
  }
}

class Office {
  String? name;
  Default? currencies;

  Office({this.name, this.currencies});

  Office.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    currencies = json['currencies'] != null ? Default.fromJson(json['currencies']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (currencies != null) {
      data['currencies'] = currencies!.toJson();
    }
    return data;
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<AgrorosModel> futureAlbum;
  String timeOfLatsUpdate= "";
  final String EUR_KEY = "eur";
  final String USD_KEY = "usd";
  final String EUR_STRING = "EUR (€)";
  final String USD_STRING = "USD (\$)";


  final List<Feature> features = [
    Feature(
      title: "EUR (€)",
      color: Colors.green,
      data: [0.6, 0.6, 0.6],
    ),
    Feature(
      title: "USD (\$)",
      color: Colors.orange,
      data: [0.6, 0.6, 0.6],
    )
  ];

  @override
  void initState() {
    futureAlbum = fetchAlbum();
    timeOfLatsUpdate = formatTime(DateTime.now());
    Timer.periodic(const Duration(seconds: 30), (timer) {
      timeOfLatsUpdate = formatTime(DateTime.now());  //get current date and time
      futureAlbum = fetchAlbum();
      setState(() {

      });
    });
    super.initState();
  }

  String formatTime(DateTime dateTime) {
    return "${dateTime.day.toString()}.${dateTime.month.toString()}.${dateTime.year.toString()} ${dateTime.hour.toString()}:${dateTime.minute.toString()}:${dateTime.second.toString()}";
  }

  Future<void> saveCurrency(String key, List<String> currencyList) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(key, currencyList);
  }

  Future<List<String>?> readCurrency(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final stringList = prefs.getStringList(key);
    return stringList;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Агророс банк',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Агророс банк',
            textAlign: TextAlign.center,),
        ),
        body: buildDataWidget(),
      ),
    );
  }

  Widget buildDataWidget() {
    Widget dataWidget = Column(
      children: [
        Text(
            "$timeOfLatsUpdate\n",
            style: const TextStyle(fontSize: 20)
        ),
        Text(EUR_STRING, style: const TextStyle(fontSize: 28)),
        FutureBuilder<AgrorosModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.offices != null) {
              var officies = snapshot.data!.offices;
              if (officies != null) {
                var buyEur = officies.moscow!.currencies!.eur!.buy.toString();
                var saleEur = officies.moscow!.currencies!.eur!.sale.toString();
                if (buyEur == "" || saleEur == "") {
                  buyEur = "--";
                  saleEur = "--";
                } else {
                  readAndSave(EUR_KEY, buyEur, saleEur);
                }
                return Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth> {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  children: <TableRow> [
                    const TableRow(
                        children: [
                          Text(
                            "Покупка",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Продажа",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          )
                        ]
                    ),
                    TableRow(
                      children: [
                        Text(
                          buyEur,
                          style: const TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,),
                        Text(
                          saleEur,
                          style: const TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
        const Divider(),
        Text(USD_STRING, style: const TextStyle(fontSize: 28)),
        FutureBuilder<AgrorosModel>(
          future: futureAlbum,
          builder: (context, snapshot) {
            if (snapshot.hasData && snapshot.data!.offices != null) {
              var officies = snapshot.data!.offices;
              if (officies != null) {
                var buyUsd = officies.moscow!.currencies!.usd!.buy.toString();
                var saleUsd = officies.moscow!.currencies!.usd!.sale.toString();
                if (buyUsd == "" || saleUsd == "") {
                  buyUsd = "--";
                  saleUsd = "--";
                } else {
                  //get data
                  readAndSave(USD_KEY, buyUsd, saleUsd);
                }
                return Table(
                  border: TableBorder.all(),
                  columnWidths: const <int, TableColumnWidth> {
                    0: FlexColumnWidth(),
                    1: FlexColumnWidth(),
                  },
                  children: <TableRow> [
                    const TableRow(
                        children: [
                          Text(
                            "Покупка",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "Продажа",
                            style: TextStyle(fontSize: 22),
                            textAlign: TextAlign.center,
                          )
                        ]
                    ),
                    TableRow(
                      children: [
                        Text(
                          buyUsd,
                          style: const TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,),
                        Text(
                          saleUsd,
                          style: const TextStyle(fontSize: 22),
                          textAlign: TextAlign.center,),
                      ],
                    ),
                  ],
                );
              }
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
        const Divider(),
        const Text("Продажа", style: TextStyle(fontSize: 28)),
        LineGraph(
          features: features,
          size: const Size(350, 320),
          labelX: const ['', '', '', '', '', ''],
          labelY: const ['40.0', '45.0', '50.0', '70.0', '75.0', '85.0'],
          showDescription: true,
          graphOpacity: 0.5,
          graphColor: Colors.black87,
        ),
      ],
    );
    return dataWidget;
  }

  void readAndSave(String key, String buy, String sale) async {
    List<String>? savedCurrencies = await readCurrency(key);
    savedCurrencies ??= [];
    savedCurrencies.add("$buy,$sale");
    saveCurrency(key, savedCurrencies);
    int index = 0;
    if (key == USD_KEY) {
      index = 1;
    }
    if (key == EUR_KEY) {
      index = 0;
    }
    List<double> data = features[index].data;
    if (data.length >= 10) {
      data.removeRange(0, data.length - 9);
    }
    data.add((double.parse(sale)/100));
  }
}