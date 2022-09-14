import 'package:flutter/material.dart';

class BranchPage extends StatefulWidget {
  @override
  _BranchPageState createState() => _BranchPageState();
}

class _BranchPageState extends State<BranchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Filial'),
      ),
      body: _body(context),
      // body: BottomNavBar(),
    );
  }
}

_body(context) {
  return SingleChildScrollView(
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 90.0, horizontal: 10.0),
      child: Center(
        child: Column(
          children: <Widget>[
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, '/HomePage'),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                color: Colors.green[400],
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                  child: Column(
                    children: <Widget>[
                      // Image.network(
                      //     "https://flutter.io/images/catalog-widget-placeholder.png"),
                      ButtonBar(
                        alignment: MainAxisAlignment.center,
                        children: <Widget>[
                          TextButton(
                            child: const Text(
                              'Branch: FixIT - 1',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 26.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.pushNamed(context, '/HomePage');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Colors.orange[400],
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 60),
                child: Column(
                  children: <Widget>[
                    // Image.network(
                    //     "https://flutter.io/images/catalog-widget-placeholder.png"),
                    ButtonBar(
                      alignment: MainAxisAlignment.center,
                      children: <Widget>[
                        TextButton(
                          child: const Text(
                            'Branch: FixIT - 2',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.0,
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
          ],
        ),
      ),
    ),
  );
}
