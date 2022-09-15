import 'package:flutter/material.dart';

class BottomCustomerNavBar extends StatefulWidget {
  const BottomCustomerNavBar({Key? key}) : super(key: key);

  @override
  _BottomCustomerNavBarState createState() => _BottomCustomerNavBarState();
}

class _BottomCustomerNavBarState extends State<BottomCustomerNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    CreateCustomer(),
    SearchCustomer(),
    ListCustomer(),
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

class CreateCustomer extends StatelessWidget {
  const CreateCustomer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Text(
            "Criar Cliente",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome',
                hintText: 'Digite o nome do cliente'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Sobrenome',
                hintText: 'Digite o sobrenome do cliente'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Telefone',
                hintText: 'Digite o telefone do cliente'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Endereço',
                hintText: 'Digite o endereço do cliente'),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 50,
                width: 123,
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
                    children: const [Icon(Icons.add), Text('Criar Cliente')],
                  ),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }
}

class SearchCustomer extends StatelessWidget {
  const SearchCustomer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
            child: Text(
              "Encontrar Cliente",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Procurar...',
                  hintText: 'Digite o nome do cliente procurado'),
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

class ListCustomer extends StatelessWidget {
  const ListCustomer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Lista de Clientes",
                      style: TextStyle(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  card(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

card() {
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
          leading: Icon(Icons.person, size: 60),
          title: Text('João da Silva Sauro', style: TextStyle(fontSize: 20.0)),
          subtitle:
              Text('Cliente desde 08/22', style: TextStyle(fontSize: 14.0)),
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
              child: const Text('Modificar'),
              onPressed: () {/* ... */},
            ),
          ],
        ),
      ],
    ),
  );
}
