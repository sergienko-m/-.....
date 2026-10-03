import 'package:flutter/material.dart';

import '../models/contact.dart';
import '../widgets/contact_card.dart';

/// Єдиний екран застосунку-візитівки.
class BusinessCardScreen extends StatelessWidget {
  const BusinessCardScreen({
    super.key,
    required this.isDark,
    required this.onToggleTheme,
  });

  final bool isDark;
  final VoidCallback onToggleTheme;

  // TODO: замініть на власні дані.
  static const String _name = 'Іван Петренко';
  static const String _initials = 'ІП';
  static const String _specialty = 'Flutter-розробник';

  static const List<Contact> _contacts = [
    Contact(
      icon: Icons.email_outlined,
      title: 'Email',
      value: 'ivan.petrenko@example.com',
    ),
    Contact(
      icon: Icons.phone_outlined,
      title: 'Телефон',
      value: '+380 00 000 00 00',
    ),
    Contact(
      icon: Icons.code,
      title: 'GitHub',
      value: 'github.com/ivan-petrenko',
    ),
    Contact(
      icon: Icons.location_on_outlined,
      title: 'Місто',
      value: 'Київ, Україна',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Візитівка розробника')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SizedBox(height: 8),
            Center(
              child: CircleAvatar(
                radius: 56,
                backgroundColor: scheme.primaryContainer,
                child: Text(
                  _initials,
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: scheme.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              _name,
              textAlign: TextAlign.center,
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 4),
            Text(
              _specialty,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: scheme.primary,
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: FilledButton.icon(
                onPressed: onToggleTheme,
                icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                label: const Text('Змінити тему'),
              ),
            ),
            const SizedBox(height: 16),
            for (final contact in _contacts) ContactCard(contact: contact),
          ],
        ),
      ),
    );
  }
}
