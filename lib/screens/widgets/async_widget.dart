import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'error_widget.dart';
import 'loading_widget.dart';

class AsyncWidget<T> extends StatelessWidget {
  final AsyncValue<T> value;
  final Widget Function(T) data;
  final void Function() onRetry;

  const AsyncWidget({
    Key? key,
    required this.value,
    required this.onRetry,
    required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      child: value.when(
        data: data,
        loading: () => const LoadingWidget(),
        error: (e, st) => ErrorCustomWidget(
          error: e,
          onRetry: onRetry,
        ),
      ),
    );
  }
}
