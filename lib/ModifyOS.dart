import 'package:fixit/models/ordemServico.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class ModifyOS extends StatefulWidget {
  const ModifyOS({
    Key? key,
  }) : super(key: key);
  @override
  _ModifyOSState createState() => _ModifyOSState();
}

class _ModifyOSState extends State<ModifyOS> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.fromLTRB(17.0, 1.0, 7.0, 1.0), child: Row()),
          Expanded(
              child: FutureBuilder<List<ParseObject>>(
                  future: getOrdemServico(),
                  builder: (context, snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                      case ConnectionState.waiting:
                        return Center(
                          child: Container(
                              width: 100,
                              height: 100,
                              child: CircularProgressIndicator()),
                        );
                      default:
                        if (snapshot.hasError) {
                          return Center(
                            child: Text("Error..."),
                          );
                        }
                        if (!snapshot.hasData) {
                          return Center(
                            child: Text("No Data..."),
                          );
                        } else {
                          return ListView.builder(
                              padding: EdgeInsets.only(top: 10.0),
                              itemCount: snapshot.data!.length,
                              itemBuilder: (context, index) {
                                //*************************************
                                //Get Parse Object Values
                                final varOrdemServico = snapshot.data![index];
                                final varNomeCliente =
                                    varOrdemServico.get('nomeCliente');
                                final varProduto =
                                    varOrdemServico.get('produto');
                                final varObservacao =
                                    varOrdemServico.get('observacao');
                                final varDescricao =
                                    varOrdemServico.get('descricao');
                                final varStatus = varOrdemServico.get('status');
                                final varId = varOrdemServico.get('objectId');
                                //*************************************

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
                                          if (varStatus == "Pendente") ...[
                                            _card(
                                                varNomeCliente,
                                                varProduto,
                                                varDescricao,
                                                varObservacao,
                                                varId,
                                                varStatus)
                                          ] else if (varStatus ==
                                              "Fechado") ...[
                                            _closedCard(
                                                varNomeCliente,
                                                varProduto,
                                                varDescricao,
                                                varObservacao,
                                                varId,
                                                varStatus)
                                          ]
                                          // _card(
                                          //     varNomeCliente,
                                          //     varProduto,
                                          //     varDescricao,
                                          //     varObservacao,
                                          //     varId),
                                        ],
                                      ),
                                    ),
                                  ),
                                );

                                // title: Text(varNomeCliente),
                                // subtitle: Text(varProduto),
                                // trailing: Row(
                                //   mainAxisSize: MainAxisSize.min,
                                //   children: [
                                //     IconButton(
                                //       icon: Icon(
                                //         Icons.delete,
                                //         color: Colors.blue,
                                //       ),
                                //       onPressed: () async {
                                //         await deleteOrdemServico(
                                //             varOrdemServico.objectId!);
                                //         setState(() {
                                //           final snackBar = SnackBar(
                                //             content: Text("Todo deleted!"),
                                //             duration: Duration(seconds: 2),
                                //           );
                                //           ScaffoldMessenger.of(context)
                                //             ..removeCurrentSnackBar()
                                //             ..showSnackBar(snackBar);
                                //         });
                                //       },
                                //     )
                                //   ],
                                // ),
                              });
                        }
                    }
                  }))
        ],
      ),
    );
  }

//   Widget build(BuildContext context) {
//     Expanded(
//         child: FutureBuilder<List<ParseObject>>(
//             future: getOrdemServico(),
//             builder: (context, snapshot) {
//               switch (snapshot.connectionState) {
//                 case ConnectionState.none:
//                 case ConnectionState.waiting:
//                   return Center(
//                     child: Container(
//                         width: 100,
//                         height: 100,
//                         child: CircularProgressIndicator()),
//                   );
//                 default:
//                   if (snapshot.hasError) {
//                     return Center(
//                       child: Text("Error..."),
//                     );
//                   }
//                   if (!snapshot.hasData) {
//                     return Center(
//                       child: Text("No Data..."),
//                     );
//                   } else {
//                     return ListView.builder(
//                         padding: EdgeInsets.only(top: 10.0),
//                         itemCount: snapshot.data!.length,
//                         itemBuilder: (context, index) {
//                           //*************************************
//                           //Get Parse Object Values
//                           final varOrdemServico = snapshot.data![index];
//                           final varNomeCliente =
//                               varOrdemServico.get('nomeCliente');
//                           final varProduto = varOrdemServico.get('produto');
//                           final varObservacao =
//                               varOrdemServico.get('observacao');
//                           final varDescricao = varOrdemServico.get('descricao');
//                           //*************************************

//                           return ListTile(
//                             title: Text(varNomeCliente),
//                             leading: CircleAvatar(),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 //Checkbox(
//                                 // value: varDone,
//                                 // onChanged: (value) async {
//                                 // await updateOrdemServico(
//                                 //  varTodo.objectId!, value!);
//                                 // setState(() {
//                                 // //   //Refresh UI
//                                 //  }),
//                                 //  }),
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.delete,
//                                     color: Colors.blue,
//                                   ),
//                                   onPressed: () async {
//                                     //await deleteOrdemServico(varTodo.objectId!);
//                                     // setState(() {
//                                     //   final snackBar = SnackBar(
//                                     //     content: Text("Todo deleted!"),
//                                     //     duration: Duration(seconds: 2),
//                                     //   );
//                                     //   ScaffoldMessenger.of(context)
//                                     //     ..removeCurrentSnackBar()
//                                     //     ..showSnackBar(snackBar);
//                                     // });
//                                   },
//                                 )
//                               ],
//                             ),
//                           );
//                         });
//                   }
//               }
//             }));

