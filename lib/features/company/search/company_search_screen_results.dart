import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/bloc/search_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/no_vacancies.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/search_appbar.dart';
import 'package:work_ua/features/candidate/search/presentation/widgets/vacancy_list.dart';
import 'package:work_ua/features/company/search/cv_list.dart';
import 'package:work_ua/features/company/search/no_cvs.dart';

class CompanySearchResultPage extends StatefulWidget {
  static const id = "company_search_result";
  final String searchData;
  const CompanySearchResultPage({Key? key, required this.searchData})
      : super(key: key);

  @override
  State<CompanySearchResultPage> createState() => _CompanySearchResultPageState();
}

class _CompanySearchResultPageState extends State<CompanySearchResultPage> {
  @override
  Widget build(BuildContext context) {
    context
        .read<SearchBloc>()
        .add(InitiateSearchCVByQueryEvent(searchString: widget.searchData));
    // setState(() {});
    return Scaffold(
      appBar: const SearchAppbar(
        isCompany: true,
      ),
      body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        if (state is SearchCVByQueryFailure ||
            (state is SearchCVByQuerySuccess && state.models.isEmpty)) {
          return const NoCVs();
        }
        if (state is SearchCVByQuerySuccess) {
          // print('in if');
          return CVList(
            cvs: state.models,
          );
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
