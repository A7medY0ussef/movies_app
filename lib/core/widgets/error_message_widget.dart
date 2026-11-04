import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/core/theme/app_text_style.dart';

class ErrorMessageWidget extends StatelessWidget {
  final String errorMessage;
  const ErrorMessageWidget({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage.tr(),
        textAlign: TextAlign.center,
        style: AppText.s18w6.copyWith(color: Colors.red),
      ),
    );
  }
}