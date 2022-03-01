import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SimpleDraggableGridview extends StatelessWidget {
  final SliverGridDelegate sliverGridDelegate;
  final bool addAutomaticKeepAlives;
  final bool addRepaintBoundaries;
  final bool addSemanticIndexes;
  final double? cacheExtent;
  final Clip clipBehavior;
  final bool shrinkWrap;
  final int? semanticChildCount;
  final Axis scrollDirection;
  final bool reverse;
  final String? restorationId;
  final bool? primary;
  final ScrollPhysics? physics;
  final EdgeInsetsGeometry? padding;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final DragStartBehavior dragStartBehavior;
  final ScrollController? controller;
  final Widget Function(BuildContext, int index) itemBuilder;
  final Widget Function(BuildContext, int) dragBuilder;
  final int? itemCount;
  final void Function(int newIndex, int oldIndex) onSwap;

  const SimpleDraggableGridview({
    Key? key,
    required this.sliverGridDelegate,
    required this.itemBuilder,
    required this.dragBuilder,
    required this.onSwap,
    this.addAutomaticKeepAlives = true,
    this.addRepaintBoundaries = true,
    this.addSemanticIndexes = true,
    this.cacheExtent,
    this.clipBehavior = Clip.hardEdge,
    this.shrinkWrap = false,
    this.semanticChildCount,
    this.scrollDirection = Axis.vertical,
    this.reverse = false,
    this.restorationId,
    this.primary,
    this.physics,
    this.padding,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.dragStartBehavior = DragStartBehavior.start,
    this.controller,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: key,
      itemCount: itemCount,
      gridDelegate: sliverGridDelegate,
      addAutomaticKeepAlives: addAutomaticKeepAlives,
      addRepaintBoundaries: addRepaintBoundaries,
      addSemanticIndexes: addSemanticIndexes,
      cacheExtent: cacheExtent,
      clipBehavior: clipBehavior,
      shrinkWrap: shrinkWrap,
      semanticChildCount: semanticChildCount,
      scrollDirection: scrollDirection,
      reverse: reverse,
      restorationId: restorationId,
      primary: primary,
      physics: physics,
      padding: padding,
      keyboardDismissBehavior: keyboardDismissBehavior,
      dragStartBehavior: dragStartBehavior,
      controller: controller,
      itemBuilder: buildItem,
    );
  }

  Widget buildItem(BuildContext context, int index) {
    return Draggable<int>(
      data: index,
      feedback: dragBuilder(context, index),
      child: DragTarget<int>(
        onWillAccept: (data) => data != null,
        onAccept: (data) => swap(data, index),
        builder: (context, accepted, rejected) => itemBuilder(context, index),
      ),
      childWhenDragging: Container(),
    );
  }

  /// function taht swap item.
  void swap(int indexOne, int indexTwo) => onSwap(indexOne, indexTwo);
}
