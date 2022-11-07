import 'package:fixit/repositories/ordemServico_Repository.dart';
import 'package:mobx/mobx.dart';

import '../models/ordemServico.dart';

//flutter pub run build_runner build
part 'ordemServico_store.g.dart';

class ordemServico_store = _ordemServico_store with _$ordemServico_store;

abstract class _ordemServico_store with Store {
  _ordemServico_store() {
    carregarOrdemServico();
  }

  ordemServicoRepository repository = ordemServicoRepository();

  @observable
  ObservableList<ordemServico> listaDeOrdemServico = ObservableList();

  @observable
  ObservableFuture<List<ordemServico>> obsFuture = ObservableFuture.value([]);

  @computed
  bool get isLoading {
    return obsFuture.status == FutureStatus.pending;
  }

  @action
  Future<void> carregarOrdemServico() async {
    final futureList = repository.listOrdemServico();
    obsFuture = ObservableFuture(futureList);
    final ordemServico = await futureList;
    listaDeOrdemServico.addAll(ordemServico);
  }

  @action
  Future<void> salvarOrdemServico(ordemServico os) async {
    final ordemServico = await repository.saveOrdemServico(os);

    if (ordemServico != null) {
      listaDeOrdemServico.add(os);
      // listaDeOrdemServico.add(ordemServico);
    }
  }

  @action
  Future<void> excluirOrdemServico(ordemServico os) async {
    final foiExcluido = await repository.deleteOrdemServico(os);
    if (foiExcluido) {
      listaDeOrdemServico.removeWhere((element) => element == os);
    }
  }

  @action
  Future<void> atualizarOrdemServico(ordemServico os) async {
    final foiAtualizado = await repository.updateOrdemServico(os);
    if (foiAtualizado) {
      //update funcionando
      final index =
          listaDeOrdemServico.indexWhere((element) => element.id == os.id);
      listaDeOrdemServico[index] = os;
    }
  }
}
