import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app//modules/regra_consistencia/regraConsistencia_store.dart';
 
void main() {
  late RegraConsistenciaStore store;

  setUpAll(() {
    store = RegraConsistenciaStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}