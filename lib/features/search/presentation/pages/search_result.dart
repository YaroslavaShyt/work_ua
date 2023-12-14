import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/features/search/presentation/bloc/search_bloc.dart';
import 'package:work_ua/features/search/presentation/widgets/no_vacancies.dart';
import 'package:work_ua/features/search/presentation/widgets/search_appbar.dart';
import 'package:work_ua/features/search/presentation/widgets/vacancy_list.dart';

class SearchResultPage extends StatefulWidget {
  static const id = "search_result";
  final String searchData;
  const SearchResultPage({Key? key, required this.searchData})
      : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  @override
  Widget build(BuildContext context) {
    context
        .read<SearchBloc>()
        .add(InitiateSearchVacancyEvent(searchString: widget.searchData));
    // setState(() {});
    return Scaffold(
      appBar: const SearchAppbar(),
      body: BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
        if (state is SearchVacancyFailure ||
            (state is SearchVacancySuccess && state.models.isEmpty)) {
          return const NoVacancies();
        }
        if (state is SearchVacancySuccess) {
          // print('in if');
          return VacancyList(vacancies: state.models);
        }
        return const Center(child: CircularProgressIndicator());
      }),
    );
  }
}
