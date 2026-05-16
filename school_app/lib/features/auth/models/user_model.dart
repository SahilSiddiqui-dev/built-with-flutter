import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String schoolId;
  final String name;
  final String role;
  final String employeeId;
  final String phone;
  final String email;
  final String? photoUrl;
  final String languagePref;
  final bool darkMode;
  final bool notificationsEnabled;
  final String? fcmToken;
  final String? classId;
  final String? studentId;
  final DateTime createdAt;

  UserModel({
    required this.uid,
    required this.schoolId,
    required this.name,
    required this.role,
    required this.employeeId,
    required this.phone,
    required this.email,
    this.photoUrl,
    this.languagePref = 'en',
    this.darkMode = false,
    this.notificationsEnabled = true,
    this.fcmToken,
    this.classId,
    this.studentId,
    required this.createdAt,
  });

  factory UserModel.fromMap(Map<String, dynamic> map, String id) {
    return UserModel(
      uid: id,
      schoolId: map['school_id'] ?? '',
      name: map['name'] ?? '',
      role: map['role'] ?? 'parent',
      employeeId: map['employee_id'] ?? '',
      phone: map['phone'] ?? '',
      email: map['email'] ?? '',
      photoUrl: map['photo_url'],
      languagePref: map['language_pref'] ?? 'en',
      darkMode: map['dark_mode'] ?? false,
      notificationsEnabled: map['notifications_enabled'] ?? true,
      fcmToken: map['fcm_token'],
      classId: map['class_id'],
      studentId: map['student_id'],
      createdAt: (map['created_at'] as Timestamp?)?.toDate() ?? DateTime.now(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'school_id': schoolId,
      'name': name,
      'role': role,
      'employee_id': employeeId,
      'phone': phone,
      'email': email,
      'photo_url': photoUrl,
      'language_pref': languagePref,
      'dark_mode': darkMode,
      'notifications_enabled': notificationsEnabled,
      'fcm_token': fcmToken,
      'class_id': classId,
      'student_id': studentId,
      'created_at': Timestamp.fromDate(createdAt),
    };
  }

  UserModel copyWith({
    String? name,
    String? photoUrl,
    String? languagePref,
    bool? darkMode,
    bool? notificationsEnabled,
    String? fcmToken,
  }) {
    return UserModel(
      uid: uid,
      schoolId: schoolId,
      name: name ?? this.name,
      role: role,
      employeeId: employeeId,
      phone: phone,
      email: email,
      photoUrl: photoUrl ?? this.photoUrl,
      languagePref: languagePref ?? this.languagePref,
      darkMode: darkMode ?? this.darkMode,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
      fcmToken: fcmToken ?? this.fcmToken,
      classId: classId,
      studentId: studentId,
      createdAt: createdAt,
    );
  }
}
