import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/ordemServico.dart';

class ordemServicoRepository {
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
    var ordemServico = ParseObject('OrdemServico')..objectId = id;
    await ordemServico.delete();
  }
}
