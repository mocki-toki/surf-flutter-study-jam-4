import 'package:flutter/material.dart';

class ColorPickerWidget extends StatelessWidget {
  const ColorPickerWidget({
    super.key,
    required this.selectedColor,
    required this.onSelected,
  });

  final Color selectedColor;
  final ValueChanged<Color> onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
          crossAxisCount: 8,
        ),
        shrinkWrap: true,
        itemBuilder: (_, index) {
          final color = Colors.primaries[index][300]!;

          return _ColorItem(
            color,
            selected: color == selectedColor,
            onSelected: () => onSelected(color),
          );
        },
        itemCount: Colors.primaries.length,
      ),
    );
  }
}

class _ColorItem extends StatelessWidget {
  const _ColorItem(
    this.color, {
    required this.selected,
    required this.onSelected,
  });

  final Color color;
  final bool selected;
  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 100),
        curve: Curves.ease,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: Colors.white,
            width: selected ? 4 : 2,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 4,
            ),
          ],
        ),
      ),
    );
  }
}
