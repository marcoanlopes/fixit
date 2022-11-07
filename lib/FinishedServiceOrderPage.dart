import 'package:fixit/models_view/ordemServico_store.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FinishedServiceOrderPage extends StatelessWidget {
  FinishedServiceOrderPage({
    Key? key,
  }) : super(key: key);

  ordemServico_store ordemServicoStore = ordemServico_store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ordens de Serviço Finalizadas'),
      ),
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
                                          if (varStatus == "Fechado") ...[
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
                              });
                        }
                    }
                  }))
        ],
      ),
    ); // body: BottomNavBar(),
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

_closedCard(
    varNomeCliente, varProduto, varDescricao, varObservacao, varId, varStatus) {
  return GestureDetector(
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
            children: <Widget>[],
          ),
        ],
      ),
    ),
  );
}
