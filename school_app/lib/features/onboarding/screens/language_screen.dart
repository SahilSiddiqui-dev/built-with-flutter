import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/constants/app_colors.dart';

class LanguageScreen extends ConsumerWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              const Icon(Icons.language, size: 80, color: AppColors.primary),
              const SizedBox(height: 32),
              Text(
                'Choose your language',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 28),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'अपनी भाषा चुनें',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontSize: 24,
                  fontFamily: 'Noto Sans Devanagari',
                ),
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              _LanguageCard(
                title: 'English',
                subtitle: 'Default language',
                onTap: () {
                  // Set locale to English
                  context.push('/login');
                },
              ),
              const SizedBox(height: 16),
              _LanguageCard(
                title: 'हिंदी',
                subtitle: 'देवनागरी लिपि',
                isHindi: true,
                onTap: () {
                  // Set locale to Hindi
                  context.push('/login');
                },
              ),
              const SizedBox(height: 48),
            ],
          ),
        ),
      ),
    );
  }
}

class _LanguageCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isHindi;

  const _LanguageCard({
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isHindi = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: isHindi ? 'Noto Sans Devanagari' : 'Baloo 2',
          ),
        ),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      ),
    );
  }
}
