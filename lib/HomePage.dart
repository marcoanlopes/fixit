import 'package:flutter/material.dart';

import 'NavBar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Página Inicial'),
      ),
      drawer: NavBar(),
      body: _body(),
      // body: BottomNavBar(),
    );
  }
}

_body() {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Card(
              color: Colors.green[400],
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    // Image.network(
                    //     "https://flutter.io/images/catalog-widget-placeholder.png"),
                    Divider(),
                    Text('card 1')
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.orange[400],
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[Divider(), Text('card 2')],
                ),
              ),
            ),
            Card(
              color: Colors.blueGrey[400],
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text("card 3"),
                    Divider(),
                    Text('after divider'),
                    ButtonBar(
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                            'Detalhes',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Card(
              color: Colors.yellow[400],
              child: Container(
                padding: EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    // Image.network(
                    //     "https://flutter.io/images/catalog-widget-placeholder.png"),
                    Divider(),
                    Text('card 4')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
