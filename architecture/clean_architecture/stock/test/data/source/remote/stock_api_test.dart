import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:stock/data/csv/company_listings_parser.dart';
import 'package:stock/data/source/remote/stock_api.dart';

void main() {
  test('네트워크 통신', () async{
    dotenv.testLoad(fileInput: File('assets/.env').readAsStringSync());

    final response = await StockApi().getListings();

    final parser = CompanyListingsParser();
    final remoteListings = await parser.parse(response.body);

    expect(remoteListings[0].symbol, 'A');
    expect(remoteListings[0].name, 'Agilent Technologies Inc');
    expect(remoteListings[0].exchange, 'NYSE');
  });
}