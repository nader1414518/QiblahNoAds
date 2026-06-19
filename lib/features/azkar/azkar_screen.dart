import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/l10n_extensions.dart';
import '../../core/models/enums.dart';
import '../../core/models/models.dart';
import '../../core/widgets/premium_widgets.dart';
import '../../core/widgets/safe_area_widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../services/azkar_service.dart';
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
    final azkar = await AzkarService().loadAll();
    if (!mounted) {
      return;
    }
    setState(() {
      _azkar = azkar;
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
    final l10n = AppLocalizations.of(context);
    final categories = [
      AzkarCategory.morning,
      AzkarCategory.evening,
      AzkarCategory.postPrayer,
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.azkarTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: categories
              .map((c) => Tab(text: l10n.azkarCategoryName(c)))
              .toList(),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(
            MaterialPageRoute<void>(builder: (_) => const TasbihScreen()),
          );
        },
        icon: const Icon(Icons.touch_app_outlined),
        label: Text(l10n.tasbih),
      ),
      body: SafeScreenBody(
        bottom: false,
        child: _loading
            ? const Center(child: CircularProgressIndicator())
            : TabBarView(
                controller: _tabController,
                children: categories.map((category) {
                  final items = _azkar[category.jsonKey] ?? [];
                  return ListView(
                    padding: const EdgeInsets.all(16),
                    children: [
                      SectionHeader(
                        title: l10n.azkarCategoryName(category),
                        subtitle: l10n.azkarCategoryDescription(category),
                      ),
                      const SizedBox(height: 12),
                      ...items.map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(bottom: 12),
                          child: AzkarListTile(item: item),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
      ),
    );
  }
}
