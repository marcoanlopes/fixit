// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ordemServico.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ordemServico on _ordemServico, Store {
  late final _$nomeClienteAtom =
      Atom(name: '_ordemServico.nomeCliente', context: context);

  @override
  String? get nomeCliente {
    _$nomeClienteAtom.reportRead();
    return super.nomeCliente;
  }

  @override
  set nomeCliente(String? value) {
    _$nomeClienteAtom.reportWrite(value, super.nomeCliente, () {
      super.nomeCliente = value;
    });
  }

  late final _$produtoAtom =
      Atom(name: '_ordemServico.produto', context: context);

  @override
  String? get produto {
    _$produtoAtom.reportRead();
    return super.produto;
  }

  @override
  set produto(String? value) {
    _$produtoAtom.reportWrite(value, super.produto, () {
      super.produto = value;
    });
  }

  late final _$descricaoAtom =
      Atom(name: '_ordemServico.descricao', context: context);

  @override
  String? get descricao {
    _$descricaoAtom.reportRead();
    return super.descricao;
  }

  @override
  set descricao(String? value) {
    _$descricaoAtom.reportWrite(value, super.descricao, () {
      super.descricao = value;
    });
  }

  late final _$observacaoAtom =
      Atom(name: '_ordemServico.observacao', context: context);

  @override
  String? get observacao {
    _$observacaoAtom.reportRead();
    return super.observacao;
  }

  @override
  set observacao(String? value) {
    _$observacaoAtom.reportWrite(value, super.observacao, () {
      super.observacao = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_ordemServico.status', context: context);

  @override
  String? get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(String? value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_ordemServicoActionController =
      ActionController(name: '_ordemServico', context: context);

  @override
  void setNomeCliente(String? value) {
    final _$actionInfo = _$_ordemServicoActionController.startAction(
        name: '_ordemServico.setNomeCliente');
    try {
      return super.setNomeCliente(value);
    } finally {
      _$_ordemServicoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProduto(String? value) {
    final _$actionInfo = _$_ordemServicoActionController.startAction(
        name: '_ordemServico.setProduto');
    try {
      return super.setProduto(value);
    } finally {
      _$_ordemServicoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescricao(String? value) {
    final _$actionInfo = _$_ordemServicoActionController.startAction(
        name: '_ordemServico.setDescricao');
    try {
      return super.setDescricao(value);
    } finally {
      _$_ordemServicoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setObservacao(String? value) {
    final _$actionInfo = _$_ordemServicoActionController.startAction(
        name: '_ordemServico.setObservacao');
    try {
      return super.setObservacao(value);
    } finally {
      _$_ordemServicoActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStatus(String? value) {
    final _$actionInfo = _$_ordemServicoActionController.startAction(
        name: '_ordemServico.setStatus');
    try {
      return super.setStatus(value);
    } finally {
      _$_ordemServicoActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nomeCliente: ${nomeCliente},
produto: ${produto},
descricao: ${descricao},
observacao: ${observacao},
status: ${status}
    ''';
  }
}
