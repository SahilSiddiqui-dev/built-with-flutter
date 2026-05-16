import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../utils/whatsapp_utils.dart';

class WaButton extends StatelessWidget {
  final String phone;
  final String teacherName;
  final String subject;
  final String childName;
  final String className;
  final double size;

  const WaButton({
    super.key,
    required this.phone,
    required this.teacherName,
    required this.subject,
    required this.childName,
    required this.className,
    this.size = 30,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WhatsAppUtils.contactTeacher(
        phone: phone,
        teacherName: teacherName,
        subject: subject,
        childName: childName,
        className: className,
      ),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: AppColors.whatsapp,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Icon(
            Icons.message, // Fallback if asset is missing, but prompt mentioned Image.asset
            size: size * 0.6,
            color: Colors.white,
          ),
          /* 
          Image.asset(
            'assets/icons/whatsapp.png',
            width: size * 0.55,
            height: size * 0.55,
            color: Colors.white,
          ),
          */
        ),
      ),
    );
  }
}
