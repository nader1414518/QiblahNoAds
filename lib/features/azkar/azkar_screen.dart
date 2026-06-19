import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/enums.dart';
import '../../core/models/models.dart';
import 'tasbih_screen.dart';
import 'widgets/azkar_list_tile.dart';

class AzkarScreen extends ConsumerStatefulWidget {
  const AzkarScreen({super.key});

  @override
  ConsumerState<AzkarScreen> createState() => _AzkarScreenState();
}

class _AzkarScreenState extends ConsumerState<AzkarScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, List<AzkarItem>> _azkar = {};
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _loadAzkar();
  }

  Future<void> _loadAzkar() async {
    final raw = await rootBundle.loadString('lib/data/azkar.json');
    final decoded = jsonDecode(raw) as Map<String, dynamic>;
    setState(() {
      _azkar = decoded.map((key, value) {
        final items = (value as List<dynamic>)
            .map((entry) => AzkarItem.fromJson(entry as Map<String, dynamic>))
            .toList();
        return MapEntry(key, items);
      });
      _loading = false;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final categories = [
      AzkarCategory.morning,
      AzkarCategory.evening,
      AzkarCategory.postPrayer,
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Azkar'),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories.map((c) => Tab(text: c.label)).toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const TasbihScreen()),
          );
        },
        icon: const Icon(Icons.touch_app_outlined),
        label: const Text('Tasbih'),
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : TabBarView(
              controller: _tabController,
              children: categories.map((category) {
                final items = _azkar[category.jsonKey] ?? [];
                return ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    return AzkarListTile(item: items[index]);
                  },
                );
              }).toList(),
            ),
    );
  }
}
