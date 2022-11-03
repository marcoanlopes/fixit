import 'package:mobx/mobx.dart';

// class ordemServico {
//   int? id;
//   String? nomeCliente;
//   String? produto;
//   String? descricao;
//   String? observacao;
//   String? status;

//   ordemServico({
//     this.id,
//     this.nomeCliente,
//     this.produto,
//     this.descricao,
//     this.observacao,
//     this.status,
//   });
// }

part 'ordemServico.g.dart';

class ordemServico = _ordemServico with _$ordemServico;

abstract class _ordemServico with Store {
  _ordemServico({
    this.id,
    this.nomeCliente,
    this.produto,
    this.descricao,
    this.observacao,
    this.status,
  });

  int? id;
  @observable
  String? nomeCliente;
  @observable
  String? produto;
  @observable
  String? descricao;
  @observable
  String? observacao;
  @observable
  String? status;

  @action
  void setNomeCliente(String? value) => nomeCliente = value;
  @action
  void setProduto(String? value) => produto = value;
  @action
  void setDescricao(String? value) => descricao = value;
  @action
  void setObservacao(String? value) => observacao = value;
  @action
  void setStatus(String? value) => status = value;
}
