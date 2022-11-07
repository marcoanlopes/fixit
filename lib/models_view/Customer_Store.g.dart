// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer_Store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Customer_store on _Customer_store, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_Customer_store.isLoading'))
          .value;

  late final _$listaDeCustomerAtom =
      Atom(name: '_Customer_store.listaDeCustomer', context: context);

  @override
  ObservableList<Customer> get listaDeCustomer {
    _$listaDeCustomerAtom.reportRead();
    return super.listaDeCustomer;
  }

  @override
  set listaDeCustomer(ObservableList<Customer> value) {
    _$listaDeCustomerAtom.reportWrite(value, super.listaDeCustomer, () {
      super.listaDeCustomer = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_Customer_store.obsFuture', context: context);

  @override
  ObservableFuture<List<Customer>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<Customer>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$carregarCustomerAsyncAction =
      AsyncAction('_Customer_store.carregarCustomer', context: context);

  @override
  Future<void> carregarCustomer() {
    return _$carregarCustomerAsyncAction.run(() => super.carregarCustomer());
  }

  late final _$salvarCustomerAsyncAction =
      AsyncAction('_Customer_store.salvarCustomer', context: context);

  @override
  Future<void> salvarCustomer(Customer newCustomer) {
    return _$salvarCustomerAsyncAction
        .run(() => super.salvarCustomer(newCustomer));
  }

  late final _$excluirCustomerAsyncAction =
      AsyncAction('_Customer_store.excluirCustomer', context: context);

  @override
  Future<void> excluirCustomer(Customer deleteCustomer) {
    return _$excluirCustomerAsyncAction
        .run(() => super.excluirCustomer(deleteCustomer));
  }

  late final _$atualizarOrdemServicoAsyncAction =
      AsyncAction('_Customer_store.atualizarOrdemServico', context: context);

  @override
  Future<void> atualizarOrdemServico(Customer updateCustomer) {
    return _$atualizarOrdemServicoAsyncAction
        .run(() => super.atualizarOrdemServico(updateCustomer));
  }

  @override
  String toString() {
    return '''
listaDeCustomer: ${listaDeCustomer},
obsFuture: ${obsFuture},
isLoading: ${isLoading}
    ''';
  }
}
