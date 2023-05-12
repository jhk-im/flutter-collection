import 'package:stock/domain/model/company_listing.dart';
import 'package:stock/util/result.dart';

abstract class StockRepository {
  Future<Result<List<CompanyListing>>> getCompanyListings(bool fetchFromRemote, String query);
}