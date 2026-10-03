import 'package:flutter/material.dart';

import '../models/contact.dart';

/// Багаторазова картка контакту. Кольори беруться з поточної теми.
class ContactCard extends StatelessWidget {
  const ContactCard({super.key, required this.contact});

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        leading: Icon(contact.icon, color: scheme.primary),
        title: Text(contact.title, style: theme.textTheme.titleMedium),
        subtitle: Text(
          contact.value,
          style: theme.textTheme.bodyMedium?.copyWith(
            color: scheme.onSurfaceVariant,
          ),
        ),
      ),
    );
  }
}
