import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_shapes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/app_logo.dart';
import '../providers/onboarding_provider.dart';

/// Onboarding singkat saat aplikasi pertama kali dibuka setelah instalasi.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  static const _pages = [
    _OnboardingPageData(
      title: 'Lacak 8 Tahap SDLC',
      description:
          'Pantau progres setiap proyek dari brief hingga rilis, lengkap '
          'dengan status tahap dan dokumennya.',
      illustration: _TimelineIllustration(),
    ),
    _OnboardingPageData(
      title: 'Arsip & Kolaborasi',
      description:
          'Dokumen, notulen meeting, dan aktivitas tim tersimpan rapi dalam '
          'satu tempat.',
      illustration: _ArchiveIllustration(),
    ),
    _OnboardingPageData(
      title: 'Jadwal Meeting Real-Time',
      description:
          'Kalender meeting dengan agenda harian dan pengingat otomatis di '
          'kalender HP Anda.',
      illustration: _CalendarIllustration(),
    ),
  ];

  final _controller = PageController();
  int _index = 0;
  bool _finishing = false;

  bool get _isLast => _index == _pages.length - 1;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    if (_finishing) return;
    setState(() => _finishing = true);

    await ref.read(onboardingSeenProvider.notifier).complete();
    if (!mounted) return;

    // Redirect router yang menentukan tujuan akhir (login atau dashboard).
    context.goNamed(AppRoutes.login);
  }

  void _next() {
    if (_isLast) {
      _finish();
      return;
    }

    _controller.nextPage(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onboardingStart,
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [AppColors.onboardingStart, AppColors.onboardingEnd],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: AppSpacing.md),
                child: AppLogo(size: 46),
              ),
              Expanded(
                child: PageView.builder(
                  controller: _controller,
                  itemCount: _pages.length,
                  onPageChanged: (index) => setState(() => _index = index),
                  itemBuilder: (context, index) =>
                      _OnboardingPage(data: _pages[index]),
                ),
              ),
              _Footer(
                index: _index,
                count: _pages.length,
                isLast: _isLast,
                isFinishing: _finishing,
                onSkip: _finish,
                onNext: _next,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _OnboardingPageData {
  const _OnboardingPageData({
    required this.title,
    required this.description,
    required this.illustration,
  });

  final String title;
  final String description;
  final Widget illustration;
}

class _OnboardingPage extends StatelessWidget {
  const _OnboardingPage({required this.data});

  final _OnboardingPageData data;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        final illustrationHeight = (constraints.maxHeight * 0.46).clamp(
          200.0,
          300.0,
        );

        return SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.lg),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // FittedBox menjaga ilustrasi tetap utuh di layar pendek
                // (mis. landscape) tanpa RenderFlex overflow.
                SizedBox(
                  height: illustrationHeight,
                  width: double.infinity,
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: data.illustration,
                  ),
                ),
                const SizedBox(height: AppSpacing.xl),
                Text(
                  data.title,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineSmall?.copyWith(
                    color: AppColors.onboardingText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  data.description,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.bodyLarge?.copyWith(
                    color: AppColors.onboardingTextMuted,
                    height: 1.5,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer({
    required this.index,
    required this.count,
    required this.isLast,
    required this.isFinishing,
    required this.onSkip,
    required this.onNext,
  });

  final int index;
  final int count;
  final bool isLast;
  final bool isFinishing;
  final VoidCallback onSkip;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(
        AppSpacing.lg,
        AppSpacing.sm,
        AppSpacing.lg,
        AppSpacing.lg,
      ),
      child: Row(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Visibility(
                visible: !isLast,
                maintainSize: true,
                maintainAnimation: true,
                maintainState: true,
                child: TextButton(
                  onPressed: isFinishing ? null : onSkip,
                  child: Text(
                    'Lewati',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: AppColors.onboardingTextMuted,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (var dot = 0; dot < count; dot++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 220),
                  curve: Curves.easeOut,
                  margin: const EdgeInsets.symmetric(horizontal: 3),
                  width: dot == index ? 22 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: dot == index
                        ? AppColors.onboardingAccent
                        : AppColors.onboardingTextMuted.withValues(alpha: 0.4),
                    borderRadius: BorderRadius.circular(AppRadius.full),
                  ),
                ),
            ],
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                onPressed: isFinishing ? null : onNext,
                style: FilledButton.styleFrom(
                  backgroundColor: AppColors.onboardingAccent,
                  foregroundColor: AppColors.onboardingStart,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.lg,
                    vertical: AppSpacing.sm + 4,
                  ),
                  textStyle: theme.textTheme.labelLarge?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                child: isFinishing
                    ? const SizedBox(
                        width: 18,
                        height: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Text(isLast ? 'Mulai' : 'Lanjut'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Ilustrasi: dibuat dari widget supaya konsisten dengan tema dan ringan.
// ---------------------------------------------------------------------------

class _Glow extends StatelessWidget {
  const _Glow();

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Container(
        width: 230,
        height: 230,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: RadialGradient(
            colors: [
              AppColors.onboardingAccent.withValues(alpha: 0.28),
              AppColors.onboardingAccent.withValues(alpha: 0),
            ],
          ),
        ),
      ),
    );
  }
}

class _GlassCard extends StatelessWidget {
  const _GlassCard({required this.child, this.width = 260});

  final Widget child;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.onboardingSurface.withValues(alpha: 0.55),
        borderRadius: BorderRadius.circular(AppRadius.xl),
        border: Border.all(
          color: AppColors.onboardingAccent.withValues(alpha: 0.35),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.onboardingAccent.withValues(alpha: 0.18),
            blurRadius: 32,
            spreadRadius: 2,
          ),
        ],
      ),
      child: child,
    );
  }
}

