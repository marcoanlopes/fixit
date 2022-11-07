// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordemServico_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ordemServico_store on _ordemServico_store, Store {
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: '_ordemServico_store.isLoading'))
          .value;

  late final _$listaDeOrdemServicoAtom =
      Atom(name: '_ordemServico_store.listaDeOrdemServico', context: context);

  @override
  ObservableList<ordemServico> get listaDeOrdemServico {
    _$listaDeOrdemServicoAtom.reportRead();
    return super.listaDeOrdemServico;
  }

  @override
  set listaDeOrdemServico(ObservableList<ordemServico> value) {
    _$listaDeOrdemServicoAtom.reportWrite(value, super.listaDeOrdemServico, () {
      super.listaDeOrdemServico = value;
    });
  }

  late final _$obsFutureAtom =
      Atom(name: '_ordemServico_store.obsFuture', context: context);

  @override
  ObservableFuture<List<ordemServico>> get obsFuture {
    _$obsFutureAtom.reportRead();
    return super.obsFuture;
  }

  @override
  set obsFuture(ObservableFuture<List<ordemServico>> value) {
    _$obsFutureAtom.reportWrite(value, super.obsFuture, () {
      super.obsFuture = value;
    });
  }

  late final _$carregarOrdemServicoAsyncAction =
      AsyncAction('_ordemServico_store.carregarOrdemServico', context: context);

  @override
  Future<void> carregarOrdemServico() {
    return _$carregarOrdemServicoAsyncAction
        .run(() => super.carregarOrdemServico());
  }

  late final _$salvarOrdemServicoAsyncAction =
      AsyncAction('_ordemServico_store.salvarOrdemServico', context: context);

  @override
  Future<void> salvarOrdemServico(ordemServico os) {
    return _$salvarOrdemServicoAsyncAction
        .run(() => super.salvarOrdemServico(os));
  }

  late final _$excluirOrdemServicoAsyncAction =
      AsyncAction('_ordemServico_store.excluirOrdemServico', context: context);

  @override
  Future<void> excluirOrdemServico(ordemServico os) {
    return _$excluirOrdemServicoAsyncAction
        .run(() => super.excluirOrdemServico(os));
  }

  late final _$atualizarOrdemServicoAsyncAction = AsyncAction(
      '_ordemServico_store.atualizarOrdemServico',
      context: context);

  @override
  Future<void> atualizarOrdemServico(ordemServico os) {
    return _$atualizarOrdemServicoAsyncAction
        .run(() => super.atualizarOrdemServico(os));
  }

  @override
  String toString() {
    return '''
listaDeOrdemServico: ${listaDeOrdemServico},
obsFuture: ${obsFuture},
isLoading: ${isLoading}
    ''';
  }
}
