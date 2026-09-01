import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:sy_projects/screens/home_screen.dart';
import 'package:sy_projects/screens/projects_screen.dart';
import 'package:sy_projects/screens/project_detail_screen.dart';
import 'package:sy_projects/screens/contact_screen.dart';
import 'package:sy_projects/screens/request_screen.dart';
import 'package:sy_projects/screens/admin/admin_login_screen.dart';
import 'package:sy_projects/screens/admin/admin_dashboard_screen.dart';
import 'package:sy_projects/screens/settings_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'projects',
            builder: (context, state) => const ProjectsScreen(),
            routes: [
              GoRoute(
                path: ':slug',
                builder: (context, state) {
                  final slug = state.pathParameters['slug'];
                  return ProjectDetailScreen(slug: slug ?? '');
                },
              ),
            ],
          ),
          GoRoute(
            path: 'contact',
            builder: (context, state) => const ContactScreen(),
          ),
          GoRoute(
            path: 'request',
            builder: (context, state) => const RequestScreen(),
          ),
          GoRoute(
            path: 'admin/login',
            builder: (context, state) => const AdminLoginScreen(),
          ),
          GoRoute(
            path: 'admin/dashboard',
            builder: (context, state) => const AdminDashboardScreen(),
          ),
          GoRoute(
            path: 'settings',
            builder: (context, state) => const SettingsScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      return Scaffold(
        appBar: AppBar(title: const Text('Error')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Page not found'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => context.go('/'),
                child: const Text('Go Home'),
              ),
            ],
          ),
        ),
      );
    },
  );
});
