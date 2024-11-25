import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/utils/styles.dart';
import 'book_rating.dart';
import 'books_action.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * .2,
          ),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text( textAlign: TextAlign.center,
          bookModel.volumeInfo?.title ?? "",
          style: Styles.textStyleS30W900.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: .7,
          child: Text(
                  bookModel.volumeInfo?.authors?[0]??"",
            style: Styles.textStyleS18W600.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
         BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
                        count: bookModel.volumeInfo?.ratingsCount??0,
                      rating:bookModel.volumeInfo?.averageRating?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
         BooksAction(bookModel: bookModel,),
      ],
    );
  }
}
