import 'package:booklyapp/core/utils/api_service.dart';
import 'package:booklyapp/core/utils/errors/failure.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/data/repos/home_repo.dart';
import 'package:booklyapp/features/search/data/repos/search_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    String endPoint = 'volumes?Filtering=free-ebooks&q=programming';
    final Map<String, dynamic> response;
    try {
      response = await apiService.get(endPoint: endPoint);

     
    
List<BookModel> books = (response['items'] as List)
    .map((item) => BookModel.fromJson(item))
    .toList();
return Right(books);
 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewstBooks() async {
    String endPoint =
        'volumes?Filtering=free-ebooks&Sorting=newest &q=computer science';
    try {
      final response = await apiService.get(endPoint: endPoint);

      List<BookModel> books = (response['items'] as List)
          .map((item) => BookModel.fromJson(item))
          .toList();

      return Right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks({required String category}) async{
     String endPoint ='volumes?Filtering=free-ebooks&Sorting=relevance &q=subject:Programming';     ;
    final Map<String, dynamic> response;
    try {
      response = await apiService.get(endPoint: endPoint);

     
    
List<BookModel> books = (response['items'] as List)
    .map((item) => BookModel.fromJson(item))
    .toList();
return Right(books);
 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
    
  }
  
  @override
  Future<Either<Failure, List<BookModel>>> searchForBook({required String name}) async{
     String endPoint ='volumes?Filtering=free-ebooks&Sorting&q=subject:$name';     ;
    final Map<String, dynamic> response;
    try {
      response = await apiService.get(endPoint: endPoint);

     
    
List<BookModel> books = (response['items'] as List)
    .map((item) => BookModel.fromJson(item))
    .toList();
return Right(books);
 
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
    
  }
}
