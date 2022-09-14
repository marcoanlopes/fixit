import 'package:flutter/material.dart';

class FinishedServiceOrderPage extends StatefulWidget {
  @override
  _FinishedServiceOrderPageState createState() =>
      _FinishedServiceOrderPageState();
}

class _FinishedServiceOrderPageState extends State<FinishedServiceOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ordens de Serviço Finalizadas'),
      ),
      body: _body(context),
      // body: BottomNavBar(),
    );
  }
}

_body(context) {
  return Container(
    padding: EdgeInsets.all(16.0),
    child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            buildCardPhone(),
            buildCardNote(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
            buildCard(),
          ],
        )),
  );
}

Card buildCardPhone() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.green[200],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album, size: 60),
          title: Text('Samsung Galaxy S22', style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Conserto finalizado dia 22/08/2022',
              style: TextStyle(fontSize: 14.0)),
        ),
        Divider(
          color: Colors.black,
          height: 30,
          thickness: 0,
          indent: 20,
          endIndent: 20,
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Ir para OS'),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  );
}

Card buildCardNote() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.green[200],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album, size: 60),
          title: Text('Notebook Galaxy', style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Conserto finalizado dia 30/08/2022',
              style: TextStyle(fontSize: 14.0)),
        ),
        Divider(
          color: Colors.black,
          height: 30,
          thickness: 0,
          indent: 20,
          endIndent: 20,
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Ir para OS'),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  );
}

Card buildCard() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.green[200],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.album, size: 60),
          title: Text('Exemplo', style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Conserto finalizado dia dd/mm/aaaa',
              style: TextStyle(fontSize: 14.0)),
        ),
        Divider(
          color: Colors.black,
          height: 30,
          thickness: 0,
          indent: 20,
          endIndent: 20,
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
              child: const Text('Ir para OS'),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  );
}
