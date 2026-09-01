import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sy_projects/providers/providers.dart';

class AdminDashboardScreen extends ConsumerWidget {
  const AdminDashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsync = ref.watch(adminSessionProvider);
    final analyticsAsync = ref.watch(analyticsProvider);
    final enquiriesAsync = ref.watch(enquiriesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
        actions: [
          TextButton.icon(
            onPressed: () {
              ref.read(adminSessionProvider.notifier).logout();
              context.go('/admin/login');
            },
            icon: const Icon(Icons.logout),
            label: const Text('Logout'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.wait([
            ref.refresh(analyticsProvider.future),
            ref.refresh(enquiriesProvider.future),
          ]);
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sessionAsync.when(
                data: (session) {
                  if (session != null) {
                    return Text(
                      'Welcome, ${session.email}',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    );
                  }
                  return SizedBox.shrink();
                },
                loading: () =>
                    const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              SizedBox(height: 24),
              analyticsAsync.when(
                data: (analytics) {
                  return GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    children: [
                      _StatCard(
                        title: 'Total Visits',
                        value: analytics.totalVisits.toString(),
                        icon: Icons.visibility,
                      ),
                      _StatCard(
                        title: 'Enquiries',
                        value: analytics.totalEnquiries.toString(),
                        icon: Icons.mail,
                      ),
                      _StatCard(
                        title: 'Projects',
                        value: analytics.totalProjects.toString(),
                        icon: Icons.work,
                      ),
                      _StatCard(
                        title: 'Last Updated',
                        value: analytics.lastUpdated.toString().split(' ')[0],
                        icon: Icons.update,
                      ),
                    ],
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
              SizedBox(height: 32),
              Text(
                'Recent Enquiries',
                style: GoogleFonts.poppins(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              enquiriesAsync.when(
                data: (enquiries) {
                  if (enquiries.isEmpty) {
                    return Center(
                      child: Text('No enquiries yet'),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: enquiries.take(5).length,
                    itemBuilder: (context, index) {
                      final enquiry = enquiries[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: Icon(Icons.person),
                          title: Text(enquiry.name),
                          subtitle: Text(enquiry.email),
                          trailing: Chip(
                            label: Text(enquiry.status),
                            backgroundColor: enquiry.status == 'new'
                                ? Colors.blue
                                : Colors.green,
                            labelStyle: TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const CircularProgressIndicator(),
                error: (error, stack) => Text('Error: $error'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;

  const _StatCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 32, color: Color(0xFF2E7D32)),
            SizedBox(height: 12),
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: 12,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
