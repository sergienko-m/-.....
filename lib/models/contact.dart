import 'package:flutter/widgets.dart';

/// Модель одного контакту: іконка + підпис.
class Contact {
  const Contact({
    required this.icon,
    required this.title,
    required this.value,
  });

  final IconData icon;
  final String title;
  final String value;
}
