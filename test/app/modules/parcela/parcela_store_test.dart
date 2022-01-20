import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app//modules/parcela/parcela_store.dart';
 
void main() {
  late ParcelaStore store;

  setUpAll(() {
    store = ParcelaStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}