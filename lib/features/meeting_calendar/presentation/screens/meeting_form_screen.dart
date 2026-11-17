import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/error_message.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../dashboard/domain/entities/project_entity.dart';
import '../../domain/entities/meeting_entity.dart';
import '../../domain/entities/meeting_input_entity.dart';
import '../../domain/entities/meeting_mode.dart';
import '../../domain/entities/user_option_entity.dart';
import '../providers/meeting_provider.dart';
import '../widgets/participant_picker_sheet.dart';

class MeetingFormScreen extends ConsumerStatefulWidget {
  const MeetingFormScreen({super.key, this.initial});

  final MeetingEntity? initial;

  @override
  ConsumerState<MeetingFormScreen> createState() => _MeetingFormScreenState();
}

class _MeetingFormScreenState extends ConsumerState<MeetingFormScreen> {
  static const _noProject = '__none__';

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _agendaController = TextEditingController();
  final _urlController = TextEditingController();
  final _locationController = TextEditingController();
  final _notesController = TextEditingController();

  late DateTime _startAt;
  late DateTime _endAt;
  late MeetingMode _mode;
  String? _projectCode;
  late Set<String> _participantIds;
  String? _lockedParticipantId;
  bool _isSubmitting = false;
  String? _error;

  bool get _isEdit => widget.initial != null;

  @override
  void initState() {
    super.initState();
    final initial = widget.initial;
    final now = DateTime.now();
    final defaultStart = _roundUp(now.add(const Duration(hours: 1)));

    if (initial != null) {
      _titleController.text = initial.title;
      _agendaController.text = initial.agenda ?? '';
      _urlController.text = initial.meetingUrl ?? '';
      _locationController.text = initial.location ?? '';
      _notesController.text = initial.notes ?? '';
      _startAt = initial.startAt;
      _endAt = initial.endAt;
      _mode = initial.mode;
      _projectCode = initial.project?.code;
      _participantIds = {
        for (final participant in initial.participants) participant.id,
      };
      _lockedParticipantId = initial.organizer.id;
    } else {
      _startAt = defaultStart;
      _endAt = defaultStart.add(const Duration(hours: 1));
      _mode = MeetingMode.online;
      _participantIds = {};
      final currentUserId = ref.read(authControllerProvider).value?.user.id;
      if (currentUserId != null) {
        _participantIds.add(currentUserId);
        _lockedParticipantId = currentUserId;
      }
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _agendaController.dispose();
    _urlController.dispose();
    _locationController.dispose();
    _notesController.dispose();
    super.dispose();
  }

  Future<void> _pickDateTime({required bool isStart}) async {
    final current = isStart ? _startAt : _endAt;
    final date = await showDatePicker(
      context: context,
      initialDate: current,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date == null || !mounted) return;

    final time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(current),
    );
    if (time == null || !mounted) return;

    final picked = DateTime(
      date.year,
      date.month,
      date.day,
      time.hour,
      time.minute,
    );

    setState(() {
      if (isStart) {
        _startAt = picked;
        if (!_endAt.isAfter(_startAt)) {
          _endAt = _startAt.add(const Duration(hours: 1));
        }
      } else {
        _endAt = picked;
      }
      _error = null;
    });
  }

  Future<void> _pickParticipants() async {
    final options = ref.read(meetingUserOptionsProvider).value;
    if (options == null) {
      _showMessage('Daftar karyawan masih dimuat.');
      return;
    }

    final result = await showModalBottomSheet<Set<String>>(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      showDragHandle: true,
      builder: (context) => ParticipantPickerSheet(
        options: options,
        initialSelected: _participantIds,
        lockedUserId: _lockedParticipantId,
      ),
    );

    if (result == null || !mounted) return;
    setState(() {
      _participantIds = result;
      if (_lockedParticipantId != null) {
        _participantIds.add(_lockedParticipantId!);
      }
    });
  }

