import 'package:fixit/models/ordemServico.dart';
import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CreateOS extends StatelessWidget {
  CreateOS({
    Key? key,
  }) : super(key: key);
  final nomeCliente = TextEditingController();
  final produto = TextEditingController();
  final descricao = TextEditingController();
  final observacao = TextEditingController();

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
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nome do Cliente',
                hintText: 'Digite o nome do cliente'),
            controller: nomeCliente,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Produto',
                hintText: 'Digite qual o produto com problema'),
            controller: produto,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Descrição',
                hintText: 'Digite do problema'),
            controller: descricao,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: TextField(
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Observação',
                hintText: 'Digite se houver alguma observação'),
            controller: observacao,
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
                  onPressed: () async {
                    ordemServico os = ordemServico(
                        nomeCliente: nomeCliente.text,
                        produto: produto.text,
                        descricao: descricao.text,
                        observacao: observacao.text);
                    // print(os.nomeCliente);
                    // print(os.produto);
                    // print(os.descricao);
                    // print(os.observacao);
                    saveOrdemServico(os);
                    nomeCliente.clear();
                    produto.clear();
                    descricao.clear();
                    observacao.clear();
                    print('Salvo OS!');
                  },
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nomeCliente.dispose();
    produto.dispose();
    descricao.dispose();
    observacao.dispose();
  }

  Future<void> saveOrdemServico(ordemServico os) async {
    final ordemServicoObject = ParseObject('OrdemServico')
      ..set('nomeCliente', os.nomeCliente)
      ..set('produto', os.produto)
      ..set('descricao', os.descricao)
      ..set('observacao', os.observacao);
    await ordemServicoObject.save();
  }
}
