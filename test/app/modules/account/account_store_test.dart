import 'package:flutter_test/flutter_test.dart';
import 'package:forestinv_mobile/app//modules/account/account_store.dart';
 
void main() {
  late AccountStore store;

  setUpAll(() {
    store = AccountStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}