import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sy_projects/config/app_config.dart';
import 'package:sy_projects/models/models.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});

class ApiService {
  final Dio _dio;

  ApiService(this._dio);

  // Projects
  Future<List<Project>> getProjects() async {
    try {
      final response = await _dio.get('/api/projects');
      final data = response.data as List;
      return data.map((e) => Project.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Project> getProjectBySlug(String slug) async {
    try {
      final response = await _dio.get('/api/projects/$slug');
      return Project.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Project> createProject(Project project) async {
    try {
      final response = await _dio.post(
        '/api/projects',
        data: project.toJson(),
      );
      return Project.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Project> updateProject(String id, Project project) async {
    try {
      final response = await _dio.put(
        '/api/projects/$id',
        data: project.toJson(),
      );
      return Project.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> deleteProject(String id) async {
    try {
      await _dio.delete('/api/projects/$id');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Enquiries
  Future<List<Enquiry>> getEnquiries() async {
    try {
      final response = await _dio.get('/api/enquiries');
      final data = response.data as List;
      return data.map((e) => Enquiry.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Enquiry> createEnquiry(Enquiry enquiry) async {
    try {
      final response = await _dio.post(
        '/api/enquiries',
        data: enquiry.toJson(),
      );
      return Enquiry.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<Enquiry> updateEnquiry(String id, Enquiry enquiry) async {
    try {
      final response = await _dio.put(
        '/api/enquiries/$id',
        data: enquiry.toJson(),
      );
      return Enquiry.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Analytics
  Future<Analytics> getAnalytics() async {
    try {
      final response = await _dio.get('/api/analytics');
      return Analytics.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Admin Auth
  Future<AdminSession> adminLogin(String email, String password) async {
    try {
      final response = await _dio.post(
        '/api/admin/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return AdminSession.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<void> adminLogout() async {
    try {
      await _dio.post('/api/admin/logout');
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  Future<AdminSession> checkAdminSession() async {
    try {
      final response = await _dio.get('/api/admin/session');
      return AdminSession.fromJson(response.data as Map<String, dynamic>);
    } on DioException catch (e) {
      throw _handleError(e);
    }
  }

  // Health Check
  Future<bool> healthCheck() async {
    try {
      final response = await _dio.get('/api/health');
      return response.statusCode == 200;
    } on DioException catch (_) {
      return false;
    }
  }

  String _handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timeout. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Send timeout. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'Receive timeout. Please try again.';
      case DioExceptionType.badResponse:
        return error.response?.data['message'] ?? 'An error occurred';
      case DioExceptionType.cancel:
        return 'Request cancelled';
      case DioExceptionType.unknown:
        return 'Unknown error occurred';
      default:
        return 'An unexpected error occurred';
    }
  }
}
