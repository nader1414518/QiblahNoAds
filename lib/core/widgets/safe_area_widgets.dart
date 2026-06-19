import 'package:flutter/material.dart';

/// Scaffold body when an [AppBar] handles the top inset.
class SafeScreenBody extends StatelessWidget {
  const SafeScreenBody({
    super.key,
    required this.child,
    this.bottom = true,
  });

  final Widget child;
  final bool bottom;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: bottom,
      child: child,
    );
  }
}

/// Full-screen content without an app bar (loading / gate states).
class SafeFullBody extends StatelessWidget {
  const SafeFullBody({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: child);
  }
}

/// Modal bottom sheet content with safe area and keyboard inset.
class SafeSheet extends StatelessWidget {
  const SafeSheet({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: child,
      ),
    );
  }
}

/// Dialog content kept inside display cutouts and system bars.
class SafeDialog extends StatelessWidget {
  const SafeDialog({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: child,
    );
  }
}
