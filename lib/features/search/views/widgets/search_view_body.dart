import 'package:booklyapp/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:booklyapp/features/search/views/widgets/search_result_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomSearchTextField(onSubmitted: (value) {
                BlocProvider.of<SearchBooksCubit>(context).searchForBook(name: value);
              },),
              const SizedBox(
                height: 16,
              ),
              const Text(
                'Search Result',
                style: Styles.textStyleS18W600,
              ),
              const SizedBox(
                height: 16,
              ),
              const Expanded(
                child: SearchResultListView(),
              ),
            ],
          ),
        );
      },
    );
  }
}
