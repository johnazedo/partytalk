import 'package:flutter/material.dart';
import 'package:talk/ui/components/app_bar.dart';
import 'package:talk/ui/constants/colors.dart';
import 'package:talk/ui/screens/search/components/search_field.dart';
import 'package:talk/ui/screens/search/components/search_result_list.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [getSearchSliverAppBar(context)],
          body: Column(
            children: [
              Container(
                color: CustomColors.backgroundColor,
                child: const SearchField(),
              ),
              const SizedBox(height: 15),
              const Expanded(
                child: SearchResultList(),
              ),
            ],
          )),
    );
  }
}
