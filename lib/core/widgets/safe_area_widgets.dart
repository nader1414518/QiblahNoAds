import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';

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

/// Icon button that dismisses the current modal route.
class ModalCloseButton extends StatelessWidget {
  const ModalCloseButton({
    super.key,
    this.onPressed,
  });

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return IconButton(
      icon: const Icon(Icons.close),
      tooltip: l10n.close,
      onPressed: onPressed ?? () => Navigator.maybePop(context),
    );
  }
}

/// Title row with a close button for bottom sheets.
class SheetHeader extends StatelessWidget {
  const SheetHeader({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        const ModalCloseButton(),
      ],
    );
  }
}

/// Title row with a close button for dialogs.
class DialogHeader extends StatelessWidget {
  const DialogHeader({
    super.key,
    required this.title,
    this.onClose,
  });

  final String title;
  final VoidCallback? onClose;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ModalCloseButton(onPressed: onClose),
      ],
    );
  }
}
