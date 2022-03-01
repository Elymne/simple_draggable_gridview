import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SimpleDraggableGridview extends StatefulWidget {
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
  final List<Widget> children;

  const SimpleDraggableGridview({
    Key? key,
    required this.sliverGridDelegate,
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
    this.children = const <Widget>[],
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => SimpleDraggableGridviewState();
}

class SimpleDraggableGridviewState extends State<SimpleDraggableGridview> {
  @override
  Widget build(BuildContext context) {
    return GridView(
      key: widget.key,
      gridDelegate: widget.sliverGridDelegate,
      addAutomaticKeepAlives: widget.addAutomaticKeepAlives,
      addRepaintBoundaries: widget.addRepaintBoundaries,
      addSemanticIndexes: widget.addSemanticIndexes,
      cacheExtent: widget.cacheExtent,
      clipBehavior: widget.clipBehavior,
      shrinkWrap: widget.shrinkWrap,
      semanticChildCount: widget.semanticChildCount,
      scrollDirection: widget.scrollDirection,
      reverse: widget.reverse,
      restorationId: widget.restorationId,
      primary: widget.primary,
      physics: widget.physics,
      padding: widget.padding,
      keyboardDismissBehavior: widget.keyboardDismissBehavior,
      dragStartBehavior: widget.dragStartBehavior,
      controller: widget.controller,
      children: widget.children,
    );
  }
}