class _FloatingIcon extends StatelessWidget {
  const _FloatingIcon({required this.icon, this.color = AppColors.onboardingHighlight});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.onboardingSurface,
        shape: BoxShape.circle,
        border: Border.all(color: color.withValues(alpha: 0.5)),
        boxShadow: [
          BoxShadow(
            color: color.withValues(alpha: 0.35),
            blurRadius: 16,
          ),
        ],
      ),
      child: Icon(icon, size: 22, color: color),
    );
  }
}

class _TimelineIllustration extends StatelessWidget {
  const _TimelineIllustration();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const _Glow(),
        const _GlassCard(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _TimelineRow(index: 0),
              SizedBox(height: AppSpacing.md),
              _TimelineRow(index: 1),
              SizedBox(height: AppSpacing.md),
              _TimelineRow(index: 2),
              SizedBox(height: AppSpacing.md),
              _TimelineRow(index: 3),
            ],
          ),
        ),
        const Positioned(
          right: 8,
          top: 4,
          child: _FloatingIcon(icon: Icons.trending_up_rounded),
        ),
      ],
    );
  }
}

class _TimelineRow extends StatelessWidget {
  const _TimelineRow({required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    final isDone = index < 2;
    final isActive = index == 2;
    final color = isDone
        ? AppColors.success
        : isActive
        ? AppColors.onboardingHighlight
        : AppColors.onboardingTextMuted;

    return Row(
      children: [
        Container(
          width: 34,
          height: 34,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.18),
            shape: BoxShape.circle,
            border: Border.all(color: color.withValues(alpha: 0.6)),
          ),
          child: Icon(
            isDone
                ? Icons.check_rounded
                : isActive
                ? Icons.play_arrow_rounded
                : Icons.circle_outlined,
            size: 18,
            color: color,
          ),
        ),
        const SizedBox(width: AppSpacing.sm),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _Bar(widthFactor: isDone ? 1 : 0.85, alpha: 0.55),
              const SizedBox(height: 6),
              _Bar(widthFactor: 0.55, alpha: 0.28),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArchiveIllustration extends StatelessWidget {
  const _ArchiveIllustration();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const _Glow(),
        _GlassCard(
          width: 250,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 68,
                height: 68,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppColors.onboardingAccent,
                      AppColors.onboardingHighlight,
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(AppRadius.lg),
                ),
                child: const Icon(
                  Icons.folder_copy_rounded,
                  size: 32,
                  color: AppColors.onboardingStart,
                ),
              ),
              const SizedBox(height: AppSpacing.md),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _DocChip(
                    icon: Icons.description_rounded,
                    color: AppColors.onboardingAccent,
                  ),
                  _DocChip(
                    icon: Icons.table_chart_rounded,
                    color: AppColors.success,
                  ),
                  _DocChip(
                    icon: Icons.picture_as_pdf_rounded,
                    color: AppColors.onboardingHighlight,
                  ),
                  _DocChip(
                    icon: Icons.image_rounded,
                    color: AppColors.warning,
                  ),
                ],
              ),
            ],
          ),
        ),
        const Positioned(
          left: 6,
          top: 2,
          child: _FloatingIcon(icon: Icons.cloud_done_rounded),
        ),
      ],
    );
  }
}

class _DocChip extends StatelessWidget {
  const _DocChip({required this.icon, required this.color});

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 44,
      height: 44,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.16),
        borderRadius: BorderRadius.circular(AppRadius.md),
        border: Border.all(color: color.withValues(alpha: 0.4)),
      ),
      child: Icon(icon, size: 20, color: color),
    );
  }
}

class _CalendarIllustration extends StatelessWidget {
  const _CalendarIllustration();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      alignment: Alignment.center,
      children: [
        const _Glow(),
        _GlassCard(
          width: 264,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.calendar_month_rounded,
                    size: 18,
                    color: AppColors.onboardingAccent,
                  ),
                  const SizedBox(width: AppSpacing.sm),
                  Text(
                    'Jadwal',
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: AppColors.onboardingText,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.18),
                      borderRadius: BorderRadius.circular(AppRadius.full),
                    ),
                    child: Text(
                      '30 mnt',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: AppColors.success,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.md),
              const _MiniCalendarGrid(),
            ],
          ),
        ),
        const Positioned(
          right: 2,
          bottom: 0,
          child: _FloatingIcon(
            icon: Icons.alarm_rounded,
            color: AppColors.warning,
          ),
        ),
      ],
    );
  }
}

class _MiniCalendarGrid extends StatelessWidget {
  const _MiniCalendarGrid();

  static const _highlighted = 11;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children: [
        for (var cell = 0; cell < 28; cell++)
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: cell == _highlighted
                  ? AppColors.onboardingAccent.withValues(alpha: 0.32)
                  : AppColors.onboardingTextMuted.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
              border: cell == _highlighted
                  ? Border.all(color: AppColors.onboardingAccent, width: 1.4)
                  : null,
            ),
            child: cell == _highlighted
                ? Container(
                    width: 5,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: AppColors.onboardingHighlight,
                      shape: BoxShape.circle,
                    ),
                  )
                : null,
          ),
      ],
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar({required this.widthFactor, required this.alpha});

  final double widthFactor;
  final double alpha;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: widthFactor,
      child: Container(
        height: 8,
        decoration: BoxDecoration(
          color: AppColors.onboardingTextMuted.withValues(alpha: alpha),
          borderRadius: BorderRadius.circular(AppRadius.full),
        ),
      ),
    );
  }
}
