import 'package:hive/hive.dart';
import 'package:stock/data/source/local/company_listing_entity.dart';

class StockDao {
  static const companyListing = 'companyListing';
  final box = Hive.box('stock.db');

  // 추가
  Future<void> insertCompanyListings(
      List<CompanyListingEntity> companyListingEntity) async {
    await box.put(StockDao.companyListing, companyListingEntity);
  }

  // 클리어
  Future clearCompanyListings() async {
    await box.clear();
  }

  // 검색
  Future<List<CompanyListingEntity>> searchCompanyListing(String query) async {
    List<CompanyListingEntity> companyListing =
        box.get(StockDao.companyListing, defaultValue: []);
    return companyListing
        .where((element) =>
            element.name.toLowerCase().contains(query.toLowerCase()) ||
            query.toUpperCase() == element.symbol)
        .toList();
  }
}
