import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/features/search/presentation/manager/search_books_cubit/search_books_cubit.dart';
import 'package:booklyapp/features/search/views/widgets/search_result_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBooksCubit, SearchBooksState>(
      builder: (context, state) {
        if (state is SearchBooksSuccess) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () => GoRouter.of(context).push(
                    AppRouter.bookDetailsViewPath,
                    extra: state.books[index]),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: SearchResultListViewItem(
                    bookModel: state.books[index],
                  ),
                ),
              );
            },
          );
        } else if (state is SearchBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is SearchBooksLoading) {
          print("============ $state");
          return const CustomLoadingIndicator();
        } else {
          return const Text("");
        }
      },
    );
  }
}
