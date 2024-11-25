import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class SearchRepo{

  Future<Either<Failure, List<BookModel>>> searchForBook({required String name});
}