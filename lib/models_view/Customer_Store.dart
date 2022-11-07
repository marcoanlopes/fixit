import 'package:fixit/repositories/Customer_Repository.dart';
import 'package:mobx/mobx.dart';

import '../models/Customer.dart';

//flutter pub run build_runner build
part 'Customer_Store.g.dart';

class Customer_store = _Customer_store with _$Customer_store;

abstract class _Customer_store with Store {
  _Customer_store() {
    carregarCustomer();
  }

  CustomerRepository repository = CustomerRepository();

  @observable
  ObservableList<Customer> listaDeCustomer = ObservableList();

  @observable
  ObservableFuture<List<Customer>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isLoading {
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> carregarCustomer() async {
    final futureList = repository.listCustomer();
    obsFuture = ObservableFuture(futureList);
    final customer = await futureList;
    listaDeCustomer.addAll(customer);
  }

  @action
  Future<void> salvarCustomer(Customer newCustomer) async {
    final customer = await repository.saveCustomer(newCustomer);

    if (customer != null) {
      listaDeCustomer.add(newCustomer);
      // listaDeCustomer.add(Customer);
    }
  }

  @action
  Future<void> excluirCustomer(Customer deleteCustomer) async {
    final foiExcluido = await repository.deleteCustomer(deleteCustomer);
    if (foiExcluido) {
      listaDeCustomer.removeWhere((element) => element == deleteCustomer);
    }
  }

  @action
  Future<void> atualizarOrdemServico(Customer updateCustomer) async {
    final foiAtualizado = await repository.updateCustomer(updateCustomer);
    if (foiAtualizado) {
      //update funcionando
      final index = listaDeCustomer
          .indexWhere((element) => element.id == updateCustomer.id);
      listaDeCustomer[index] = updateCustomer;
    }
  }
}
