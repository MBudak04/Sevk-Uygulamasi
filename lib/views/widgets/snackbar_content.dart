import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class SnackBarMessage {
  static void showSnackBarSucces(BuildContext context, String message) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.success(message: message),snackBarPosition: SnackBarPosition.bottom);
  }

  static void showSnackBarError(BuildContext context, String message) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.error(message: message),snackBarPosition: SnackBarPosition.bottom);
  }

  static void showSnackBarInfo(BuildContext context, String message) {
    showTopSnackBar(
        Overlay.of(context), CustomSnackBar.info(message: message),snackBarPosition: SnackBarPosition.bottom);
  }
}
