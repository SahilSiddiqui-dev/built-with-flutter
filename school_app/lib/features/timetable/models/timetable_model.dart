class TimetableSlot {
  final String day;
  final String startTime;
  final String endTime;
  final String subject;
  final String teacherName;
  final String room;

  TimetableSlot({
    required this.day,
    required this.startTime,
    required this.endTime,
    required this.subject,
    required this.teacherName,
    required this.room,
  });

  factory TimetableSlot.fromMap(Map<String, dynamic> map) {
    return TimetableSlot(
      day: map['day'] ?? '',
      startTime: map['start_time'] ?? '',
      endTime: map['end_time'] ?? '',
      subject: map['subject'] ?? '',
      teacherName: map['teacher_name'] ?? '',
      room: map['room'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'day': day,
      'start_time': startTime,
      'end_time': endTime,
      'subject': subject,
      'teacher_name': teacherName,
      'room': room,
    };
  }
}
