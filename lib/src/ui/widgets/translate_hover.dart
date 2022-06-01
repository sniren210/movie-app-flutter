import 'package:flutter/material.dart';
import 'package:movies/movies.dart';

class TranslateOnHover extends StatefulWidget {
  final Widget child;

  const TranslateOnHover({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  _TranslateOnHoverState createState() => _TranslateOnHoverState();
}

class _TranslateOnHoverState extends State<TranslateOnHover> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: SingleChildScrollView(
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              transform: _hovering ? hoverTransform : nonHoverTransform,
              child: widget.child,
            ),
            Transform(
              transform: Matrix4.identity()..translate(0, -15, 0),
              child: AnimatedOpacity(
                opacity: _hovering ? 1 : 0,
                duration: const Duration(milliseconds: 200),
                child: CircleAvatar(
                  backgroundColor:
                      context.isDarkTheme ? Colors.white : Colors.black,
                  radius: 2.0,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}

class TranslateOnActive extends StatefulWidget {
  final Widget child;
  final bool active;

  const TranslateOnActive({Key? key, required this.child, this.active = false})
      : super(key: key);

  @override
  _TranslateOnActiveState createState() => _TranslateOnActiveState();
}

class _TranslateOnActiveState extends State<TranslateOnActive> {
  final nonHoverTransform = Matrix4.identity()..translate(0, 0, 0);
  final hoverTransform = Matrix4.identity()..translate(0, -5, 0);

  bool get _hovering => widget.active;
  set _hovering(value) => value;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => _mouseEnter(true),
      onExit: (e) => _mouseEnter(false),
      child: Column(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            transform: _hovering ? hoverTransform : nonHoverTransform,
            child: widget.child,
          ),
          Transform(
            transform: Matrix4.identity()..translate(0, -15, 0),
            child: AnimatedOpacity(
              opacity: _hovering ? 1 : 0,
              duration: const Duration(milliseconds: 200),
              child: CircleAvatar(
                backgroundColor:
                    context.isDarkTheme ? Colors.white : Colors.black,
                radius: 2.0,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _mouseEnter(bool hover) {
    setState(() {
      _hovering = hover;
    });
  }
}
