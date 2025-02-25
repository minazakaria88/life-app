import 'package:flutter/material.dart';
import 'package:life/features/faq/data/models/faq_model.dart';

import '../../../../generated/l10n.dart';

class FaqScreen extends StatefulWidget {
  const FaqScreen({super.key});

  @override
  State<FaqScreen> createState() => _FaqScreenState();
}

class _FaqScreenState extends State<FaqScreen> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).faq),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (context, index) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      getFaqList()[index].question,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (selectedIndex == index) {
                        selectedIndex = -1;
                      } else {
                        selectedIndex = index;
                      }
                      setState(() {});
                    },
                    icon: index == selectedIndex
                        ? const Icon(Icons.close)
                        : const Icon(Icons.add),
                  )
                ],
              ),
              AnimatedSize(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
                child: index == selectedIndex
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                        child: Text(getFaqList()[index].answer),
                      )
                    : const SizedBox.shrink(),
              ),
              const Divider(),
            ],
          ),
          itemCount: getFaqList().length,
        ),
      ),
    );
  }
}
