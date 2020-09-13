import 'package:flutter/material.dart';
import 'package:pract_previa/secondpage.dart';
import 'package:pract_previa/thirdpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarea 1',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textoPalabra = TextEditingController();
  var _datosPagina2 = "";
  var _datosPagina3 = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Tarea 1"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Text(
                'BIENVENIDOS',
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontFamily: "Pacifico"),
              ),
              Image.network(
                "https://raw.githubusercontent.com/kevmoo/dart_side/master/Dash%20Dart%20PNG%20%20-%20white.png",
              ),
              SizedBox(
                height: 48.0,
              ),
              Text(
                'Seleccione la accion a realizar',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Expanded(
                child: SizedBox(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Pagina 2",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Titulo"),
                            content: TextField(
                              controller: _textoPalabra,
                              decoration: InputDecoration(
                                hintText: "Ingrese palabra",
                              ),
                              maxLength: 10,
                            ),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("Cerrar"),
                              ),
                              FlatButton(
                                onPressed: () async {
                                  final String resultado = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => SecondPage(
                                        palabra: _textoPalabra.text,
                                      ),
                                    ),
                                  ) as String;
                                  Navigator.of(context).pop();
                                  setState(() {
                                    _datosPagina2 = resultado;
                                  });
                                },
                                child: Text("Aceptar"),
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Pagina 3",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () async {
                      final String resultado = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => ThirdPage(),
                        ),
                      ) as String;
                      setState(() {
                        _datosPagina3 = resultado;
                      });
                    },
                  ),
                ],
              ),
              Expanded(
                child: SizedBox(),
              ),
              Text("Pg 2 => $_datosPagina2"),
              Expanded(
                child: SizedBox(),
              ),
              Text("Pg 3 => $_datosPagina3"),
              Expanded(
                child: SizedBox(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
