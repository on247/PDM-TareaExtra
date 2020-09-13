import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  final String palabra;
  ThirdPage({Key key, this.palabra}) : super(key: key);
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina 3"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RaisedButton(
                    child: Text("Dato 1"),
                    onPressed: () {
                      Navigator.of(context).pop("Dato 1");
                    },
                  ),
                  RaisedButton(
                    child: Text("Dato 2"),
                    onPressed: () {
                      Navigator.of(context).pop("Dato 2");
                    },
                  ),
                  RaisedButton(
                    child: Text("Dato 3"),
                    onPressed: () {
                      Navigator.of(context).pop("Dato 3");
                    },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
