import 'package:booklyapp/constants.dart';
import 'package:booklyapp/core/utils/colors_data.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/book_rating.dart';
import 'package:booklyapp/features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class SearchResultListViewItem extends StatelessWidget {
  const SearchResultListViewItem({super.key, required this.bookModel});
final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130,
      child: Row(
        children: [
            CustomBookImage(imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ?? '',),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  bookModel.volumeInfo?.title??"",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyleS20.copyWith(
                    fontFamily: kGtSectraFine,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  bookModel.volumeInfo?.authors?[0]??"",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.textStyleS14
                      .copyWith(color: ColorsData.kGreyColor),
                ),
                Row(
                  children: [
                    const Text(
                      'Free',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: Styles.textStyleS20,
                    ),
                    const Spacer(),
                    BookRating( 
                      rating:bookModel.volumeInfo?.averageRating?? 0,
                            
                        count: bookModel.volumeInfo?.ratingsCount??0,
                        ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
