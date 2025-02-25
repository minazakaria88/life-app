import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:life/core/helpers/extensions.dart';
import 'package:life/core/widgets/no_result_widget.dart';
import 'package:life/features/search/data/models/debouncer_class.dart';
import 'package:life/features/search/presentation/manager/search_cubit.dart';
import 'package:life/features/search/presentation/manager/search_state.dart';
import 'package:life/generated/l10n.dart';

import '../../../../core/functions/get_language.dart';
import '../../../../core/routes/routes.dart';
import '../../../home/presentation/widgets/nurse_filter_list_view_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final Debouncer debouncer = Debouncer(waitingTime: 500);


  @override
  dispose() {
    debouncer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).search),
      ),
      body: BlocBuilder<SearchBloc, SearchState>(
        builder: (context, state) {
          var cubit = context.read<SearchBloc>();
          var nurseList = cubit.searchList;
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  trailing: [
                    IconButton(
                      onPressed: () {
                        cubit.searchController.clear();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ],
                  controller: cubit.searchController,
                  hintText: S.of(context).enterNurseName,
                  onChanged: (value) {
                    debouncer((){
                      cubit.onSearchChanged(name: value,page: 1);
                      cubit.getMoreNurses();
                      cubit.searchList.clear();
                    });

                  },
                ),
              ),
              20.height,
              Expanded(
                child: ListView.builder(
                  controller: cubit.scrollController,
                  itemCount: nurseList.length,
                  itemBuilder: (context, index) =>nurseList.isNotEmpty? NurseFilterListViewItem(
                    id: index,
                    age: nurseList[index].age!,
                    image: nurseList[index].image!,
                    name: getLanguage() == 'ar'
                        ? nurseList[index].name!.ar!
                        : nurseList[index].name!.en!,
                    description: getLanguage() == 'ar'
                        ? nurseList[index].description!.ar!
                        : nurseList[index].description!.en!,
                    onTap: () {
                      context.pushNamed(Routes.nurseView,
                          arguments: {'index': index, 'nurse': nurseList[index]});
                    },
                  ):const NoResultWidget(),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
