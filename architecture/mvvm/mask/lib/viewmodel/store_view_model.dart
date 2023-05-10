import 'package:flutter/cupertino.dart';
import 'package:mask/model/store.dart';
import 'package:mask/repository/store_repository.dart';

class StoreViewModel extends ChangeNotifier {
  final storeRepository = StoreRepository();
  List<Store> stores = [];
  var isLoading = true;
  var storesLength = 0;

  StoreViewModel() {
    getStores();
  }

  Future getStores() async {
    isLoading = true;
    notifyListeners();
    stores = await storeRepository.getStore();
    storesLength = stores.where((element) => element.getRemainStatNum() > 0).length;
    isLoading = false;
    notifyListeners();
  }
}