import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/ordemServico.dart';

class ordemServicoRepository {
  Future<List<ordemServico>> listOrdemServico() async {
    print("chamada do listOrdemServico");
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('OrdemServico'));
    final ParseResponse apiResponse = await queryTodo.query();

    List<ordemServico> list = [];

    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;
      for (ParseObject object in objects) {
        final id = object.get('objectId');
        final nomeCliente = object.get('nomeCliente');
        final produto = object.get('produto');
        final descricao = object.get('descricao');
        final observacao = object.get('observacao');
        final status = object.get('status');
        ordemServico os = ordemServico(
          id: id,
          nomeCliente: nomeCliente,
          produto: produto,
          descricao: descricao,
          observacao: observacao,
          status: status,
        );
        list.add(os);
      }
      return list;
    } else {
      return [];
    }
  }

  Future<bool> updateOrdemServico(ordemServico novaOrdemServico) async {
    var ordemServico = ParseObject('OrdemServico')
      ..objectId = novaOrdemServico.id
      ..set('nomeCliente', novaOrdemServico.nomeCliente)
      ..set('produto', novaOrdemServico.produto)
      ..set('descricao', novaOrdemServico.descricao)
      ..set('observacao', novaOrdemServico.observacao)
      ..set('status', novaOrdemServico.status);
    await ordemServico.save();
    if (ordemServico.objectId != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteOrdemServico(ordemServico os) async {
    var ordemServico = ParseObject('OrdemServico')..objectId = os.id;
    final ParseResponse response = await ordemServico.delete();
    if (response.success) {
      return true;
    }
    return false;
  }

  Future<ordemServico?> saveOrdemServico(ordemServico os) async {
    final ordemServicoObject = ParseObject('OrdemServico')
      ..set('nomeCliente', os.nomeCliente)
      ..set('produto', os.produto)
      ..set('descricao', os.descricao)
      ..set('observacao', os.observacao)
      ..set('status', os.status);

    if (os.id.isNotEmpty) {
      ordemServicoObject.objectId = os.id;
    }

    final ParseResponse response = await ordemServicoObject.save();
    if (response.success && response.result != null) {
      final object = response.result as ParseObject;
      os.id = object.objectId!;
      return os;
    }
    return null;
  }
}
