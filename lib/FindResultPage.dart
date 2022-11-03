import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class FindResultPage extends StatefulWidget {
  const FindResultPage({
    Key? key,
  }) : super(key: key);
  @override
  _FindResultPage createState() => _FindResultPage();
}

class _FindResultPage extends State<FindResultPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado da busca'),
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
                                print(varNomeCliente);
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
                                          if (varNomeCliente == "Cliente4") ...[
                                            _card(
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
    );
  }
}

_card(
    varNomeCliente, varProduto, varDescricao, varObservacao, varId, varStatus) {
  return
      // CRIAR AQUI O BOTÃO PARA ABRIR DETALHES DA OS
      // EXEMPLO PARA NAVEGAR:
      //onTap: () => Navigator.pushNamed(context, '/HomePage'),
      Card(
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
          subtitle:
              Text("Aparelho: " + varProduto, style: TextStyle(fontSize: 14.0)),
        ),
        Divider(
          color: Colors.black,
          height: 30,
          thickness: 0,
          indent: 20,
          endIndent: 20,
        ),
      ],
    ),
  );
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
