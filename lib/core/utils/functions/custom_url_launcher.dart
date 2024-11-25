

import 'package:booklyapp/core/utils/widgets/custom_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchBookUrl({
  required BuildContext context,
  required String bookUrl,
}) async {
  final Uri url = Uri.parse(bookUrl);

  try {
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      customSnackBar(context, 'Sorry, unable to open the link.');
    }
  } catch (e) {
    customSnackBar(context, 'An error occurred: $e');
  }
}
