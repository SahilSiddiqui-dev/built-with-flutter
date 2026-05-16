import 'package:flutter/material.dart';
import '../../../../core/l10n/app_localizations.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.timetable)),
      body: Center(child: Text(l10n.timetable)),
    );
  }
}
