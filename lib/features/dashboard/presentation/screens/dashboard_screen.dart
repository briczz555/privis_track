import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/navigation/routes.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/utils/error_message.dart';
import '../../../../core/widgets/app_empty_state.dart';
import '../../../../core/widgets/app_error_state.dart';
import '../../../../core/widgets/app_loading_state.dart';
import '../../../../core/widgets/section_header.dart';
import '../../domain/entities/dashboard_entity.dart';
import '../providers/dashboard_provider.dart';
import '../widgets/activity_feed_tile.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/portfolio_card.dart';
import '../widgets/project_card.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  Future<void> _refresh(WidgetRef ref) =>
      ref.read(dashboardProvider.notifier).refresh();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboard = ref.watch(dashboardProvider);
    final data = dashboard.value;

    // Saat refresh gagal, data lama tetap ditampilkan — beri tahu user lewat
    // SnackBar supaya kegagalan tidak terlihat seperti data terbaru.
    ref.listen(dashboardProvider, (previous, next) {
      if (next.hasValue && next.hasError) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(readableErrorMessage(next.error!))),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: switch (data) {
          final data? => RefreshIndicator(
            onRefresh: () => _refresh(ref),
            child: _DashboardContent(dashboard: data),
          ),
          _ when dashboard.hasError => AppErrorState(
            title: 'Gagal memuat dashboard',
            message: readableErrorMessage(dashboard.error!),
            onRetry: () => _refresh(ref),
          ),
          _ => const AppLoadingState(message: 'Memuat dashboard...'),
        },
      ),
    );
  }
}

class _DashboardContent extends StatelessWidget {
  const _DashboardContent({required this.dashboard});

  final DashboardEntity dashboard;

  @override
  Widget build(BuildContext context) {
    final activeProjects = dashboard.activeProjects;
    final activities = dashboard.activities;

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.md,
              AppSpacing.md,
              0,
            ),
            child: DashboardHeader(),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              0,
            ),
            child: PortfolioCard(
              data: dashboard.portfolioByStatus,
              totalProjects: dashboard.totalProjects,
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: SectionHeader(
              title: 'Proyek Berjalan',
              trailing: 'Lihat semua',
              onTrailingTap: () => context.pushNamed(AppRoutes.allProjects),
            ),
          ),
        ),
        if (activeProjects.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: AppEmptyState(
                message: 'Belum ada proyek yang sedang berjalan.',
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverList.separated(
              itemCount: activeProjects.length,
              itemBuilder: (context, index) {
                final project = activeProjects[index];
                return ProjectCard(
                  project: project,
                  onTap: () => context.pushNamed(
                    AppRoutes.projectTracking,
                    pathParameters: {'projectId': project.id},
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: AppSpacing.md),
            ),
          ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.md,
              AppSpacing.lg,
              AppSpacing.md,
              AppSpacing.md,
            ),
            child: SectionHeader(
              title: 'Aktivitas Tim',
              trailing: '${activities.length} aktivitas',
            ),
          ),
        ),
        if (activities.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
              child: AppEmptyState(message: 'Belum ada aktivitas terbaru.'),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            sliver: SliverToBoxAdapter(
              child: Card(
                child: Column(
                  children: [
                    for (var index = 0; index < activities.length; index++)
                      ActivityFeedTile(
                        activity: activities[index],
                        showDivider: index != activities.length - 1,
                      ),
                  ],
                ),
              ),
            ),
          ),
        const SliverToBoxAdapter(child: SizedBox(height: AppSpacing.xl)),
      ],
    );
  }
}
