import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'fetch_featured_books_state.dart';

class FetchFeaturedBooksCubit extends Cubit<FetchFeaturedBooksState> {
  FetchFeaturedBooksCubit(this.homeRepo) : super(FetchFeaturedBooksInitial());
  final HomeRepo homeRepo;
Future<void> fetchFeaturedBooks() async {
  emit(FetchFeaturedBooksLoading());
  print('Loading state emitted.');
  var result = await homeRepo.fetchFeaturedBooks();
  result.fold(
    (failure) {
      print('Failure: ${failure.errMessage}');
      emit(FetchFeaturedBooksFailure(failure.errMessage));
    },
    (books) {
      print('Success: Fetched ${books.length} books');
      emit(FetchFeaturedBooksSuccess(books));
    },
  );
}
}
