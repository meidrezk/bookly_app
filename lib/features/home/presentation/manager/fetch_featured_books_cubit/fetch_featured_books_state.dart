part of 'fetch_featured_books_cubit.dart';

abstract class FetchFeaturedBooksState extends Equatable {
  const FetchFeaturedBooksState();

  @override
  List<Object> get props => [];
}

final class FetchFeaturedBooksInitial extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksLoading extends FetchFeaturedBooksState {}
final class FetchFeaturedBooksSuccess extends FetchFeaturedBooksState {
  final List<BookModel> books;

  const FetchFeaturedBooksSuccess(this.books);
}
final class FetchFeaturedBooksFailure extends FetchFeaturedBooksState {
  final String errMessage;

  const FetchFeaturedBooksFailure(this.errMessage);
}
