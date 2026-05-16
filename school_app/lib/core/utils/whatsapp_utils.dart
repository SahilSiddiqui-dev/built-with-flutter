import 'package:url_launcher/url_launcher.dart';

class WhatsAppUtils {
  static Future<void> contactTeacher({
    required String phone,
    required String teacherName,
    required String subject,
    required String childName,
    required String className,
  }) async {
    final message = Uri.encodeComponent(
      'Hello $teacherName, I have a query about $subject '
      'for my child $childName in Class $className. '
      'Could you please help?'
    );
    final url = Uri.parse('https://wa.me/$phone?text=$message');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  static Future<void> contactCoordinator({
    required String phone,
    required String coordinatorName,
    required String childName,
    required String className,
    String context = 'fee payment',
  }) async {
    final message = Uri.encodeComponent(
      'Hello $coordinatorName, I am contacting you regarding '
      '$context for $childName in Class $className.'
    );
    final url = Uri.parse('https://wa.me/$phone?text=$message');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }
}
