import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app//modules/medicao/medicao_store.dart';
 
void main() {
  late MedicaoStore store;

  setUpAll(() {
    store = MedicaoStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}