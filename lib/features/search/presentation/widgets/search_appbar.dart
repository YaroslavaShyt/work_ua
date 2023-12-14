import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/features/search/presentation/bloc/search_bloc.dart';

class SearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  const SearchAppbar({Key? key}) : super(key: key);

  @override
  State<SearchAppbar> createState() => _SearchAppbarState();

  @override
  Size get preferredSize => const Size.fromHeight(80.0);
}

class _SearchAppbarState extends State<SearchAppbar> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: blueColor,
      leading: IconButton(
        icon: const Icon(
          Icons.arrow_back,
          color: whiteColor,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      title: Center(
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width - 300,
              child: TextField(
                controller: searchController,
                onChanged: (data) {
                  context
                      .read<SearchBloc>()
                      .add(InitiateSearchVacancyEvent(searchString: data));
                },
              ),
            ),
            IconButton(
                onPressed: searchController.clear,
                icon: const Icon(
                  Icons.close,
                  color: whiteColor,
                ))
          ],
        ),
      ),
    );
  }
}
