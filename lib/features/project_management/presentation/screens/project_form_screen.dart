import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../../auth/presentation/providers/auth_controller.dart';
import '../../../project_tracking/domain/entities/project_tracking_entity.dart';
import '../../../project_tracking/presentation/providers/project_tracking_provider.dart';
import '../../domain/entities/client_form_entity.dart';
import '../providers/project_management_provider.dart';

/// Form tambah proyek (`projectCode == null`) atau edit detail proyek.
///
/// Mengembalikan kode proyek lewat `Navigator.pop` bila berhasil disimpan.
class ProjectFormScreen extends ConsumerStatefulWidget {
  const ProjectFormScreen({super.key, this.projectCode, this.initialProject});

  final String? projectCode;
  final ProjectTrackingEntity? initialProject;

  @override
  ConsumerState<ProjectFormScreen> createState() => _ProjectFormScreenState();
}

class _ProjectFormScreenState extends ConsumerState<ProjectFormScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _clientNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _contactNameController = TextEditingController();
  final _contactRoleController = TextEditingController();
  final _phoneController = TextEditingController();

  DateTime? _startDate;
  DateTime? _dueDate;
  String? _selectedClientId;
  bool _initialized = false;
  bool _isSubmitting = false;
  String? _error;

  bool get _isEdit => widget.projectCode != null;

  @override
  void initState() {
    super.initState();
    // Data dari halaman tracking dipakai langsung agar form tidak memicu
    // request ulang; provider hanya dipakai untuk deep-link edit.
    final initial = widget.initialProject;
    if (initial != null) _applyProject(initial);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _clientNameController.dispose();
    _addressController.dispose();
    _contactNameController.dispose();
    _contactRoleController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _applyProject(ProjectTrackingEntity project) {
    if (_initialized) return;
    _initialized = true;
    _nameController.text = project.name;
    _startDate = project.startDate;
    _dueDate = project.dueDate;
    _clientNameController.text = project.client.name;
    _addressController.text = project.client.address;
    _contactNameController.text = project.client.contactName;
    _contactRoleController.text = project.client.contactRole;
    _phoneController.text = project.client.phone;
  }

  ClientFormEntity _clientForm() => ClientFormEntity(
    name: _clientNameController.text.trim(),
    address: _addressController.text.trim(),
    contactName: _contactNameController.text.trim(),
    contactRole: _contactRoleController.text.trim(),
    phone: _phoneController.text.trim(),
  );

  Future<void> _pickDate({required bool isStart}) async {
    final current = isStart ? _startDate : _dueDate;
    final picked = await showDatePicker(
      context: context,
      initialDate: current ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked == null || !mounted) return;
    setState(() {
      if (isStart) {
        _startDate = picked;
      } else {
        _dueDate = picked;
      }
      _error = null;
    });
  }

  Future<void> _submit() async {
    if (_isSubmitting || !_formKey.currentState!.validate()) return;

    if (_startDate != null &&
        _dueDate != null &&
        _dueDate!.isBefore(_startDate!)) {
      setState(() => _error = 'Tenggat tidak boleh sebelum tanggal mulai.');
      return;
    }

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    try {
      final code = widget.projectCode;

      if (code == null) {
        final createdCode = await ref
            .read(createProjectUsecaseProvider)
            .call(
              name: _nameController.text.trim(),
              startDate: _startDate,
              dueDate: _dueDate,
              clientId: _selectedClientId,
              newClient: _selectedClientId == null ? _clientForm() : null,
            );

        if (!mounted) return;
        Navigator.of(context).pop(createdCode);
      } else {
        await ref
            .read(updateProjectDetailsUsecaseProvider)
            .call(
              code: code,
              name: _nameController.text.trim(),
              startDate: _startDate,
              dueDate: _dueDate,
              client: _clientForm(),
            );

        if (!mounted) return;
        Navigator.of(context).pop(code);
      }
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = readableErrorMessage(error));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final role = ref.watch(authControllerProvider).value?.user.role;
    final canManage = role == AuthRole.admin || role == AuthRole.pm;

    if (!canManage) {
      return Scaffold(
        appBar: AppBar(title: Text(_isEdit ? 'Edit Proyek' : 'Tambah Proyek')),
        body: const Center(
          child: Padding(
            padding: EdgeInsets.all(AppSpacing.xl),
            child: Text(
              'Hanya admin/PM yang dapat menambah atau mengedit proyek.',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    if (_isEdit && !_initialized) {
      final projectState = ref.watch(
        projectTrackingProvider(widget.projectCode!),
      );
      final project = projectState.value;

      if (project != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (!mounted) return;
          setState(() => _applyProject(project));
        });
      } else if (projectState.hasError) {
        return Scaffold(
          appBar: AppBar(title: const Text('Edit Proyek')),
          body: AppErrorState(
            title: 'Gagal memuat proyek',
            message: readableErrorMessage(projectState.error!),
            onRetry: () =>
                ref.invalidate(projectTrackingProvider(widget.projectCode!)),
          ),
        );
      } else {
        return Scaffold(
          appBar: AppBar(title: const Text('Edit Proyek')),
          body: const AppLoadingState(message: 'Memuat detail proyek...'),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(title: Text(_isEdit ? 'Edit Proyek' : 'Tambah Proyek')),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(
            padding: const EdgeInsets.all(AppSpacing.md),
            children: [
              _SectionLabel(text: 'Informasi Proyek'),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: _nameController,
                enabled: !_isSubmitting,
                textCapitalization: TextCapitalization.words,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(labelText: 'Nama proyek'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Nama proyek wajib diisi.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.md),
              _DateField(
                label: 'Tanggal mulai',
                value: _startDate,
                onTap: () => _pickDate(isStart: true),
                onClear: () => setState(() => _startDate = null),
              ),
              const SizedBox(height: AppSpacing.md),
              _DateField(
                label: 'Tenggat',
                value: _dueDate,
                onTap: () => _pickDate(isStart: false),
                onClear: () => setState(() => _dueDate = null),
              ),
              const SizedBox(height: AppSpacing.lg),
              _SectionLabel(text: _isEdit ? 'Data Klien' : 'Klien'),
              if (_isEdit) ...[
                const SizedBox(height: 4),
                Text(
                  'Data klien dipakai bersama oleh semua proyek klien ini.',
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurface
                        .withValues(alpha: 0.55),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              if (!_isEdit) ...[
                _ClientSelector(
                  selectedClientId: _selectedClientId,
                  onChanged: (value) =>
                      setState(() => _selectedClientId = value),
                ),
                const SizedBox(height: AppSpacing.md),
              ],
              if (_isEdit || _selectedClientId == null)
                _ClientFields(
                  nameController: _clientNameController,
                  addressController: _addressController,
                  contactNameController: _contactNameController,
                  contactRoleController: _contactRoleController,
                  phoneController: _phoneController,
                  enabled: !_isSubmitting,
                ),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.md),
                Text(
                  _error!,
                  style: Theme.of(context).textTheme.bodySmall
                      ?.copyWith(color: Theme.of(context).colorScheme.error),
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

const _newClientValue = '__new_client__';

class _ClientSelector extends ConsumerWidget {
  const _ClientSelector({
    required this.selectedClientId,
    required this.onChanged,
  });

  final String? selectedClientId;
  final ValueChanged<String?> onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientOptionsProvider);

    return clients.when(
      loading: () => const LinearProgressIndicator(),
      error: (error, stack) => Text(
        'Gagal memuat daftar klien: ${readableErrorMessage(error)}',
        style: Theme.of(context).textTheme.bodySmall
            ?.copyWith(color: Theme.of(context).colorScheme.error),
      ),
      data: (options) => DropdownButtonFormField<String>(
        initialValue: selectedClientId ?? _newClientValue,
        decoration: const InputDecoration(labelText: 'Pilih klien'),
        items: [
          const DropdownMenuItem<String>(
            value: _newClientValue,
            child: Text('Klien baru'),
          ),
          for (final client in options)
            DropdownMenuItem<String>(
              value: client.id,
              child: Text(client.name),
            ),
        ],
        onChanged: (value) =>
            onChanged(value == _newClientValue ? null : value),
      ),
    );
  }
}

class _ClientFields extends StatelessWidget {
  const _ClientFields({
    required this.nameController,
    required this.addressController,
    required this.contactNameController,
    required this.contactRoleController,
    required this.phoneController,
    required this.enabled,
  });

  final TextEditingController nameController;
  final TextEditingController addressController;
  final TextEditingController contactNameController;
  final TextEditingController contactRoleController;
  final TextEditingController phoneController;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: nameController,
          enabled: enabled,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: 'Nama perusahaan klien'),
          validator: _required('Nama perusahaan klien'),
        ),
        const SizedBox(height: AppSpacing.md),
        TextFormField(
          controller: addressController,
          enabled: enabled,
          textCapitalization: TextCapitalization.sentences,
          textInputAction: TextInputAction.next,
          maxLines: 2,
          decoration: const InputDecoration(labelText: 'Alamat'),
          validator: _required('Alamat'),
        ),
        const SizedBox(height: AppSpacing.md),
        TextFormField(
          controller: contactNameController,
          enabled: enabled,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: 'Nama PIC'),
          validator: _required('Nama PIC'),
        ),
        const SizedBox(height: AppSpacing.md),
        TextFormField(
          controller: contactRoleController,
          enabled: enabled,
          textCapitalization: TextCapitalization.words,
          textInputAction: TextInputAction.next,
          decoration: const InputDecoration(labelText: 'Jabatan PIC'),
          validator: _required('Jabatan PIC'),
        ),
        const SizedBox(height: AppSpacing.md),
        TextFormField(
          controller: phoneController,
          enabled: enabled,
          keyboardType: TextInputType.phone,
          textInputAction: TextInputAction.done,
          decoration: const InputDecoration(labelText: 'Nomor WhatsApp PIC'),
          validator: _required('Nomor WhatsApp PIC'),
        ),
      ],
    );
  }
}

FormFieldValidator<String> _required(String label) => (value) {
  if (value == null || value.trim().isEmpty) return '$label wajib diisi.';
  return null;
};

class _DateField extends StatelessWidget {
  const _DateField({
    required this.label,
    required this.value,
    required this.onTap,
    required this.onClear,
  });

  final String label;
  final DateTime? value;
  final VoidCallback onTap;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: InputDecorator(
        decoration: InputDecoration(
          labelText: label,
          suffixIcon: value == null
              ? const Icon(Icons.calendar_today_outlined, size: 18)
              : IconButton(
                  tooltip: 'Hapus tanggal',
                  onPressed: onClear,
                  icon: const Icon(Icons.close_rounded, size: 18),
                ),
        ),
        child: Text(
          value == null ? 'Belum diatur' : formatLongDate(value!),
          style: value == null
              ? theme.textTheme.bodyMedium?.copyWith(
                  color: theme.colorScheme.onSurface.withValues(alpha: 0.45),
                )
              : theme.textTheme.bodyMedium,
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
        color: AppColors.primary,
        fontWeight: FontWeight.w700,
        letterSpacing: 0.3,
      ),
    );
  }
}
