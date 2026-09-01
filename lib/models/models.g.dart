// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
      id: json['id'] as String,
      title: json['title'] as String,
      slug: json['slug'] as String,
      description: json['description'] as String,
      image: json['image'] as String?,
      technologies: (json['technologies'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      link: json['link'] as String?,
      github: json['github'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'image': instance.image,
      'technologies': instance.technologies,
      'link': instance.link,
      'github': instance.github,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };

Enquiry _$EnquiryFromJson(Map<String, dynamic> json) => Enquiry(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      message: json['message'] as String,
      projectId: json['projectId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      status: json['status'] as String? ?? 'new',
    );

Map<String, dynamic> _$EnquiryToJson(Enquiry instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'message': instance.message,
      'projectId': instance.projectId,
      'createdAt': instance.createdAt.toIso8601String(),
      'status': instance.status,
    };

Analytics _$AnalyticsFromJson(Map<String, dynamic> json) => Analytics(
      id: json['id'] as String,
      totalVisits: (json['totalVisits'] as num).toInt(),
      totalEnquiries: (json['totalEnquiries'] as num).toInt(),
      totalProjects: (json['totalProjects'] as num).toInt(),
      lastUpdated: DateTime.parse(json['lastUpdated'] as String),
    );

Map<String, dynamic> _$AnalyticsToJson(Analytics instance) => <String, dynamic>{
      'id': instance.id,
      'totalVisits': instance.totalVisits,
      'totalEnquiries': instance.totalEnquiries,
      'totalProjects': instance.totalProjects,
      'lastUpdated': instance.lastUpdated.toIso8601String(),
    };

AdminSession _$AdminSessionFromJson(Map<String, dynamic> json) => AdminSession(
      email: json['email'] as String,
      sessionId: json['sessionId'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      isLoggedIn: json['isLoggedIn'] as bool? ?? false,
    );

Map<String, dynamic> _$AdminSessionToJson(AdminSession instance) =>
    <String, dynamic>{
      'email': instance.email,
      'sessionId': instance.sessionId,
      'createdAt': instance.createdAt?.toIso8601String(),
      'isLoggedIn': instance.isLoggedIn,
    };

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      success: json['success'] as bool,
      message: json['message'] as String?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      error: json['error'] as String?,
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'error': instance.error,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);
