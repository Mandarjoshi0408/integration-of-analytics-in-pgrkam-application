import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import '../../logic/services/preference_services.dart';
import '../../logic/providers/dashboard_provider.dart';

class AdminDashboardPage extends ConsumerWidget {
  const AdminDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prefs = ref.watch(sharedPreferencesProvider);
    final token = prefs.getString('auth_token') ?? '';

    final dashboardData = ref.watch(dashboardStatsProvider(token));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        elevation: 0,
        backgroundColor: Colors.blueAccent,
      ),
      body: dashboardData.when(
        data: (data) {
          if (data == null) {
            return _buildErrorWidget(context, ref, token);
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AdminDashboardPage._buildStatisticsGrid(data),
                const SizedBox(height: 24),
                if (data['job_categories'] != null)
                  AdminDashboardPage._buildJobCategoriesChart(
                      data['job_categories'] as Map),
                const SizedBox(height: 24),
                if (data['top_skills'] != null)
                  AdminDashboardPage._buildTopSkillsChart(
                      data['top_skills'] as Map),
                const SizedBox(height: 24),
                if (data['application_by_status'] != null)
                  AdminDashboardPage._buildApplicationStatusChart(
                      data['application_by_status'] as Map),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) =>
            AdminDashboardPage._buildErrorWidget(context, ref, token),
      ),
    );
  }

  static Widget _buildErrorWidget(
      BuildContext context, WidgetRef ref, String token) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 64, color: Colors.red),
          const SizedBox(height: 16),
          const Text('Failed to load dashboard data'),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              ref.refresh(dashboardStatsProvider(token));
            },
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  static Widget _buildStatisticsGrid(Map<String, dynamic> data) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      children: [
        AdminDashboardPage._buildStatCard(
          'Total Users',
          data['total_users']?.toString() ?? '0',
          Icons.people,
          Colors.blue,
        ),
        AdminDashboardPage._buildStatCard(
          'Total Jobs',
          data['total_jobs']?.toString() ?? '0',
          Icons.work,
          Colors.green,
        ),
        AdminDashboardPage._buildStatCard(
          'Total Applicants',
          data['total_applicants']?.toString() ?? '0',
          Icons.person_search,
          Colors.orange,
        ),
        AdminDashboardPage._buildStatCard(
          'Total Applications',
          data['total_applications']?.toString() ?? '0',
          Icons.assignment,
          Colors.purple,
        ),
        AdminDashboardPage._buildStatCard(
          'Active Jobs',
          data['active_jobs']?.toString() ?? '0',
          Icons.trending_up,
          Colors.red,
        ),
        AdminDashboardPage._buildStatCard(
          'Avg Applications/Job',
          (data['avg_applications_per_job'] as num?)?.toStringAsFixed(2) ?? '0',
          Icons.assessment,
          Colors.teal,
        ),
      ],
    );
  }

  static Widget _buildStatCard(
    String title,
    String value,
    IconData icon,
    Color color,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: color),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  static Widget _buildJobCategoriesChart(Map<dynamic, dynamic> categories) {
    final entries = categories.entries
        .map((e) => PieChartSectionData(
              color: AdminDashboardPage._getColor(
                  categories.keys.toList().indexOf(e.key)),
              value: (e.value as num).toDouble(),
              title: '${e.value}',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Jobs by Category',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: PieChart(
            PieChartData(
              sections: entries,
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        AdminDashboardPage._buildLegend(categories),
      ],
    );
  }

  static Widget _buildTopSkillsChart(Map<dynamic, dynamic> skills) {
    final sortedSkills = skills.entries.toList()
      ..sort((a, b) => (b.value as num).compareTo(a.value as num));

    final barGroups = sortedSkills
        .asMap()
        .entries
        .map((e) => BarChartGroupData(
              x: e.key,
              barRods: [
                BarChartRodData(
                  toY: (e.value.value as num).toDouble(),
                  color: AdminDashboardPage._getColor(e.key),
                  width: 12,
                ),
              ],
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Top Skills in Demand',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: BarChart(
            BarChartData(
              barGroups: barGroups,
              borderData: FlBorderData(show: false),
              gridData: const FlGridData(show: false),
              titlesData: FlTitlesData(
                leftTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (value, meta) {
                      if (value.toInt() < sortedSkills.length) {
                        return Text(
                          sortedSkills[value.toInt()].key.toString(),
                          style: const TextStyle(fontSize: 10),
                        );
                      }
                      return const Text('');
                    },
                  ),
                ),
                topTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: const AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  static Widget _buildApplicationStatusChart(Map<dynamic, dynamic> statusData) {
    final entries = statusData.entries
        .map((e) => PieChartSectionData(
              color: AdminDashboardPage._getStatusColor(e.key.toString()),
              value: (e.value as num).toDouble(),
              title: '${e.value}',
              radius: 60,
              titleStyle: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ))
        .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Applications by Status',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          padding: const EdgeInsets.all(16),
          child: PieChart(
            PieChartData(
              sections: entries,
              centerSpaceRadius: 40,
              sectionsSpace: 2,
            ),
          ),
        ),
        const SizedBox(height: 12),
        AdminDashboardPage._buildLegend(statusData),
      ],
    );
  }

  static Widget _buildLegend(Map<dynamic, dynamic> data) {
    return Wrap(
      spacing: 16,
      runSpacing: 8,
      children: data.entries.map((e) {
        final color = e.key.toString().contains('pending')
            ? Colors.orange
            : e.key.toString().contains('accepted')
                ? Colors.green
                : e.key.toString().contains('rejected')
                    ? Colors.red
                    : AdminDashboardPage._getColor(
                        data.keys.toList().indexOf(e.key));

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 6),
            Text(
              '${e.key}: ${e.value}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        );
      }).toList(),
    );
  }

  static Color _getColor(int index) {
    const colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.purple,
      Colors.red,
      Colors.teal,
      Colors.pink,
      Colors.amber,
    ];
    return colors[index % colors.length];
  }

  static Color _getStatusColor(String status) {
    if (status.toLowerCase().contains('pending')) return Colors.orange;
    if (status.toLowerCase().contains('accepted')) return Colors.green;
    if (status.toLowerCase().contains('rejected')) return Colors.red;
    return Colors.grey;
  }
}
