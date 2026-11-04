
import 'package:flutter/material.dart';
import 'package:movie_app/core/widgets/snack_bar_type.dart';


class CustomSnackBar {
  static ScaffoldFeatureController<SnackBar, SnackBarClosedReason> show(
        BuildContext context, {
        required String message,
        required SnackBarType type,
      }) {
    Color backgroundColor;
    IconData icon;

    switch (type) {
      case SnackBarType.success:
        backgroundColor = Colors.green;
        icon = Icons.check_circle;
        break;

      case SnackBarType.error:
        backgroundColor = Colors.red;
        icon = Icons.error;
        break;

      case SnackBarType.warning:
        backgroundColor = Colors.orange;
        icon = Icons.warning;
        break;

      case SnackBarType.info:
        backgroundColor = Colors.blue;
        icon = Icons.info;
        break;
    }

    final messenger = ScaffoldMessenger.of(context);

    messenger.hideCurrentSnackBar();

    return messenger.showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        content: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                message,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
