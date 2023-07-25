import 'package:flutter/material.dart';

typedef ToggleCollapsedHeader = void Function();

typedef HeaderBodyBuilder = Widget Function(
  BuildContext context,
  ToggleCollapsedHeader toggle,
);

/// [CollapsedHeaderWidget] позволяет спрятать вверху страницы виджет,
/// и позволит его показать с помощью анимации выдвижения в стиле Material You.
class CollapsedHeaderWidget extends StatefulWidget {
  const CollapsedHeaderWidget({
    super.key,
    required this.header,
    required this.body,
  });

  final HeaderBodyBuilder header;
  final HeaderBodyBuilder body;

  @override
  State<CollapsedHeaderWidget> createState() => _CollapsedHeaderWidgetState();
}

const _animationDuration = Duration(milliseconds: 300);
const _animationCurve = Curves.linearToEaseOut;

class _CollapsedHeaderWidgetState extends State<CollapsedHeaderWidget> {
  final headerSizeKey = GlobalKey();

  bool collapsed = true;
  double headerHeight = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          headerSizeKey.currentContext!.findRenderObject()! as RenderBox;
      headerHeight = renderBox.size.height;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: _animationDuration,
      curve: _animationCurve,
      color: !collapsed
          ? Theme.of(context).colorScheme.primaryContainer
          : Theme.of(context).colorScheme.background,
      child: Material(
        type: MaterialType.transparency,
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: _animationDuration,
              curve: _animationCurve,
              top: -headerHeight * (collapsed ? 1 : 0),
              left: 0,
              right: 0,
              child: SizedBox(
                key: headerSizeKey,
                child: widget.header(context, toggle),
              ),
            ),
            AnimatedPositioned(
              duration: _animationDuration,
              curve: _animationCurve,
              top: headerHeight * (collapsed ? 0 : 1),
              left: 0,
              right: 0,
              bottom: -headerHeight * (collapsed ? 0 : 1),
              child: IgnorePointer(
                ignoring: !collapsed,
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(25),
                  ),
                  child: ColoredBox(
                    color: Theme.of(context).colorScheme.background,
                    child: AnimatedOpacity(
                      duration: _animationDuration,
                      opacity: collapsed ? 1 : 0.3,
                      child: widget.body(context, toggle),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Переключает состояние [header] виджета, показывая его или скрывая.
  void toggle() {
    setState(() => collapsed = !collapsed);
  }
}
