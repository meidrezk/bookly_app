import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/app_router.dart';
import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/features/home/presentation/manager/fetch_featured_books_cubit/fetch_featured_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/widgets/custom_loading_indicator.dart';

class FeaturedBooksListView extends StatelessWidget {
  const FeaturedBooksListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchFeaturedBooksCubit, FetchFeaturedBooksState>(
      builder: (context, state) {
        if (state is FetchFeaturedBooksSuccess) {
          return SizedBox(
            height: deviceScreenHeight(context: context) * 0.3,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                padding: const EdgeInsets.only(right: 15),
                child: InkWell(
                    onTap: () => GoRouter.of(context)
                        .push(AppRouter.bookDetailsViewPath, extra: state.books[index]),
                    child: CustomBookImage(
                      imageUrl:
                          state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                              '',
                    ),
                    ),
              ),
              itemCount: state.books.length,
            ),
          );
        } else if (state is FetchFeaturedBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          print("============ $state");
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
