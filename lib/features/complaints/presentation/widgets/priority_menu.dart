import 'package:flutter/material.dart';
import 'package:life/core/functions/get_language.dart';
import 'package:life/core/widgets/my_dropdown_menu.dart';
import '../../../../generated/l10n.dart';
import '../../data/models/ticket_priority_model.dart';
import '../manager/complaints_cubit.dart';

class PriorityMenu extends StatelessWidget {
  const PriorityMenu({
    super.key,
    required this.cubit,
  });

  final ComplaintsCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: MyDropDownMenu(
            initialValue: cubit.priority,
            label: S.of(context).ticket_priority,
            onSelected: (value) {
              cubit.priority = value!;
            },
            dropdownMenuEntries: ticketPriorities.map((e) {
              return DropdownMenuEntry(
                label: getLanguage() == 'ar'
                    ? e.names.ar
                    : e.names.en,
                value: e.id,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
