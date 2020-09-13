import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {
  final String palabra;
  SecondPage({Key key, this.palabra}) : super(key: key);
  @override
  _SecondPageState createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  int _numeroRandom = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 2"),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: <Color>[
              Colors.blue,
              Colors.blue[100],
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Genere numero random',
                  style: TextStyle(
                    color: Colors.purple,
                    fontSize: 20.0,
                    fontFamily: "Source Sans Pro",
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "$_numeroRandom",
                  style: TextStyle(
                      color: Colors.red,
                      fontStyle: FontStyle.italic,
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold),
                ),
                RaisedButton(
                  child: Text("Generar"),
                  onPressed: () {
                    setState(() {
                      _numeroRandom = Random().nextInt(100);
                    });
                  },
                ),
                RaisedButton(
                  child: Text("Guardar"),
                  onPressed: () {
                    Navigator.pop(context, "${widget.palabra}$_numeroRandom");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
