import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'search_books_state.dart';

class SearchBooksCubit extends Cubit<SearchBooksState> {
  SearchBooksCubit(this.searchRepo) : super(SearchBooksInitial());

  final SearchRepo searchRepo;
  Future<void> searchForBook({required String name}) async {
    emit(SearchBooksLoading());
    var result = await searchRepo.searchForBook(name: name);
    result.fold(
      (failure) {
        emit(SearchBooksFailure(
          errMessage: failure.errMessage,
        ));
      },
      (books) {
        emit(SearchBooksSuccess(books: books));
      },
    );
  }
}
