import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    CreateOS(),
    SearchOS(),
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
            label: 'Criar OS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Procurar OS',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_rounded),
            label: 'Modificar OS',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class SearchOS extends StatelessWidget {
  const SearchOS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Text("Encontrar Ordem de Serviço"),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Procurar...',
                  hintText: 'Digite o ID da OS'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              height: 50,
              width: 94,
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.lightBlue,
                  onSurface: Colors.grey,
                  animationDuration: Duration(seconds: 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                child: Row(
                  children: const [Icon(Icons.search), Text('Procurar')],
                ),
                onPressed: () {},
                // child: FloatingActionButton(
                //   tooltip: 'Search',
                //   onPressed: () {},
                //   child: Icon(
                //     Icons.search,
                //   ),
                // ),
              ),
            ),
          ),
        ],
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Text(
              "Criar Ordem de Serviço",
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
