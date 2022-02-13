import 'package:mobx/mobx.dart';

part 'regra_consistencia_store.g.dart';

class RegraConsistenciaStore = _RegraConsistenciaStoreBase
    with _$RegraConsistenciaStore;

abstract class _RegraConsistenciaStoreBase with Store {}
