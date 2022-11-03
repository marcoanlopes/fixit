class ordemServico {
  int? id;
  String? nomeCliente;
  String? produto;
  String? descricao;
  String? observacao;
  String? status;

  ordemServico({
    this.id,
    this.nomeCliente,
    this.produto,
    this.descricao,
    this.observacao,
    this.status,
  });

  ordemServico.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nomeCliente = json['nome'];
    produto = json['produto'];
    descricao = json['descricao'];
    observacao = json['observacao'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nomeCliente;
    data['produto'] = this.produto;
    data['descricao'] = this.descricao;
    data['observacao'] = this.observacao;
    data['status'] = this.status;

    return data;
  }
}
