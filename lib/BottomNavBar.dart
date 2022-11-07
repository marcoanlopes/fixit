import 'package:fixit/FindOS.dart';
import 'package:flutter/material.dart';

import 'ModifyOS.dart';
import 'models_view/ordemServico_store.dart';

class BottomNavBar extends StatefulWidget {
  BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  ordemServico_store ordemServicoStore = ordemServico_store();

  static List<Widget> _pages = <Widget>[
    //CreateOS(),
    FindOS(),
    ModifyOS(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.create),
          //   label: 'Criar OS',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Procurar OS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_rounded),
            label: 'Listar OS',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