  Future<void> _submit() async {
    if (_isSubmitting || !_formKey.currentState!.validate()) return;

    if (!_endAt.isAfter(_startAt)) {
      setState(() => _error = 'Waktu selesai harus setelah waktu mulai.');
      return;
    }
    if (_endAt.difference(_startAt) > const Duration(hours: 24)) {
      setState(() => _error = 'Durasi meeting maksimal 24 jam.');
      return;
    }

    final url = _urlController.text.trim();
    if (_mode == MeetingMode.online && url.isNotEmpty) {
      final uri = Uri.tryParse(url);
      if (uri == null ||
          (uri.scheme != 'http' && uri.scheme != 'https') ||
          uri.host.isEmpty) {
        setState(() => _error = 'Link meeting harus URL http/https.');
        return;
      }
    }

    if (_mode == MeetingMode.onsite &&
        _locationController.text.trim().isEmpty &&
        _projectCode == null) {
      setState(
        () => _error =
            'Isi lokasi onsite atau pilih proyek yang memiliki alamat klien.',
      );
      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    final participants = {..._participantIds};
    if (_lockedParticipantId != null) {
      participants.add(_lockedParticipantId!);
    }

    final input = MeetingInputEntity(
      title: _titleController.text.trim(),
      agenda: _agendaController.text.trim(),
      mode: _mode,
      startAt: _startAt,
      endAt: _endAt,
      meetingUrl: _mode == MeetingMode.online
          ? _urlController.text.trim()
          : null,
      location: _mode == MeetingMode.onsite
          ? _locationController.text.trim()
          : null,
      projectCode: _projectCode,
      participantIds: participants.toList(growable: false),
      notes: _notesController.text.trim(),
    );

    try {
      final meeting = _isEdit
          ? await ref
                .read(updateMeetingUsecaseProvider)
                .call(widget.initial!.id, input)
          : await ref.read(createMeetingUsecaseProvider).call(input);

      if (!mounted) return;
      ref.invalidate(meetingsProvider);
      Navigator.of(context).pop(meeting);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = readableErrorMessage(error));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final session = ref.watch(authControllerProvider).value;
    final userOptions = ref.watch(meetingUserOptionsProvider).value;
    final projects = ref.watch(meetingProjectOptionsProvider).value;

    final currentUserId = session?.user.id;
    if (!_isEdit && currentUserId != null && _lockedParticipantId == null) {
      _lockedParticipantId = currentUserId;
      _participantIds.add(currentUserId);
    }

    final loadedProjects = projects ?? const <ProjectEntity>[];
    final hasSelectedProject =
        _projectCode != null &&
        loadedProjects.any((project) => project.code == _projectCode);

    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Meeting' : 'Meeting Baru')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              TextFormField(
                controller: _titleController,
                enabled: !_isSubmitting,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(labelText: 'Judul meeting'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Judul meeting wajib diisi.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              _DateTimeField(
                label: 'Mulai',
                value: _startAt,
                onTap: () => _pickDateTime(isStart: true),
              ),
              const SizedBox(height: AppSpacing.md),
              _DateTimeField(
                label: 'Selesai',
                value: _endAt,
                onTap: () => _pickDateTime(isStart: false),
              ),
              const SizedBox(height: AppSpacing.lg),
              Text('Mode meeting', style: theme.textTheme.titleSmall),
              const SizedBox(height: AppSpacing.sm),
              SegmentedButton<MeetingMode>(
                segments: const [
                  ButtonSegment(
                    value: MeetingMode.online,
                    label: Text('Online'),
                    icon: Icon(Icons.videocam_outlined),
                  ),
                  ButtonSegment(
                    value: MeetingMode.onsite,
                    label: Text('Onsite'),
                    icon: Icon(Icons.directions_walk_rounded),
                  ),
                ],
                selected: {_mode},
                onSelectionChanged: _isSubmitting
                    ? null
                    : (selection) => setState(() => _mode = selection.first),
              ),
              const SizedBox(height: AppSpacing.md),
              if (_mode == MeetingMode.online)
                TextFormField(
                  controller: _urlController,
                  enabled: !_isSubmitting,
                  keyboardType: TextInputType.url,
                  decoration: const InputDecoration(
                    labelText: 'Link meeting (opsional)',
                    hintText: 'https://meet.google.com/...',
                  ),
                )
              else
                TextFormField(
                  controller: _locationController,
                  enabled: !_isSubmitting,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: const InputDecoration(
                    labelText: 'Lokasi onsite',
                    helperText: 'Kosongkan untuk memakai alamat klien jika proyek dipilih.',
                  ),
                ),
              const SizedBox(height: AppSpacing.md),
              DropdownButtonFormField<String>(
                initialValue: _projectCode ?? _noProject,
                decoration: const InputDecoration(
                  labelText: 'Proyek (opsional)',
                ),
                items: [
                  const DropdownMenuItem(
                    value: _noProject,
                    child: Text('Tanpa proyek'),
                  ),
                  for (final project in loadedProjects)
                    DropdownMenuItem(
                      value: project.code,
                      child: Text('${project.code} · ${project.name}'),
                    ),
                  if (_projectCode != null && !hasSelectedProject)
                    DropdownMenuItem(
                      value: _projectCode,
                      child: Text(_projectCode!),
                    ),
                ],
                onChanged: _isSubmitting
                    ? null
                    : (value) => setState(
                        () => _projectCode = value == _noProject ? null : value,
                      ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                children: [
                  Text('Peserta', style: theme.textTheme.titleSmall),
                  const Spacer(),
                  TextButton.icon(
                    onPressed: _isSubmitting ? null : _pickParticipants,
                    icon: const Icon(Icons.people_outline_rounded, size: 18),
                    label: Text('Pilih (${_participantIds.length})'),
                  ),
                ],
              ),
              Wrap(
                spacing: AppSpacing.xs,
                runSpacing: AppSpacing.xs,
                children: [
                  for (final id in _participantIds)
                    Chip(
                      label: Text(_participantName(userOptions, id)),
                      onDeleted: id == _lockedParticipantId || _isSubmitting
                          ? null
                          : () => setState(() => _participantIds.remove(id)),
                    ),
                ],
              ),
              const SizedBox(height: AppSpacing.lg),
              TextFormField(
                controller: _agendaController,
                enabled: !_isSubmitting,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(labelText: 'Agenda'),
              ),
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _notesController,
                enabled: !_isSubmitting,
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
                decoration: const InputDecoration(labelText: 'Catatan'),
              ),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  _error!,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.error,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: FilledButton.icon(
            onPressed: _isSubmitting ? null : _submit,
            icon: _isSubmitting
                ? const SizedBox(
                    width: 16,
                    height: 16,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : const Icon(Icons.save_outlined, size: 18),
            label: Text(_isSubmitting ? 'Menyimpan...' : 'Simpan'),
          ),
        ),
      ),
    );
  }
}

class _DateTimeField extends StatelessWidget {
  const _DateTimeField({
    required this.label,
    required this.value,
    required this.onTap,
  });

  final String label;
  final DateTime value;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: const Icon(Icons.event_rounded, size: 18),
        ),
        child: Text(
          '${formatLongDate(value)} · ${_time(value)}',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}

String _time(DateTime date) =>
    '${date.hour.toString().padLeft(2, '0')}:'
    '${date.minute.toString().padLeft(2, '0')}';

String _participantName(List<UserOptionEntity>? options, String id) {
  if (options != null) {
    for (final option in options) {
      if (option.id == id) return option.name;
    }
  }
  return 'Karyawan';
}

DateTime _roundUp(DateTime date) {
  final minute = date.minute;
  final add = minute % 30 == 0 ? 0 : 30 - (minute % 30);
  return DateTime(date.year, date.month, date.day, date.hour, date.minute)
      .add(Duration(minutes: add))
      .copyWith(second: 0, millisecond: 0, microsecond: 0);
}
