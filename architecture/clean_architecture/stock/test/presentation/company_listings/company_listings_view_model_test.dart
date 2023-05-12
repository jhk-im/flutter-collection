import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:stock/data/repository/stock_repository_impl.dart';
import 'package:stock/data/source/local/company_listing_entity.dart';
import 'package:stock/data/source/local/stock_dao.dart';
import 'package:stock/data/source/remote/stock_api.dart';
import 'package:stock/presentation/company_listings/company_listings_view_model.dart';

void main() {
  test('company_listings_view_model 생성시 데이터 가져오기', () async {
    dotenv.testLoad(fileInput: File('assets/.env').readAsStringSync());

    Hive.init(null);
    Hive.registerAdapter(CompanyListingEntityAdapter());

    final api = StockApi();
    final dao = StockDao();
    final viewModel = CompanyListingsViewModel(StockRepositoryImpl(api, dao));

    await Future.delayed(const Duration(seconds: 3));

    expect(viewModel.state.companies.isNotEmpty, true);
  });
}