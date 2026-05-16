import 'package:flutter/material.dart';

class AppColors {
  // Primary — Indigo
  static const primary          = Color(0xFF5C6BC0);
  static const primaryDark      = Color(0xFF3949AB);
  static const primaryLight     = Color(0xFFE8EAF6);
  static const primaryText      = Color(0xFF1A237E);

  // Secondary — Deep Purple
  static const secondary        = Color(0xFF7E57C2);
  static const secondaryLight   = Color(0xFFEDE7F6);
  static const secondaryText    = Color(0xFF311B92);

  // Semantic
  static const success          = Color(0xFF2E7D32);
  static const successLight     = Color(0xFFE8F5E9);
  static const successText      = Color(0xFF1B5E20);

  static const danger           = Color(0xFFC62828);
  static const dangerLight      = Color(0xFFFFEBEE);
  static const dangerText       = Color(0xFFB71C1C);

  static const warning          = Color(0xFFE65100);
  static const warningLight     = Color(0xFFFFF3E0);
  static const warningText      = Color(0xFFBF360C);

  static const info             = Color(0xFF1565C0);
  static const infoLight        = Color(0xFFE3F2FD);
  static const infoText         = Color(0xFF0D47A1);

  static const amber            = Color(0xFFF57F17);
  static const amberLight       = Color(0xFFFFFDE7);
  static const amberText        = Color(0xFFE65100);

  static const teal             = Color(0xFF00695C);
  static const tealLight        = Color(0xFFE0F2F1);
  static const tealText         = Color(0xFF004D40);

  // WhatsApp
  static const whatsapp         = Color(0xFF25D366);

  // Neutrals Light
  static const bgLight          = Color(0xFFF4F6FF);
  static const surfLight        = Color(0xFFFFFFFF);
  static const surf2Light       = Color(0xFFEEF2FF);
  static const borderLight      = Color(0xFFC5CAE9);
  static const textLight        = Color(0xFF1A237E);
  static const text2Light       = Color(0xFF37474F);
  static const text3Light       = Color(0xFF78909C);

  // Neutrals Dark
  static const bgDark           = Color(0xFF0E0E1C);
  static const surfDark         = Color(0xFF161628);
  static const surf2Dark        = Color(0xFF1C1C32);
  static const borderDark       = Color(0xFF2C2C50);
  static const textDark         = Color(0xFFC5CAE9);
  static const text2Dark        = Color(0xFF90A4AE);
  static const text3Dark        = Color(0xFF5C6BC0);

  // Role badge colors
  static Map<String, Color> roleBgLight = {
    'director':    amberLight,
    'principal':   infoLight,
    'coordinator': tealLight,
    'teacher':     successLight,
    'parent':      secondaryLight,
  };
  static Map<String, Color> roleTextLight = {
    'director':    amberText,
    'principal':   infoText,
    'coordinator': tealText,
    'teacher':     successText,
    'parent':      secondaryText,
  };

  // Subject colors
  static Map<String, Color> subjectColors = {
    'Mathematics':    Color(0xFF5C6BC0),
    'English':        Color(0xFF2E7D32),
    'Science':        Color(0xFFE65100),
    'Hindi':          Color(0xFFC62828),
    'Social Studies': Color(0xFF7E57C2),
    'Computer':       Color(0xFF1565C0),
    'Art & Craft':    Color(0xFFE65100),
    'PT/Games':       Color(0xFF00695C),
    'Library':        Color(0xFF1565C0),
    'Moral Sci.':     Color(0xFF2E7D32),
  };
}
