import 'package:fixit/models_view/Customer_Store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'models/Customer.dart';

class BottomCustomerNavBar extends StatefulWidget {
  const BottomCustomerNavBar({Key? key}) : super(key: key);

  @override
  _BottomCustomerNavBarState createState() => _BottomCustomerNavBarState();
}

class _BottomCustomerNavBarState extends State<BottomCustomerNavBar> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    // CreateCustomer(),
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
          // BottomNavigationBarItem(
          //   icon: Icon(Icons.create),
          //   label: 'Criar',
          // ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Procurar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.note_alt_rounded),
            label: 'Listar',
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
  ListCustomer({
    Key? key,
  }) : super(key: key);

  Customer_store customerStore = Customer_store();

  @override
  Widget build(BuildContext context) {
    Future<void> createCustomer(context, customerStore) async {
      // String _selectedValue;
      Customer customer = Customer();
      List<String> listOfValue = ['Pendente', 'Fechado'];

      // final nomeCliente = TextEditingController();
      // final produto = TextEditingController();
      // String status = customer.status;
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: true,
              title: Text('Criar Cliente'),
              content: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Name',
                        ),
                        onChanged: (value) {
                          customer.setNome(value);
                        },
                        initialValue: customer.nome,
                        //controller: nomeCliente,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Sobrenome',
                          hintText: 'Digite o sobrenome do cliente',
                        ),
                        onChanged: (value) {
                          customer.setSobrenome(value);
                        },
                        initialValue: customer.sobrenome,
                        //controller: produto,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Endereco',
                          hintText: 'Digite o endereco',
                        ),
                        onChanged: (value) {
                          customer.setEndereco(value);
                        },
                        initialValue: customer.endereco,
                        //controller: produto,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Telefone',
                          hintText: 'Digite o telefone',
                        ),
                        onChanged: (value) {
                          customer.setTelefone(value);
                        },
                        initialValue: customer.telefone,
                        //controller: produto,
                      ),

                      // TextFormField(
                      //   decoration: InputDecoration(
                      //     labelText: 'Status',
                      //   ),
                      //initialValue: varStatus,
                      // ),
                    ],
                  ),
                ),
              ),
              actions: [
                ElevatedButton(
                    child: Text("Submit"),
                    onPressed: () async {
                      Customer novoCliente = Customer(
                          nome: customer.nome,
                          sobrenome: customer.sobrenome,
                          endereco: customer.endereco,
                          telefone: customer.telefone,
                          id: customer.id);
                      //customer.setNomeCliente(novaOrdemServico.nomeCliente);
                      print(novoCliente.nome);
                      print(novoCliente.sobrenome);
                      print(novoCliente.telefone);
                      print(novoCliente.endereco);
                      print(novoCliente.id);
                      customerStore.salvarCustomer(novoCliente);
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
    }

    return Scaffold(
      body: Observer(
        builder: (_) {
          if (customerStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: customerStore.listaDeCustomer.length,
            itemBuilder: (context, index) {
              final customer = customerStore.listaDeCustomer[index];
              return Container(
                child: Padding(
                  padding: EdgeInsets.all(0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(5.0),
                        ),
                        _card(customer, customerStore, context)
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniStartFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          createCustomer(context, customerStore);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

_card(customer, customerStore, context) {
  return GestureDetector(
    // CRIAR AQUI O BOTÃO PARA ABRIR DETALHES DA OS
    // EXEMPLO PARA NAVEGAR:
    //onTap: () => Navigator.pushNamed(context, '/HomePage'),
    // onTap: () => Navigator.pushNamed(context, '/FindResultPage', arguments: {
    //   'nomeCliente': customer.nomeCliente,
    // }),
    child: Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: Colors.blue[800],
      elevation: 10,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person, size: 60),
            title: Text("Nome: " + customer.nome,
                style: TextStyle(fontSize: 20.0)),
            subtitle: Text("Sobrenome: " + customer.sobrenome,
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
                child: const Icon(Icons.edit),
                onPressed: () async {
                  modifyCustomerPage(customer, context, customerStore);
                },
              ),
              ElevatedButton(
                child: const Icon(Icons.delete),
                onPressed: () async {
                  customerStore.excluirCustomer(customer);
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.red, // background
                  onPrimary: Colors.white, // foreground
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Future<void> modifyCustomerPage(customer, context, customerStore) async {
  // String _selectedValue;
  List<String> listOfValue = ['Pendente', 'Fechado'];

  // final nomeCliente = TextEditingController();
  // final produto = TextEditingController();
  // String status = os.status;
  return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          scrollable: true,
          title: Text('Editar Cliente'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                    onChanged: (value) {
                      customer.setNome(value);
                    },
                    initialValue: customer.nome,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Sobrenome',
                    ),
                    onChanged: (value) {
                      customer.setSobrenome(value);
                    },
                    initialValue: customer.sobrenome,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Telefone',
                    ),
                    onChanged: (value) {
                      customer.setTelfone(value);
                    },
                    initialValue: customer.telefone,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Endereço',
                    ),
                    onChanged: (value) {
                      customer.setEndereco(value);
                    },
                    initialValue: customer.endereco,
                    //controller: produto,
                  ),
                ],
              ),
            ),
          ),
          actions: [
            ElevatedButton(
                child: Text("Submit"),
                onPressed: () async {
                  Customer newCustomer = Customer(
                      nome: customer.nome,
                      sobrenome: customer.sobrenome,
                      telefone: customer.telefone,
                      endereco: customer.endereco,
                      id: customer.id);

                  //os.setNomeCliente(novaOrdemServico.nomeCliente);
                  print(newCustomer.nome);
                  print(newCustomer.sobrenome);
                  print(newCustomer.telefone);
                  print(newCustomer.endereco);
                  print(newCustomer.id);
                  customerStore.atualizarOrdemServico(newCustomer);
                  Navigator.of(context).pop();
                })
          ],
        );
      });
}
