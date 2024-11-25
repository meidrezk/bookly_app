import 'package:booklyapp/core/utils/service_locator.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo_impl.dart';
import 'package:booklyapp/features/home/presentation/manager/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => FetchSimilarBooksCubit(getIt.get<HomeRepoImpl>())
          ..fetchSimilarBooks(category: bookModel.volumeInfo!.categories![0]),
        child: BookDetailsViewBody(
          bookModel: bookModel,
        ),
      ),
    );
  }
}
