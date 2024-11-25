import 'package:booklyapp/core/utils/colors_data.dart';
import 'package:booklyapp/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookRating extends StatelessWidget {
   const BookRating({
    super.key,
    this.mainAxisAlignment, required this.rating, required this.count,
  });
  final MainAxisAlignment? mainAxisAlignment;
  final num rating;
  final int count;
  
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
      children: [
        Icon(
          FontAwesomeIcons.solidStar,
          color: ColorsData.kAmberStarColor,
          size: 14,
        ),
        const SizedBox(
          width: 5,
        ),
        Text(
          "$rating",
          style: Styles.textStyleS16W500,
        ),
        const SizedBox(
          width: 9,
        ),
         Text(
                   "($count)",

          style: Styles.textStyleS14,
        ),
      ],
    );
  }
}
