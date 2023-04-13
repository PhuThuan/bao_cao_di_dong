import 'package:bao_cao_cuoi_ki/provider/dart_theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      body: Center(
        child: SwitchListTile(
          title: Text(themeState.getDarkTheme
              ? 'Bật chế độ dùng trong ánh sáng'
              : 'Bật chế độ dùng trong bóng tối'),
          secondary: Icon(themeState.getDarkTheme
              ? Icons.dark_mode_outlined
              : Icons.light_mode_outlined),
          // thay doi nen
          value: themeState.getDarkTheme,
          onChanged: (bool value) {
            themeState.setDarkTheme = value;
          },
        ),
      ),
    );
  }
}
