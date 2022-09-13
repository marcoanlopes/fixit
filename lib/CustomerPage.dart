import 'package:fixit/BottomCustomerNavBar.dart';
import 'package:flutter/material.dart';

class CustomerPage extends StatefulWidget {
  @override
  _CustomerPageState createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Clientes'),
      ),
      body: BottomCustomerNavBar(),
      // body: BottomNavBar(),
    );
  }
}
