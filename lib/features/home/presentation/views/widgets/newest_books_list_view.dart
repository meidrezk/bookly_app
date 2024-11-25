import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/features/home/presentation/manager/newest_books/newest_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/newest_books_list_view_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/widgets/custom_error_widget.dart';
import '../../../../../core/utils/widgets/custom_loading_indicator.dart';

class NewestBooksListView extends StatelessWidget {
  const NewestBooksListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemCount: state.newsetBooks.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: InkWell(
                  onTap: () =>
                      GoRouter.of(context).push(AppRouter.bookDetailsViewPath,extra: state.newsetBooks[index]),
                  child: NewestBooksListViewItem(
                    bookModel: state.newsetBooks[index],
                  )),
            );
          },
        );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          print("============ $state");
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
