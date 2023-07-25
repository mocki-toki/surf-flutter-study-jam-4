import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surf_practice_magic_ball/presentation/services/slow_animation_provider.dart';
import 'package:surf_practice_magic_ball/presentation/services/theme_provider.dart';
import 'package:surf_practice_magic_ball/presentation/widgets/collapsed_header_widget.dart';
import 'package:surf_practice_magic_ball/presentation/widgets/color_picker_widget.dart';

class CollapsedHeaderBodyWidget extends StatelessWidget {
  const CollapsedHeaderBodyWidget(this.toggle, {super.key});

  final ToggleCollapsedHeader toggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: [
        AppBar(
          backgroundColor: Colors.transparent,
          title: const Text('Properties'),
          centerTitle: false,
          actions: [
            IconButton(
              icon: const Icon(Icons.close),
              onPressed: toggle,
            ),
          ],
        ),
        Consumer<ThemeProvider>(
          builder: (c, themeProvider, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ColorPickerWidget(
                selectedColor: themeProvider.seedColor,
                onSelected: (color) => themeProvider.seedColor = color,
              ),
              const SizedBox(height: 20),
              SwitchListTile(
                value: themeProvider.darkMode,
                onChanged: (value) => themeProvider.darkMode = value,
                title: const Text('Dark mode'),
              ),
            ],
          ),
        ),
        Consumer<SlowAnimationProvider>(
          builder: (c, slowAnimationProvider, _) => SwitchListTile(
            value: slowAnimationProvider.slow,
            onChanged: (value) => slowAnimationProvider.slow = value,
            title: const Text('Slow animation'),
          ),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
