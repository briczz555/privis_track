import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../auth/domain/entities/auth_role.dart';
import '../../domain/entities/managed_user_entity.dart';
import '../providers/user_management_provider.dart';
import 'user_role_style.dart';

const _assignableRoles = [
  AuthRole.admin,
  AuthRole.pm,
  AuthRole.developer,
  AuthRole.qa,
  AuthRole.finance,
];

/// Dialog tambah/ubah user. `user == null` berarti mode tambah.
///
/// Mengembalikan `true` lewat `Navigator.pop` bila berhasil disimpan.
class UserFormDialog extends ConsumerStatefulWidget {
  const UserFormDialog({super.key, this.user, this.roleLocked = false});

  final ManagedUserEntity? user;
  final bool roleLocked;

  @override
  ConsumerState<UserFormDialog> createState() => _UserFormDialogState();
}

class _UserFormDialogState extends ConsumerState<UserFormDialog> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;
  late final TextEditingController _divisionController;

  late AuthRole _role;
  bool _isSubmitting = false;
  String? _error;

  bool get _isCreate => widget.user == null;

  @override
  void initState() {
    super.initState();
    final user = widget.user;
    _nameController = TextEditingController(text: user?.name ?? '');
    _emailController = TextEditingController(text: user?.email ?? '');
    _passwordController = TextEditingController();
    _divisionController = TextEditingController(text: user?.division ?? '');
    _role = user?.role ?? AuthRole.developer;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _divisionController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (_isSubmitting || !_formKey.currentState!.validate()) return;

    setState(() {
      _isSubmitting = true;
      _error = null;
    });

    final notifier = ref.read(userManagementProvider.notifier);
    final division = _divisionController.text.trim();

    try {
      if (_isCreate) {
        await notifier.createUser(
          name: _nameController.text.trim(),
          email: _emailController.text.trim(),
          password: _passwordController.text,
          role: _role,
          division: division,
        );
      } else {
        final user = widget.user!;
        await notifier.updateUser(
          id: user.id,
          name: _nameController.text.trim(),
          role: _role,
          division: division,
          isActive: user.isActive,
        );
      }

      if (!mounted) return;
      Navigator.of(context).pop(true);
    } catch (error) {
      if (!mounted) return;
      setState(() => _error = readableErrorMessage(error));
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return AlertDialog(
      title: Text(_isCreate ? 'Tambah User' : 'Ubah User'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: _nameController,
                enabled: !_isSubmitting,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(labelText: 'Nama lengkap'),
                validator: (value) => (value == null || value.trim().isEmpty)
                    ? 'Nama wajib diisi.'
                    : null,
              ),
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: _emailController,
                enabled: _isCreate && !_isSubmitting,
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  labelText: 'Email',
                  helperText: _isCreate ? null : 'Email tidak bisa diubah.',
                ),
                validator: (value) {
                  final email = value?.trim() ?? '';
                  if (email.isEmpty) return 'Email wajib diisi.';
                  if (!email.contains('@')) return 'Format email tidak valid.';
                  return null;
                },
              ),
              if (_isCreate) ...[
                const SizedBox(height: AppSpacing.sm),
                TextFormField(
                  controller: _passwordController,
                  enabled: !_isSubmitting,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    labelText: 'Password awal',
                    helperText: 'Minimal 8 karakter.',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password wajib diisi.';
                    }
                    if (value.length < 8) {
                      return 'Password minimal 8 karakter.';
                    }
                    return null;
                  },
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              DropdownButtonFormField<AuthRole>(
                initialValue: _role,
                decoration: const InputDecoration(labelText: 'Role'),
                items: [
                  for (final role in _assignableRoles)
                    DropdownMenuItem<AuthRole>(
                      value: role,
                      child: Text(role.label),
                    ),
                ],
                onChanged: widget.roleLocked || _isSubmitting
                    ? null
                    : (value) {
                        if (value != null) setState(() => _role = value);
                      },
              ),
              if (widget.roleLocked) ...[
                const SizedBox(height: 4),
                Text(
                  'Role akun sendiri tidak bisa diubah.',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.onSurface.withValues(alpha: 0.55),
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.sm),
              TextFormField(
                controller: _divisionController,
                enabled: !_isSubmitting,
                textInputAction: TextInputAction.done,
                onFieldSubmitted: (_) => _submit(),
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(
                  labelText: 'Divisi (opsional)',
                ),
              ),
              if (_error != null) ...[
                const SizedBox(height: AppSpacing.sm),
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
      actions: [
        TextButton(
          onPressed: _isSubmitting
              ? null
              : () => Navigator.of(context).pop(false),
          child: const Text('Batal'),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Simpan'),
        ),
      ],
    );
  }
}
