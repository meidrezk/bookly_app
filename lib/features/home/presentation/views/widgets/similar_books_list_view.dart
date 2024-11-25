import 'package:booklyapp/core/utils/widgets/custom_error_widget.dart';
import 'package:booklyapp/core/utils/widgets/custom_loading_indicator.dart';
import 'package:booklyapp/features/home/presentation/manager/fetch_similar_books_cubit/fetch_similar_books_cubit.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListview extends StatelessWidget {
  const SimilarBooksListview({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSimilarBooksCubit, FetchSimilarBooksState>(
      builder: (context, state) {
 if (state is FetchSimilarBooksSuccess) {
 return SizedBox(
          height: MediaQuery.of(context).size.height * .15,
          child: ListView.builder(itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: CustomBookImage(
                    imageUrl: 
  state.books[index].volumeInfo?.imageLinks?.thumbnail ??
                              '',                  ),
                );
              }),
        );
        } else if (state is FetchSimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          print("============ $state");
          return const CustomLoadingIndicator();
        }
      
       
      },
    );
  }
}
