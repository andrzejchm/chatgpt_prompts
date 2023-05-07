import 'dart:math';
import 'dart:ui';

import 'package:chatgpt_prompts/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

typedef SizedWidget = Widget Function(Size);

class ResizableColumn extends StatefulWidget {
  static const defaultMinDetailsHeight = 100.0;
  static const defaultMinPanelHeight = 200.0;
  static const defaultMaxPanelHeight = double.infinity;

  const ResizableColumn({
    super.key,
    required this.top,
    required this.bottom,
    this.initialPanelHeight = defaultMinPanelHeight,
    this.maxPanelHeight = defaultMaxPanelHeight,
    this.minPanelHeight = defaultMinPanelHeight,
    this.minDetailsHeight = defaultMinDetailsHeight,
  }) : assert(
          maxPanelHeight > initialPanelHeight &&
              initialPanelHeight >= minPanelHeight &&
              maxPanelHeight > minPanelHeight,
        );
  final SizedWidget top;
  final SizedWidget bottom;
  final double initialPanelHeight;
  final double maxPanelHeight;
  final double minDetailsHeight;

  final double minPanelHeight;

  @override
  State<ResizableColumn> createState() => _ResizableColumnState();
}

class _ResizableColumnState extends State<ResizableColumn> {
  static const resizerHeight = 4.0;
  static const resizerOpacity = 0.1;

  late double currentHeight = widget.initialPanelHeight;
  late double _maxLayoutHeight;

  double get maxHeight => min(_maxLayoutHeight, widget.maxPanelHeight);

  double get minHeight => max(widget.minPanelHeight, 0);

  void _clampHeight(double newHeight) {
    currentHeight = clampDouble(
      newHeight,
      min(minHeight, maxHeight),
      max(minHeight, maxHeight),
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        _maxLayoutHeight = constraints.maxHeight - widget.minDetailsHeight;
        currentHeight = clampDouble(
          currentHeight,
          min(minHeight, maxHeight),
          max(minHeight, maxHeight),
        );
        _clampHeight(currentHeight);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: currentHeight,
              child: LayoutBuilder(
                builder: (context, constraints) => widget.top(
                  Size(constraints.maxHeight, constraints.maxHeight),
                ),
              ),
            ),
            GestureDetector(
              onPanUpdate: onPanUpdate,
              child: MouseRegion(
                cursor: SystemMouseCursors.resizeRow,
                child: Container(
                  color: colorsOf(context).onBackground.withOpacity(resizerOpacity),
                  height: resizerHeight,
                  width: double.infinity,
                ),
              ),
            ),
            Expanded(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: widget.minDetailsHeight),
                child: LayoutBuilder(
                  builder: (context, cs) => widget.bottom(
                    Size(cs.maxHeight, cs.maxHeight),
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
    final moved = details.delta.dy;

    setState(() {
      _clampHeight(currentHeight + moved);
    });
  }
}
