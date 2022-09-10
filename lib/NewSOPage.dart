import 'package:flutter/material.dart';

import 'NavBar.dart';

class NewSOPage extends StatefulWidget {
  @override
  _NewSOPageState createState() => _NewSOPageState();
}

class _NewSOPageState extends State<NewSOPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Ordem de Serviço'),
      ),
      drawer: NavBar(),
      body: Center(
        child: Container(
          height: 80,
          width: 150,
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: FlatButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'Welcome',
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        ),
      ),
    );
  }
}
