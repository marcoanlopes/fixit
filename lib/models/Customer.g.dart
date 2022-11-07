// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Customer.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Customer on _Customer, Store {
  late final _$nomeAtom = Atom(name: '_Customer.nome', context: context);

  @override
  String? get nome {
    _$nomeAtom.reportRead();
    return super.nome;
  }

  @override
  set nome(String? value) {
    _$nomeAtom.reportWrite(value, super.nome, () {
      super.nome = value;
    });
  }

  late final _$sobrenomeAtom =
      Atom(name: '_Customer.sobrenome', context: context);

  @override
  String? get sobrenome {
    _$sobrenomeAtom.reportRead();
    return super.sobrenome;
  }

  @override
  set sobrenome(String? value) {
    _$sobrenomeAtom.reportWrite(value, super.sobrenome, () {
      super.sobrenome = value;
    });
  }

  late final _$telefoneAtom =
      Atom(name: '_Customer.telefone', context: context);

  @override
  String? get telefone {
    _$telefoneAtom.reportRead();
    return super.telefone;
  }

  @override
  set telefone(String? value) {
    _$telefoneAtom.reportWrite(value, super.telefone, () {
      super.telefone = value;
    });
  }

  late final _$enderecoAtom =
      Atom(name: '_Customer.endereco', context: context);

  @override
  String? get endereco {
    _$enderecoAtom.reportRead();
    return super.endereco;
  }

  @override
  set endereco(String? value) {
    _$enderecoAtom.reportWrite(value, super.endereco, () {
      super.endereco = value;
    });
  }

  late final _$_CustomerActionController =
      ActionController(name: '_Customer', context: context);

  @override
  void setNome(String? value) {
    final _$actionInfo =
        _$_CustomerActionController.startAction(name: '_Customer.setNome');
    try {
      return super.setNome(value);
    } finally {
      _$_CustomerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSobrenome(String? value) {
    final _$actionInfo =
        _$_CustomerActionController.startAction(name: '_Customer.setSobrenome');
    try {
      return super.setSobrenome(value);
    } finally {
      _$_CustomerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTelefone(String? value) {
    final _$actionInfo =
        _$_CustomerActionController.startAction(name: '_Customer.setTelefone');
    try {
      return super.setTelefone(value);
    } finally {
      _$_CustomerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEndereco(String? value) {
    final _$actionInfo =
        _$_CustomerActionController.startAction(name: '_Customer.setEndereco');
    try {
      return super.setEndereco(value);
    } finally {
      _$_CustomerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
nome: ${nome},
sobrenome: ${sobrenome},
telefone: ${telefone},
endereco: ${endereco}
    ''';
  }
}
