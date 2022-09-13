import 'package:flutter/material.dart';

class BottomCustomerNavBar extends StatefulWidget {
  const BottomCustomerNavBar({Key? key}) : super(key: key);

  @override
  _BottomCustomerNavBarState createState() => _BottomCustomerNavBarState();
}

class _BottomCustomerNavBarState extends State<BottomCustomerNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    CreateOS(),
    Icon(
      Icons.search_outlined,
      size: 150,
    ),
    Icon(
      Icons.note_alt_rounded,
      size: 150,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Criar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_rounded),
            label: 'Modificar ',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class CreateOS extends StatelessWidget {
  const CreateOS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: [
          Text(
            "Criar Cliente",
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
