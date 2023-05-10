import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mask/model/store.dart';

class StoreRepository {
  Future<List<Store>> getStore() async {
    final List<Store> stores = [];
    var url = Uri.https('gist.githubusercontent.com',
        'junsuk5/bb7485d5f70974deee920b8f0cd1e2f0/raw/063f64d9b343120c2cb01a6555cf9b38761b1d94/sample.json');
    var response = await http.get(url);
    final jsonResult = jsonDecode(response.body);
    final jsonStores = jsonResult['stores'];
    stores.clear();
    jsonStores.forEach((jsonStore) {
      Store store = Store.fromJson(jsonStore);
      stores.add(store);
    });
    stores
        .sort((a, b) => a.getRemainStatNum().compareTo(b.getRemainStatNum()));
    return stores.where((element) => element.getRemainStatNum() > 0).toList();
  }
}