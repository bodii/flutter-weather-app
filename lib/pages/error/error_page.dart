import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage(this.error, {super.key});

  final Exception error;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page not found")),
      body: Center(
        child: Column(
          children: [
            SelectableText(error.toString()),
            TextButton(
              onPressed: () => context.go('/welcome'),
              child: const Text('welcome'),
            ),
          ],
        ),
      ),
    );
  }
}
