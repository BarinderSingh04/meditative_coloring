import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../screens/loading_dialog.dart';


extension DateUtils on DateTime {
  bool get isToday {
    final now = DateTime.now();
    return now.day == day && now.month == month && now.year == year;
  }

  bool get isYesterday {
    final yesterday = DateTime.now().subtract(const Duration(days: 1));
    return yesterday.day == day &&
        yesterday.month == month &&
        yesterday.year == year;
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}

extension AsyncValueUi on AsyncValue {
  void showLoading(
    BuildContext context,
    AsyncValue? previous,
    void Function(dynamic data) onData,
  ) {
    when(
      data: (data) {
        if (previous != null && previous is AsyncLoading) {
          Navigator.of(context).pop();
        }
        onData(data);
      },
      error: (e, st) {
        if (previous != null && previous is AsyncLoading) {
          Navigator.of(context).pop();
        }
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(error.toString()),
          ),
        );
      },
      loading: () {
        showDialog(
          context: context,
          barrierColor: Colors.white.withOpacity(0.5),
          barrierDismissible: false,
          builder: (context) {
            return const LoadingDialog();
          },
        );
      },
    );
  }
}
