import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../services/dio_exceptions.dart';

class ErrorCustomWidget extends ConsumerWidget {
  final Object error;
  final VoidCallback onRetry;
  const ErrorCustomWidget(
      {required this.error, required this.onRetry, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox.fromSize(
      key: UniqueKey(),
      size: const Size.fromHeight(200),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error),
            const SizedBox(height: 16),
            Text(
              error.toString(),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            if (error is DioExceptions)
              OutlinedButton(
                onPressed: onRetry,
                child: const Text("Retry"),
              ),
          ],
        ),
      ),
    );
  }
}