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

class ModifyOS extends StatelessWidget {
  const ModifyOS({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Modificar Ordem de Serviço",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ),
              ),
              waitingCard(),
              buildCard(),
              _card(),
            ],
          ),
        ),
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
      child: ListView(children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 30),
          child: Text(
            "Criar Ordem de Serviço",
            style: TextStyle(fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do Cliente',
                hintText: 'Digite o nome do cliente'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Produto',
                hintText: 'Digite qual o produto com problema'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
                hintText: 'Digite do problema'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Observação',
                hintText: 'Digite se houver alguma observação'),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Container(
                height: 50,
                width: 74,
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
                    children: const [Icon(Icons.add), Text('Criar')],
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

_card() {
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
          leading: Icon(Icons.laptop_mac, size: 60),
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

buildCard() {
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
          leading: Icon(Icons.phone_android, size: 60),
          title: Text('Exemplo', style: TextStyle(fontSize: 20.0)),
          subtitle: Text('Aguardando conserto desde o dia dd/mm/aaaa',
              style: TextStyle(fontSize: 12.0)),
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

Card waitingCard() {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    color: Colors.red[300],
    elevation: 10,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        const ListTile(
          leading: Icon(Icons.phone_iphone, size: 60),
          title: Text('Exemplo', style: TextStyle(fontSize: 20.0)),
          subtitle:
              Text('Orçamento não realizado', style: TextStyle(fontSize: 14.0)),
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
