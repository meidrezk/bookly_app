import 'package:flutter/material.dart';


   void customSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        behavior: SnackBarBehavior.floating,
        backgroundColor: const Color.fromARGB(255, 82, 186, 255),
        duration: const Duration(seconds: 3),
      ),
    );
  }

