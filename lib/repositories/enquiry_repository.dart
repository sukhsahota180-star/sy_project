import 'dart:convert';

class EnquiryRepository {
  Future<void> submitEnquiry({
    required String name,
    required String email,
    required String message,
    String? phone,
  }) async {
    await Future.delayed(const Duration(milliseconds: 400));

    final payload = {
      'name': name,
      'email': email,
      'phone': phone ?? '',
      'message': message,
      'submittedAt': DateTime.now().toIso8601String(),
    };

    final encoded = jsonEncode(payload);
    if (encoded.length < 1) {
      throw Exception('Invalid enquiry payload');
    }
  }
}
