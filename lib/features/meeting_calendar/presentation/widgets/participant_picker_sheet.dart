import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../user_management/presentation/widgets/user_role_style.dart';
import '../../domain/entities/user_option_entity.dart';

class ParticipantPickerSheet extends StatefulWidget {
  const ParticipantPickerSheet({
    super.key,
    required this.options,
    required this.initialSelected,
    required this.lockedUserId,
  });

  final List<UserOptionEntity> options;
  final Set<String> initialSelected;
  final String? lockedUserId;

  @override
  State<ParticipantPickerSheet> createState() => _ParticipantPickerSheetState();
}

class _ParticipantPickerSheetState extends State<ParticipantPickerSheet> {
  late final Set<String> _selected = {...widget.initialSelected};
  final _searchController = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filtered = widget.options
        .where((option) {
          final query = _query.toLowerCase();
          return query.isEmpty ||
              option.name.toLowerCase().contains(query) ||
              (option.division ?? '').toLowerCase().contains(query);
        })
        .toList(growable: false);

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.7,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.md,
                  AppSpacing.sm,
                ),
                child: Row(
                  children: [
                    Text('Pilih Peserta', style: theme.textTheme.titleMedium),
                    const Spacer(),
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(_selected),
                      child: const Text('Selesai'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: TextField(
                  controller: _searchController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search_rounded),
                    hintText: 'Cari nama atau divisi',
                  ),
                  onChanged: (value) => setState(() => _query = value.trim()),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              Expanded(
                child: filtered.isEmpty
                    ? const Center(child: Text('Tidak ada user yang cocok.'))
                    : ListView.builder(
                        itemCount: filtered.length,
                        itemBuilder: (context, index) {
                          final option = filtered[index];
                          final locked = option.id == widget.lockedUserId;
                          return CheckboxListTile(
                            value: _selected.contains(option.id),
                            onChanged: locked
                                ? null
                                : (checked) {
                                    setState(() {
                                      if (checked == true) {
                                        _selected.add(option.id);
                                      } else {
                                        _selected.remove(option.id);
                                      }
                                    });
                                  },
                            title: Text(option.name),
                            subtitle: Text(
                              '${option.role.label} · '
                              '${option.division ?? 'Tanpa divisi'}'
                              '${locked ? ' · Anda' : ''}',
                            ),
                            secondary: CircleAvatar(
                              radius: 16,
                              backgroundColor: option.role.color.withValues(
                                alpha: 0.12,
                              ),
                              child: Text(
                                _initials(option.name),
                                style: theme.textTheme.labelSmall?.copyWith(
                                  color: option.role.color,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

String _initials(String name) {
  final words = name.trim().split(RegExp(r'\s+'));
  if (words.isEmpty) return '?';
  return words.take(2).map((word) => word[0].toUpperCase()).join();
}
