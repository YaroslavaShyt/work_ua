import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:work_ua/core/colors.dart';
import 'package:work_ua/features/candidate/home.dart';
import 'package:work_ua/features/candidate/search/presentation/bloc/search_bloc.dart';
import 'package:work_ua/features/candidate/search/presentation/pages/search_screen.dart';
import 'package:work_ua/features/company/home_company.dart';

class SearchAppbar extends StatefulWidget implements PreferredSizeWidget {
  final bool isCompany;
  const SearchAppbar({Key? key, this.isCompany = false}) : super(key: key);

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
          if (widget.isCompany) {
            Navigator.of(context).pushReplacementNamed(HomeScreenCompany.id);
          } else {
            Navigator.of(context).pushReplacementNamed(HomeScreen.id);
          }
        },
      ),
      title: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Row(
            children: [
              Container(
                height: 40,
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                decoration: const BoxDecoration(
                    color: whiteColor,
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                width: MediaQuery.of(context).size.width - 150,
                child: TextField(
                  controller: searchController,
                  onChanged: (data) {
                    if (widget.isCompany == false) {
                      context
                          .read<SearchBloc>()
                          .add(InitiateSearchVacancyEvent(searchString: data));
                    } else {
                      context.read<SearchBloc>().add(
                          InitiateSearchCVByQueryEvent(searchString: data));
                    }
                  },
                  decoration: const InputDecoration(
                    border:
                        InputBorder.none, // Встановлення лінії границі на жодну
                  ),
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
      ),
    );
  }
}
