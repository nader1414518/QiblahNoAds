import 'dart:convert';

import 'package:flutter/services.dart';

import '../core/models/models.dart';

class AzkarService {
  static const _categories = ['morning', 'evening', 'post_prayer'];

  Future<Map<String, List<AzkarItem>>> loadAll() async {
    final result = <String, List<AzkarItem>>{};

    for (final category in _categories) {
      final raw = await rootBundle.loadString('lib/data/azkar/$category.json');
      final decoded = jsonDecode(raw) as List<dynamic>;
      result[category] = decoded
          .map((entry) => AzkarItem.fromJson(entry as Map<String, dynamic>))
          .toList();
    }

    return result;
  }
}
