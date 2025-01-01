import 'package:flutter/material.dart';
import 'package:flutter_boilerplate/shared/presentation/widgets/molecules/custom_dialog_content.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomAlertDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: CustomDialogContent(
        title: title,
        message: message,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
    );
  }
}
