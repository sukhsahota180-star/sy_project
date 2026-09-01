import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sy_projects/models/models.dart';
import 'package:sy_projects/services/api_service.dart';

// Projects
final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProjects();
});

final projectBySlugProvider = FutureProvider.family<Project, String>((ref, slug) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getProjectBySlug(slug);
});

// Enquiries
final enquiriesProvider = FutureProvider<List<Enquiry>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getEnquiries();
});

final createEnquiryProvider = FutureProvider.family<Enquiry, Enquiry>((ref, enquiry) async {
  final apiService = ref.watch(apiServiceProvider);
  final result = await apiService.createEnquiry(enquiry);
  // Invalidate enquiries to refresh
  ref.invalidate(enquiriesProvider);
  return result;
});

// Analytics
final analyticsProvider = FutureProvider<Analytics>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getAnalytics();
});

// Admin Auth
final adminSessionProvider = StateNotifierProvider<AdminSessionNotifier, AsyncValue<AdminSession?>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return AdminSessionNotifier(apiService);
});

class AdminSessionNotifier extends StateNotifier<AsyncValue<AdminSession?>> {
  final ApiService _apiService;

  AdminSessionNotifier(this._apiService) : super(const AsyncValue.loading());

  Future<void> checkSession() async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _apiService.checkAdminSession());
  }

  Future<void> login(String email, String password) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() => _apiService.adminLogin(email, password));
  }

  Future<void> logout() async {
    try {
      await _apiService.adminLogout();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

// App Health
final appHealthProvider = FutureProvider<bool>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.healthCheck();
});
