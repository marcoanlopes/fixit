import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../models/Customer.dart';

class CustomerRepository {
  Future<List<Customer>> listCustomer() async {
    print("chamada do listCustomer");
    QueryBuilder<ParseObject> queryTodo =
        QueryBuilder<ParseObject>(ParseObject('Customer'));
    final ParseResponse apiResponse = await queryTodo.query();

    List<Customer> list = [];

    if (apiResponse.success && apiResponse.results != null) {
      final objects = apiResponse.results as List<ParseObject>;
      for (ParseObject object in objects) {
        final id = object.get('objectId');
        final nome = object.get('nome');
        final sobrenome = object.get('sobrenome');
        final endereco = object.get('endereco');
        final telefone = object.get('telefone');
        Customer customer = Customer(
          id: id,
          nome: nome,
          sobrenome: sobrenome,
          endereco: endereco,
          telefone: telefone,
        );
        list.add(customer);
      }
      return list;
    } else {
      return [];
    }
  }

  Future<bool> updateCustomer(Customer newCustomer) async {
    var customer = ParseObject('Customer')
      ..objectId = newCustomer.id
      ..set('nome', newCustomer.nome)
      ..set('sobrenome', newCustomer.sobrenome)
      ..set('endereco', newCustomer.endereco)
      ..set('telefone', newCustomer.telefone);
    await customer.save();
    if (customer.objectId != null) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteCustomer(Customer delCustomer) async {
    var customer = ParseObject('Customer')..objectId = delCustomer.id;
    final ParseResponse response = await customer.delete();
    if (response.success) {
      return true;
    }
    return false;
  }

  Future<Customer?> saveCustomer(Customer customer) async {
    final newCustomer = ParseObject('Customer')
      ..set('nome', customer.nome)
      ..set('sobrenome', customer.sobrenome)
      ..set('endereco', customer.endereco)
      ..set('telefone', customer.telefone);

    if (customer.id.isNotEmpty) {
      newCustomer.objectId = customer.id;
    }

    final ParseResponse response = await newCustomer.save();
    if (response.success && response.result != null) {
      final object = response.result as ParseObject;
      customer.id = object.objectId!;
      return customer;
    }
    return null;
  }
}
