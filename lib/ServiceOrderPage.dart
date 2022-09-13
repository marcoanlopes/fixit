import 'package:flutter/material.dart';

import 'NavBar.dart';
import 'BottomNavBar.dart';

class ServiceOrderPage extends StatefulWidget {
  @override
  _ServiceOrderPageState createState() => _ServiceOrderPageState();
}

class _ServiceOrderPageState extends State<ServiceOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ordem de Serviço'),
      ),
      // drawer: NavBar(),
      body: BottomNavBar(),
    );
  }
}
