import 'package:booklyapp/core/utils/colors_data.dart';
import 'package:booklyapp/core/utils/functions/custom_url_launcher.dart';
import 'package:booklyapp/core/utils/widgets/custom_button.dart';
import 'package:booklyapp/core/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class BooksAction extends StatelessWidget {
   const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
              child: CustomButton(
            text: 'Free',
            backgroundColor: Colors.white,
            textColor: Colors.black,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ), onPressed: (){} ,
          )),
          Expanded(
              child: CustomButton(
            fontSize: 16,
            text: 'Free Preview',
            backgroundColor: ColorsData.korangeColor,
            textColor: Colors.white,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              bottomRight: Radius.circular(16),
            ), onPressed: () { 
              launchBookUrl(bookUrl: bookModel.volumeInfo!.previewLink!, context: context);
             },
          )),
        ],
      ),
    );
  }
}
