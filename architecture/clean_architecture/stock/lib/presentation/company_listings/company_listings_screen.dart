import 'package:flutter/material.dart';
import 'package:stock/presentation/company_listings/company_listings_view_model.dart';
import 'package:stock/util/constants.dart';
import 'package:provider/provider.dart';

class CompanyListingsScreen extends StatelessWidget {
  const CompanyListingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyListingsViewModel>();
    final state = viewModel.state;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                focusedBorder: cOutlineInputBorder(context),
                enabledBorder: cOutlineInputBorder(context),
                labelText: 'Search...',
                labelStyle:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: () async {
                // TODO : 새로고침
                
              },
              child: ListView.builder(
                itemCount: state.companies.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        title: Text(state.companies[index].name),
                      ),
                      Divider(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
