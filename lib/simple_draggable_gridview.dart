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
  State<StatefulWidget> createState() => SimpleDraggableGridviewState();
}

class SimpleDraggableGridviewState extends State<SimpleDraggableGridview> with TickerProviderStateMixin {
  late final AnimationController animationController = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      key: widget.key,
      itemCount: widget.itemCount,
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
      itemBuilder: buildItem,
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Widget buildItem(BuildContext context, int index) {
    Animation<double> translateVerticalAxisAnimation = Tween<double>(begin: 0, end: 100).animate(animationController);
    Animation<double> translateHorizontalAxisAnimation = Tween<double>(begin: 0, end: 100).animate(animationController);

    return Transform.translate(
      offset: Offset(translateVerticalAxisAnimation.value, translateHorizontalAxisAnimation.value),
      child: Draggable<int>(
        data: index,
        feedback: widget.dragBuilder(context, index),
        child: DragTarget<int>(
          onWillAccept: (data) => data != null,
          onAccept: (data) => swap(data, index, translateVerticalAxisAnimation, translateHorizontalAxisAnimation),
          builder: (context, accepted, rejected) => widget.itemBuilder(context, index),
        ),
        childWhenDragging: Container(),
      ),
    );
  }

  /// function taht swap item.
  void swap(int indexOne, int indexTwo, Animation<double> translateVerticalAxisAnimation, Animation<double> translateHorizontalAxisAnimation) {
    animationController.addListener(() => setState(() {}));
    widget.onSwap(indexOne, indexTwo);
  }
}
