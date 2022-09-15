import 'package:flutter/material.dart';

class PendingServiceOrderPage extends StatefulWidget {
  @override
  _PendingServiceOrderPageState createState() =>
      _PendingServiceOrderPageState();
}

class _PendingServiceOrderPageState extends State<PendingServiceOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ordens de Serviço Pendentes'),
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
          ],
        )),
  );
}

Card buildCardPhone() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.orange[300],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          // leading: Icon(Icons.album, size: 60),
          leading: Icon(Icons.phone_android, size: 60),
          title: Text('iPhone X', style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Conserto pendente desde o dia 25/07/2022',
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
    color: Colors.orange[300],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.laptop, size: 60),
          title: Text('MacBook Air', style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Conserto Pendente desde o dia 23/08/2022',
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
    color: Colors.orange[300],
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
