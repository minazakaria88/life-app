import 'package:flutter/material.dart';

import '../../../../core/functions/get_language.dart';
import '../../../../generated/l10n.dart';
import '../manager/delegation_cubit.dart';

class NationalitySearchAnchor extends StatefulWidget {
  const NationalitySearchAnchor({
    super.key,
    required this.cubit,
  });

  final DelegationCubit cubit;

  @override
  State<NationalitySearchAnchor> createState() =>
      _NationalitySearchAnchorState();
}

class _NationalitySearchAnchorState extends State<NationalitySearchAnchor> {
  SearchController controller = SearchController();

  @override
  void initState() {
    if(widget.cubit.selectedNationalityId!=0)
      {
        final selectedNationality = widget.cubit.nationalities
            .firstWhere((e) => e.id == widget.cubit.selectedNationalityId,);
        controller.text = getLanguage() == 'ar'
            ? selectedNationality.names.ar
            : selectedNationality.names.en;
      }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SearchAnchor.bar(
        isFullScreen: false,
        barHintText: S.of(context).nationality,
        searchController: controller,
        onChanged: (value){
          widget.cubit.selectedNationalityId = 0;
        },
        suggestionsBuilder: (context, controller) {
          final String input = controller.text;
          return widget.cubit.nationalities
              .where((element) => getLanguage() == 'en'
                  ? element.names.en.toLowerCase().contains(input.toLowerCase())
                  : element.names.ar
                      .toLowerCase()
                      .contains(input.toLowerCase()))
              .map((e) => ListTile(
                    onTap: () {
                      controller.closeView(
                          getLanguage() == 'en' ? e.names.en : e.names.ar);
                      widget.cubit.selectedNationalityId = e.id;
                    },
                    title:
                        Text(getLanguage() == 'ar' ? e.names.ar : e.names.en),
                  ))
              .toList();

        });
  }
}
