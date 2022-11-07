import 'package:fixit/models/ordemServico.dart';
import 'package:fixit/models_view/ordemServico_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ModifyOS extends StatelessWidget {
  ModifyOS({
    Key? key,
  }) : super(key: key);

  ordemServico_store ordemServicoStore = ordemServico_store();

  @override
  Widget build(BuildContext context) {
    Future<void> createOSPage(context, ordemServicoStore) async {
      // String _selectedValue;
      ordemServico os = ordemServico();
      List<String> listOfValue = ['Pendente', 'Fechado'];

      // final nomeCliente = TextEditingController();
      // final produto = TextEditingController();
      // String status = os.status;
      return showDialog<void>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              scrollable: true,
              title: Text('Criar OS'),
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
                          os.setNomeCliente(value);
                        },
                        initialValue: os.nomeCliente,
                        //controller: nomeCliente,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Produto',
                          hintText: 'Digite qual o produto com problema',
                        ),
                        onChanged: (value) {
                          os.setProduto(value);
                        },
                        initialValue: os.produto,
                        //controller: produto,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Descrição',
                          hintText: 'Digite do problema',
                        ),
                        onChanged: (value) {
                          os.setDescricao(value);
                        },
                        initialValue: os.descricao,
                        //controller: produto,
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: 'Observação',
                          hintText: 'Alguma observação sobre o aparelho?',
                        ),
                        onChanged: (value) {
                          os.setObservacao(value);
                        },
                        initialValue: os.observacao,
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
                      ordemServico novaOrdemServico = ordemServico(
                          nomeCliente: os.nomeCliente,
                          produto: os.produto,
                          status: "Pendente",
                          descricao: os.descricao,
                          observacao: os.observacao,
                          id: os.id);
                      //os.setNomeCliente(novaOrdemServico.nomeCliente);
                      print(novaOrdemServico.nomeCliente);
                      print(novaOrdemServico.produto);
                      print(novaOrdemServico.status);
                      print(novaOrdemServico.descricao);
                      print(novaOrdemServico.observacao);
                      print(novaOrdemServico.id);
                      ordemServicoStore.salvarOrdemServico(novaOrdemServico);
                      Navigator.of(context).pop();
                    })
              ],
            );
          });
    }

    return Scaffold(
      body: Observer(
        builder: (_) {
          if (ordemServicoStore.isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
            itemCount: ordemServicoStore.listaDeOrdemServico.length,
            itemBuilder: (context, index) {
              final os = ordemServicoStore.listaDeOrdemServico[index];
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
                        if (os.status == "Pendente") ...[
                          _card(os, ordemServicoStore, context)
                        ] else if (os.status == "Fechado") ...[
                          _closedCard(os, context, ordemServicoStore)
                        ]
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
          createOSPage(context, ordemServicoStore);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  _card(os, ordemServicoStore, context) {
    return GestureDetector(
      // CRIAR AQUI O BOTÃO PARA ABRIR DETALHES DA OS
      // EXEMPLO PARA NAVEGAR:
      //onTap: () => Navigator.pushNamed(context, '/HomePage'),
      onTap: () => Navigator.pushNamed(context, '/FindResultPage', arguments: {
        'nomeCliente': os.nomeCliente,
      }),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.orange[200],
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.laptop_mac, size: 60),
              title: Text("Cliente: " + os.nomeCliente,
                  style: TextStyle(fontSize: 20.0)),
              subtitle: Text("Aparelho: " + os.produto,
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
                    modifyOSPage(os, context, ordemServicoStore);
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.delete),
                  onPressed: () async {
                    ordemServicoStore.excluirOrdemServico(os);
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

  _closedCard(os, context, ordemServicoStore) {
    return GestureDetector(
      // CRIAR AQUI O BOTÃO PARA ABRIR DETALHES DA OS
      // EXEMPLO PARA NAVEGAR:
      //onTap: () => Navigator.pushNamed(context, '/HomePage'),
      onTap: () => Navigator.pushNamed(context, '/FindResultPage', arguments: {
        'nomeCliente': os.nomeCliente,
      }),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.blue[200],
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.laptop_mac, size: 60),
              title: Text("Cliente: " + os.nomeCliente,
                  style: TextStyle(fontSize: 20.0)),
              subtitle: Text("Aparelho: " + os.produto,
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
                    modifyOSPage(os, context, ordemServicoStore);
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.delete),
                  onPressed: () async {
                    ordemServicoStore.excluirOrdemServico(os);
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

  Future<void> modifyOSPage(os, context, ordemServicoStore) async {
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
            title: Text('Editar OS'),
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
                        os.setNomeCliente(value);
                      },
                      initialValue: os.nomeCliente,
                      //controller: nomeCliente,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Produto',
                      ),
                      onChanged: (value) {
                        os.setProduto(value);
                      },
                      initialValue: os.produto,
                      //controller: produto,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Status',
                      ),
                      value: os.status,
                      items: listOfValue.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        os.setStatus(value);
                      },
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
                    ordemServico novaOrdemServico = ordemServico(
                        nomeCliente: os.nomeCliente,
                        produto: os.produto,
                        status: os.status,
                        descricao: os.descricao,
                        observacao: os.observacao,
                        id: os.id);
                    //os.setNomeCliente(novaOrdemServico.nomeCliente);
                    print(novaOrdemServico.nomeCliente);
                    print(novaOrdemServico.produto);
                    print(novaOrdemServico.status);
                    print(novaOrdemServico.descricao);
                    print(novaOrdemServico.observacao);
                    print(novaOrdemServico.id);
                    ordemServicoStore.atualizarOrdemServico(novaOrdemServico);
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
