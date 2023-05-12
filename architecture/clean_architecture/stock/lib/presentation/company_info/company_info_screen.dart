import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stock/domain/model/company_info.dart';
import 'package:stock/presentation/company_info/company_info_view_model.dart';
import 'package:stock/util/constants.dart';

class CompanyInfoScreen extends StatelessWidget {
  const CompanyInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CompanyInfoViewModel>();
    final state = viewModel.state;
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Stack(
          children: [
            if (state.errorMessage != null)
              Center(
                child: Text(
                  state.errorMessage!,
                ),
              ),
            if (state.isLoading)
              const Center(
                child: CircularProgressIndicator(),
              ),
            if (!state.isLoading &&
                state.errorMessage == null &&
                state.companyInfo != null)
              _buildBody(state.companyInfo!),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(CompanyInfo companyInfo) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            companyInfo.name,
            style: cLargeTextStyle,
          ),
          Text(
            companyInfo.symbol,
            style: cMediumItalicTextStyle,
          ),
          const Divider(),
          Text(
            'Industry: ${companyInfo.industry}',
            style: cMediumTextStyle,
          ),
          const Divider(),
          Text(
            'Country: ${companyInfo.country}',
            style: cMediumTextStyle,
          ),
          const Divider(),
          Text(
            companyInfo.description,
            style: cSmallTextStyle,
          ),
        ],
      ),
    );
  }
}
