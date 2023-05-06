import 'dart:math';
import 'dart:ui';

import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

typedef SizedWidget = Widget Function(Size);

class ResizableRow extends StatefulWidget {
  static const defaultMinDetailsWidth = 100.0;
  static const defaultMinPanelWidth = 200.0;
  static const defaultMaxPanelWidth = double.infinity;

  const ResizableRow({
    super.key,
    required this.panel,
    required this.details,
    this.initialPanelWidth = defaultMinPanelWidth,
    this.maxPanelWidth = defaultMaxPanelWidth,
    this.minPanelWidth = defaultMinPanelWidth,
    this.minDetailsWidth = defaultMinDetailsWidth,
  }) : assert(
          maxPanelWidth > initialPanelWidth && initialPanelWidth >= minPanelWidth && maxPanelWidth > minPanelWidth,
        );
  final SizedWidget panel;
  final SizedWidget details;
  final double initialPanelWidth;
  final double maxPanelWidth;
  final double minDetailsWidth;

  final double minPanelWidth;

  @override
  State<ResizableRow> createState() => _ResizableRowState();
}

class _ResizableRowState extends State<ResizableRow> {
  static const resizerWidth = 4.0;
  static const resizerOpacity = 0.1;

  late double currentWidth = widget.initialPanelWidth;
  late double _maxLayoutWidth;

  double get maxWidth => min(_maxLayoutWidth, widget.maxPanelWidth);

  double get minWidth => max(widget.minPanelWidth, 0);

  void _clampWidth(double newWidth) {
    currentWidth = clampDouble(
      newWidth,
      min(minWidth, maxWidth),
      max(minWidth, maxWidth),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _maxLayoutWidth = constraints.maxWidth - widget.minDetailsWidth;
        currentWidth = clampDouble(
          currentWidth,
          min(minWidth, maxWidth),
          max(minWidth, maxWidth),
        );
        _clampWidth(currentWidth);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              width: currentWidth,
              child: LayoutBuilder(
                builder: (context, constraints) => widget.panel(
                  Size(constraints.maxWidth, constraints.maxHeight),
                ),
              ),
            ),
            GestureDetector(
              onPanUpdate: onPanUpdate,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeColumn,
                child: Container(
                  color: colors(context).onBackground.withOpacity(resizerOpacity),
                  width: resizerWidth,
                  height: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: widget.minDetailsWidth),
                child: LayoutBuilder(
                  builder: (context, cs) => widget.details(
                    Size(cs.maxWidth, cs.maxHeight),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void onPanUpdate(DragUpdateDetails details) {
    final moved = details.delta.dx;

    setState(() {
      _clampWidth(currentWidth + moved);
    });
  }
}
