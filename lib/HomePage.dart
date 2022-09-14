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
        title: Text('FixIT'),
      ),
      drawer: NavBar(),
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
            buildCardPendingOS(context),
            buildCardFixedOS(context),
            // buildCardNote(),
            // buildCard(),
            // buildCard(),
            // buildCard(),
            // buildCard(),
            // buildCard(),
          ],
        )),
  );
}

Card buildCardFixedOS(context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.lightGreen[200],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.check_circle_outlined, size: 60),
          title: Text('Listar consertos finalizados',
              style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Listar últimos consertos realizados',
              style: TextStyle(fontSize: 14.0)),
        ),
        Divider(
          color: Colors.black,
          height: 10,
          thickness: 0,
          indent: 20,
          endIndent: 20,
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
                child: const Text('Finalizados'),
                onPressed: () {
                  Navigator.pushNamed(context, '/FinishedServiceOrderPage');
                }),
          ],
        ),
      ],
    ),
  );
}

Card buildCardPendingOS(context) {
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
          leading: Icon(Icons.engineering_outlined, size: 60),
          title: Text('Listar consertos pendentes',
              style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Listar consertos pendentes de finalização',
              style: TextStyle(fontSize: 14.0)),
        ),
        Divider(
          color: Colors.black,
          height: 10,
          thickness: 0,
          indent: 20,
          endIndent: 20,
        ),
        ButtonBar(
          children: <Widget>[
            ElevatedButton(
                child: const Text('Pendentes'),
                onPressed: () {
                  Navigator.pushNamed(context, '/PendingServiceOrderPage');
                }),
          ],
        ),
      ],
    ),
  );
}





// _body(context) {
//   return SingleChildScrollView(
//     child: Container(
//       padding: EdgeInsets.all(10.0),
//       child: Center(
//         child: Column(
//           children: <Widget>[
//             Card(
//               color: Colors.green[400],
//               child: Container(
//                 padding: EdgeInsets.all(32.0),
//                 child: Column(
//                   children: <Widget>[
//                     // Image.network(
//                     //     "https://flutter.io/images/catalog-widget-placeholder.png"),
//                     Divider(),
//                     Text('card 1')
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: Colors.orange[400],
//               child: Container(
//                 padding: EdgeInsets.all(32.0),
//                 child: Column(
//                   children: <Widget>[Divider(), Text('card 2')],
//                 ),
//               ),
//             ),
//             Card(
//               color: Colors.blueGrey[400],
//               child: Container(
//                 padding: EdgeInsets.all(32.0),
//                 child: Column(
//                   children: <Widget>[
//                     Text("card 3"),
//                     Divider(),
//                     Text('after divider'),
//                     ButtonBar(
//                       children: <Widget>[
//                         TextButton(
//                           child: const Text(
//                             'Detalhes',
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16.0,
//                             ),
//                           ),
//                           onPressed: () {
//                             Navigator.pushNamed(
//                                 context, '/FinishedServiceOrderPage');
//                           },
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Card(
//               color: Colors.yellow[400],
//               child: Container(
//                 padding: EdgeInsets.all(32.0),
//                 child: Column(
//                   children: <Widget>[
//                     // Image.network(
//                     //     "https://flutter.io/images/catalog-widget-placeholder.png"),
//                     Divider(),
//                     Text('card 4')
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     ),
//   );
