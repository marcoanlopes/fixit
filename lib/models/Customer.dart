import 'package:mobx/mobx.dart';

part 'Customer.g.dart';

class Customer = _Customer with _$Customer;

abstract class _Customer with Store {
  _Customer({
    this.id = "",
    this.nome,
    this.sobrenome,
    this.telefone,
    this.endereco,
  });

  String id;
  @observable
  String? nome;
  @observable
  String? sobrenome;
  @observable
  String? telefone;
  @observable
  String? endereco;

  @action
  void setNome(String? value) => nome = value;
  @action
  void setSobrenome(String? value) => sobrenome = value;
  @action
  void setTelefone(String? value) => telefone = value;
  @action
  void setEndereco(String? value) => endereco = value;
}
