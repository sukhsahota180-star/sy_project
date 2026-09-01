import 'package:json_annotation/json_annotation.dart';

part 'models.g.dart';

@JsonSerializable()
class Project {
  final String id;
  final String title;
  final String slug;
  final String description;
  final String? image;
  final List<String> technologies;
  final String? link;
  final String? github;
  final DateTime createdAt;
  final DateTime updatedAt;

  Project({
    required this.id,
    required this.title,
    required this.slug,
    required this.description,
    this.image,
    required this.technologies,
    this.link,
    this.github,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Project.fromJson(Map<String, dynamic> json) =>
      _$ProjectFromJson(json);
  Map<String, dynamic> toJson() => _$ProjectToJson(this);
}

@JsonSerializable()
class Enquiry {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String message;
  final String? projectId;
  final DateTime createdAt;
  final String status;

  Enquiry({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.message,
    this.projectId,
    required this.createdAt,
    this.status = 'new',
  });

  factory Enquiry.fromJson(Map<String, dynamic> json) =>
      _$EnquiryFromJson(json);
  Map<String, dynamic> toJson() => _$EnquiryToJson(this);
}

@JsonSerializable()
class Analytics {
  final String id;
  final int totalVisits;
  final int totalEnquiries;
  final int totalProjects;
  final DateTime lastUpdated;

  Analytics({
    required this.id,
    required this.totalVisits,
    required this.totalEnquiries,
    required this.totalProjects,
    required this.lastUpdated,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsFromJson(json);
  Map<String, dynamic> toJson() => _$AnalyticsToJson(this);
}

@JsonSerializable()
class AdminSession {
  final String email;
  final String? sessionId;
  final DateTime? createdAt;
  final bool isLoggedIn;

  AdminSession({
    required this.email,
    this.sessionId,
    this.createdAt,
    this.isLoggedIn = false,
  });

  factory AdminSession.fromJson(Map<String, dynamic> json) =>
      _$AdminSessionFromJson(json);
  Map<String, dynamic> toJson() => _$AdminSessionToJson(this);
}

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  final bool success;
  final String? message;
  final T? data;
  final String? error;

  ApiResponse({
    required this.success,
    this.message,
    this.data,
    this.error,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);
  
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);
}
