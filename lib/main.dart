import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MaterialApp(
    theme: new ThemeData(
      primarySwatch: Colors.teal,
    ),
    home: new Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stock Market App'),
      ),
      body: Container(
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString('Json/stock_market_data.json'),
            builder: (context, snapshot) {
              //Decode Json
              var myData = json.decode(snapshot.data.toString());

              return ListView.builder(
                itemBuilder: (BuildContext context, int index) {
                  return new Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text('Date: ' + myData[index]['date']),
                        Text('Trade Code: ' + myData[index]['trade_code']),
                        Text('High: ' + myData[index]['high']),
                        Text('Low: ' + myData[index]['low']),
                        Text('Open: ' + myData[index]['open']),
                        Text('Close: ' + myData[index]['close']),
                        Text('Volume: ' + myData[index]['volume']),
                      ],
                    ),
                  );
                },
                itemCount: myData == null ? 0 : myData.length,
              );
            }),
      ),
    );
  }
}
