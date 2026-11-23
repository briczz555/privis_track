import 'dart:async';

import 'package:flutter/material.dart';

import '../theme/app_shapes.dart';
import '../theme/app_spacing.dart';

/// Satu opsi pada [SearchPickerField].
class SearchPickerOption {
  const SearchPickerOption({
    required this.value,
    required this.label,
    this.subtitle,
  });

  /// `null` dipakai untuk opsi khusus seperti "Tanpa proyek"/"Klien baru".
  final String? value;
  final String label;
  final String? subtitle;
}

/// Input bergaya dropdown yang membuka bottom sheet pencarian.
///
/// [onSearch] dipanggil dengan kata kunci (string kosong saat pertama dibuka)
/// dan pemanggil bertanggung jawab membatasi jumlah hasil (mis. 5).
class SearchPickerField extends StatelessWidget {
  const SearchPickerField({
    super.key,
    required this.label,
    required this.selectedValue,
    required this.selectedLabel,
    required this.onSearch,
    required this.onSelected,
    this.leadingOptions = const [],
    this.searchHint = 'Cari...',
    this.emptyText = 'Tidak ada hasil.',
    this.enabled = true,
  });

  final String label;
  final String? selectedValue;
  final String? selectedLabel;
  final Future<List<SearchPickerOption>> Function(String query) onSearch;
  final ValueChanged<SearchPickerOption> onSelected;

  /// Opsi tetap di atas hasil pencarian (mis. "Tanpa proyek").
  final List<SearchPickerOption> leadingOptions;
  final String searchHint;
  final String emptyText;
  final bool enabled;

  Future<void> _open(BuildContext context) async {
    final option = await showModalBottomSheet<SearchPickerOption>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) => _SearchPickerSheet(
        title: label,
        searchHint: searchHint,
        emptyText: emptyText,
        leadingOptions: leadingOptions,
        selectedValue: selectedValue,
        onSearch: onSearch,
      ),
    );

    if (option != null) onSelected(option);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: enabled ? () => _open(context) : null,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          enabled: enabled,
          suffixIcon: const Icon(Icons.search_rounded, size: 18),
        ),
        child: Text(
          selectedLabel ?? searchHint,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: selectedLabel == null
              ? theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                )
              : theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _SearchPickerSheet extends StatefulWidget {
  const _SearchPickerSheet({
    required this.title,
    required this.searchHint,
    required this.emptyText,
    required this.leadingOptions,
    required this.selectedValue,
    required this.onSearch,
  });

  final String title;
  final String searchHint;
  final String emptyText;
  final List<SearchPickerOption> leadingOptions;
  final String? selectedValue;
  final Future<List<SearchPickerOption>> Function(String query) onSearch;

  @override
  State<_SearchPickerSheet> createState() => _SearchPickerSheetState();
}

class _SearchPickerSheetState extends State<_SearchPickerSheet> {
  final _queryController = TextEditingController();
  Timer? _debounce;
  List<SearchPickerOption> _results = const [];
  bool _loading = true;
  bool _failed = false;
  int _requestId = 0;

  @override
  void initState() {
    super.initState();
    _search('');
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _queryController.dispose();
    super.dispose();
  }

  void _onQueryChanged(String value) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () => _search(value));
    setState(() {}); // tombol clear mengikuti isi kolom
  }

  Future<void> _search(String query) async {
    final requestId = ++_requestId;
    setState(() {
      _loading = true;
      _failed = false;
    });

    try {
      final results = await widget.onSearch(query.trim());
      if (!mounted || requestId != _requestId) return;
      setState(() {
        _results = results;
        _loading = false;
      });
    } catch (_) {
      if (!mounted || requestId != _requestId) return;
      setState(() {
        _failed = true;
        _loading = false;
      });
    }
  }

  void _select(SearchPickerOption option) {
    Navigator.of(context).pop(option);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final viewInsets = MediaQuery.viewInsetsOf(context).bottom;
    final height = (MediaQuery.sizeOf(context).height - viewInsets) * 0.72;

    return Padding(
      padding: EdgeInsets.only(bottom: viewInsets),
      child: SizedBox(
        height: height,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: Text(
                widget.title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: TextField(
                key: const ValueKey('searchPickerQuery'),
                controller: _queryController,
                autofocus: true,
                textInputAction: TextInputAction.search,
                onChanged: _onQueryChanged,
                decoration: InputDecoration(
                  hintText: widget.searchHint,
                  prefixIcon: const Icon(Icons.search_rounded),
                  suffixIcon: _queryController.text.isEmpty
                      ? null
                      : IconButton(
                          tooltip: 'Hapus pencarian',
                          onPressed: () {
                            _queryController.clear();
                            _onQueryChanged('');
                          },
                          icon: const Icon(Icons.close_rounded),
                        ),
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.sm),
            Expanded(child: _buildBody(context)),
          ],
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);

    if (_failed) {
      return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Gagal memuat data.',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
            TextButton(
              onPressed: () => _search(_queryController.text),
              child: const Text('Coba lagi'),
            ),
          ],
        ),
      );
    }

    final showEmpty = !_loading && _results.isEmpty;

    return ListView(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      children: [
        for (final option in widget.leadingOptions)
          _optionTile(context, option),
        if (_loading) const LinearProgressIndicator(minHeight: 2),
        for (final option in _results) _optionTile(context, option),
        if (showEmpty)
          Padding(
            padding: const EdgeInsets.all(AppSpacing.lg),
            child: Center(
              child: Text(
                widget.emptyText,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.6),
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _optionTile(BuildContext context, SearchPickerOption option) {
    final selected = option.value == widget.selectedValue;

    return ListTile(
      dense: true,
      title: Text(option.label),
      subtitle: option.subtitle == null ? null : Text(option.subtitle!),
      trailing: selected ? const Icon(Icons.check_rounded, size: 18) : null,
      onTap: () => _select(option),
    );
  }
}
