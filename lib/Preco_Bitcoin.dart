import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:ui';
import 'dart:async';


class Preco_Bitcoin extends StatefulWidget {
  @override
  _Preco_BitcoinState createState() => _Preco_BitcoinState();
}

class _Preco_BitcoinState extends State<Preco_Bitcoin> {
  String _preco = "0";
  void _recuperarBitcoin() async {

  String url = "https://blockchain.info/ticker";

  http.Response response = await http.get(url);

  Map<String, dynamic> retorno = json.decode( response.body );
  setState((){
    _preco = retorno["BRL"]["buy"].toString();
  });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            Image.asset("images/bitcoin.png"),
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Text(
                    "R\$" + _preco,
                  style: TextStyle(
                    fontSize: 35
                  ),
                ),
              ),
              RaisedButton(
                child: Text(
                  "Atualizar",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white
                  ),
                ),
                color: Colors.orange,
                padding: EdgeInsets.fromLTRB(30, 15, 30, 15),
                onPressed: _recuperarBitcoin,
              )
            ],
          ),
      )
    );
  }
}