//     return Container(
//       child: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           scrollDirection: Axis.vertical,
//           child: Column(
//             children: [
//               Padding(
//                 padding: EdgeInsets.all(16.0),
//                 child: Text(
//                   "Modificar Ordem de Serviço",
//                   style: TextStyle(fontSize: 20),
//                   textAlign: TextAlign.center,
//                 ),
//               ),
//               // waitingCard(),
//               // buildCard(),
//               // _card(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

  _card(varNomeCliente, varProduto, varDescricao, varObservacao, varId,
      varStatus) {
    return GestureDetector(
      // CRIAR AQUI O BOTÃO PARA ABRIR DETALHES DA OS
      // EXEMPLO PARA NAVEGAR:
      //onTap: () => Navigator.pushNamed(context, '/HomePage'),
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
              title: Text("Cliente: " + varNomeCliente,
                  style: TextStyle(fontSize: 20.0)),
              subtitle: Text("Aparelho: " + varProduto,
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
                  onPressed: () {
                    modifyOSPage(varNomeCliente, varProduto, varDescricao,
                        varObservacao, varId, varStatus);
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.delete),
                  onPressed: () async {
                    await deleteOrdemServico(varId!);
                    setState(() {
                      final snackBar = SnackBar(
                        content: Text("OS excluída!"),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    });
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

  _closedCard(varNomeCliente, varProduto, varDescricao, varObservacao, varId,
      varStatus) {
    return GestureDetector(
      // CRIAR AQUI O BOTÃO PARA ABRIR DETALHES DA OS
      // EXEMPLO PARA NAVEGAR:
      //onTap: () => Navigator.pushNamed(context, '/HomePage'),
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
              title: Text("Cliente: " + varNomeCliente,
                  style: TextStyle(fontSize: 20.0)),
              subtitle: Text("Aparelho: " + varProduto,
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
                  onPressed: () {
                    modifyOSPage(varNomeCliente, varProduto, varDescricao,
                        varObservacao, varId, varStatus);
                  },
                ),
                ElevatedButton(
                  child: const Icon(Icons.delete),
                  onPressed: () async {
                    await deleteOrdemServico(varId!);
                    setState(() {
                      final snackBar = SnackBar(
                        content: Text("Todo deleted!"),
                        duration: Duration(seconds: 2),
                      );
                      ScaffoldMessenger.of(context)
                        ..removeCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    });
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

  modifyOSPage(varNomeCliente, varProduto, varDescricao, varObservacao, varId,
      varStatus) {
    String _selectedValue;
    List<String> listOfValue = ['Pendente', 'Fechado'];

    final nomeCliente = TextEditingController();
    final produto = TextEditingController();
    String status = "";
    showDialog(
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
                      // initialValue: varNomeCliente,
                      controller: nomeCliente,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Produto',
                      ),
                      //  initialValue: varProduto,
                      controller: produto,
                    ),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                        labelText: 'Status',
                      ),
                      value: varStatus,
                      items: listOfValue.map((value) {
                        return DropdownMenuItem(
                          child: Text(value),
                          value: value,
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value.toString();
                          status = _selectedValue;
                        });
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
                        nomeCliente: nomeCliente.text,
                        produto: produto.text,
                        descricao: varDescricao,
                        observacao: varObservacao,
                        status: status);
                    await updateOrdemServico(varId, novaOrdemServico);
                    Navigator.of(context).pop();
                    setState(() {
                      final snackBar = SnackBar(
                        content: Text("OS Alterada!"),
                        duration: Duration(seconds: 2),
                      );
                    });
                  })
            ],
          );
        });
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
            subtitle: Text('Orçamento não realizado',
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
}

Future<List<ParseObject>> getOrdemServico() async {
  QueryBuilder<ParseObject> queryTodo =
      QueryBuilder<ParseObject>(ParseObject('OrdemServico'));
  final ParseResponse apiResponse = await queryTodo.query();

  if (apiResponse.success && apiResponse.results != null) {
    return apiResponse.results as List<ParseObject>;
  } else {
    return [];
  }
}

Future<void> updateOrdemServico(
    String id, ordemServico novaOrdemServico) async {
  var ordemServico = ParseObject('OrdemServico')
    ..objectId = id
    ..set('nomeCliente', novaOrdemServico.nomeCliente)
    ..set('produto', novaOrdemServico.produto)
    ..set('descricao', novaOrdemServico.descricao)
    ..set('observacao', novaOrdemServico.observacao)
    ..set('status', novaOrdemServico.status);
  await ordemServico.save();
}

Future<void> deleteOrdemServico(String id) async {
  var todo = ParseObject('OrdemServico')..objectId = id;
  await todo.delete();
}
