part of 'fetch_similar_books_cubit.dart';

abstract class FetchSimilarBooksState extends Equatable {
  const FetchSimilarBooksState();

  @override
  List<Object> get props => [];
}

 class FetchSimilarBooksInitial extends FetchSimilarBooksState {}
 class FetchSimilarBooksFailure extends FetchSimilarBooksState {
  final String errMessage;

  const FetchSimilarBooksFailure({required this.errMessage});
 }
 class FetchSimilarBooksLoading extends FetchSimilarBooksState {}
 class FetchSimilarBooksSuccess extends FetchSimilarBooksState {
  final List<BookModel>books;

  const FetchSimilarBooksSuccess({required this.books});
 }
