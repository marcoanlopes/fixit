class ordemServico {
  int? id;
  String? nomeCliente;
  String? produto;
  String? descricao;
  String? observacao;

  ordemServico({
    this.id,
    this.nomeCliente,
    this.produto,
    this.descricao,
    this.observacao,
  });

  ordemServico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeCliente = json['nome'];
    produto = json['produto'];
    descricao = json['descricao'];
    observacao = json['observacao'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nomeCliente;
    data['produto'] = this.produto;
    data['descricao'] = this.descricao;
    data['observacao'] = this.observacao;

    return data;
  }
}
