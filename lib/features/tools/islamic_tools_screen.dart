import 'package:flutter/material.dart';

import '../../core/theme/app_theme.dart';
import '../asma_ul_husna/asma_ul_husna_screen.dart';
import '../duas/my_duas_screen.dart';
import '../mosque_finder/mosque_finder_screen.dart';
import '../ramadan/ramadan_companion_screen.dart';
import '../zakat/zakat_calculator_screen.dart';

class _ToolEntry {
  final IconData icon;
  final String title;
  final String subtitle;
  final WidgetBuilder builder;
  const _ToolEntry({required this.icon, required this.title, required this.subtitle, required this.builder});
}

class IslamicToolsScreen extends StatelessWidget {
  const IslamicToolsScreen({super.key});

  static final List<_ToolEntry> _tools = [
    _ToolEntry(
      icon: Icons.calculate_outlined,
      title: 'حاسبة الزكاة',
      subtitle: 'احسب زكاة مالك بسهولة',
      builder: (_) => const ZakatCalculatorScreen(),
    ),
    _ToolEntry(
      icon: Icons.auto_awesome_outlined,
      title: 'أسماء الله الحسنى',
      subtitle: 'الأسماء التسعة والتسعون ومعانيها',
      builder: (_) => const AsmaUlHusnaScreen(),
    ),
    _ToolEntry(
      icon: Icons.nightlight_outlined,
      title: 'رفيق رمضان',
      subtitle: 'عد تنازلي للسحور والإفطار، وتتبع الصيام',
      builder: (_) => const RamadanCompanionScreen(),
    ),
    _ToolEntry(
      icon: Icons.auto_stories_outlined,
      title: 'أدعيتي',
      subtitle: 'احفظ أدعيتك الخاصة',
      builder: (_) => const MyDuasScreen(),
    ),
    _ToolEntry(
      icon: Icons.mosque_outlined,
      title: 'المساجد والمطاعم الحلال القريبة',
      subtitle: 'بحث مجاني عبر بيانات OpenStreetMap',
      builder: (_) => const MosqueFinderScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('أدوات إسلامية'), centerTitle: true),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: _tools.length,
        separatorBuilder: (_, __) => const SizedBox(height: 10),
        itemBuilder: (context, index) {
          final tool = _tools[index];
          return Card(
            child: ListTile(
              leading: Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: AppColors.primaryEmerald.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(tool.icon, color: AppColors.primaryEmerald),
              ),
              title: Text(tool.title, style: const TextStyle(fontWeight: FontWeight.w700)),
              subtitle: Text(tool.subtitle, style: const TextStyle(fontSize: 12)),
              trailing: const Icon(Icons.chevron_left),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: tool.builder)),
            ),
          );
        },
      ),
    );
  }
}
