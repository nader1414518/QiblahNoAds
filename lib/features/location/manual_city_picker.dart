import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/l10n/l10n_extensions.dart';
import '../../core/models/models.dart';
import '../../core/widgets/safe_area_widgets.dart';
import '../../l10n/app_localizations.dart';
import '../../providers/app_providers.dart';

class ManualCityPicker extends ConsumerStatefulWidget {
  const ManualCityPicker({
    super.key,
    this.errorCode,
    this.onSelected,
    this.bottomSafeArea = true,
  });

  final String? errorCode;
  final VoidCallback? onSelected;
  final bool bottomSafeArea;

  @override
  ConsumerState<ManualCityPicker> createState() => _ManualCityPickerState();
}

class _ManualCityPickerState extends ConsumerState<ManualCityPicker> {
  List<City> _cities = [];
  List<City> _filtered = [];
  bool _loading = true;
  final _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadCities();
    _searchController.addListener(_filter);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadCities() async {
    final cities = await ref.read(locationServiceProvider).loadCities();
    setState(() {
      _cities = cities;
      _filtered = cities;
      _loading = false;
    });
  }

  void _filter() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filtered = _cities.where((city) {
        return city.displayName.toLowerCase().contains(query);
      }).toList();
    });
  }

  Future<void> _selectCity(City city) async {
    await ref.read(locationProvider.notifier).selectCity(city);
    widget.onSelected?.call();
    if (mounted && Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final message = l10n.locationErrorMessage(widget.errorCode);

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.selectCity),
      ),
      body: SafeScreenBody(
        bottom: widget.bottomSafeArea,
        child: Column(
          children: [
            if (message != null)
              Padding(
                padding: const EdgeInsets.all(16),
                child: Text(
                  message,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: l10n.searchCityHint,
                  border: const OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: _loading
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.separated(
                      itemCount: _filtered.length,
                      separatorBuilder: (_, __) => const Divider(height: 1),
                      itemBuilder: (context, index) {
                        final city = _filtered[index];
                        return ListTile(
                          title: Text(city.name),
                          subtitle: Text(city.country),
                          onTap: () => _selectCity(city),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
