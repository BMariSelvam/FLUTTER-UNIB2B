import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({super.key});

  @override
  State<StatefulWidget> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  bool _menuShown = false;

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var opacityAnimation =
        Tween(begin: 0.0, end: 1.0).animate(animationController);
    if (_menuShown) {
      animationController.forward();
    } else {
      animationController.reverse();
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: <Widget>[
          Stack(
            clipBehavior: Clip.none,
            children: <Widget>[
              IconButton(
                  icon: const Icon(Icons.menu),
                  onPressed: () {
                    setState(() {
                      _menuShown = !_menuShown;
                    });
                  }),
              Positioned(
                right: 4.0,
                top: 48.0,
                child: FadeTransition(
                  opacity: opacityAnimation,
                  child: _ShapedWidget(
                    onlyTop: true,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: Stack(
        clipBehavior: Clip.none,
        children: <Widget>[
          Positioned(
            right: 4.0,
            top: -4.0,
            child: FadeTransition(
              opacity: opacityAnimation,
              child: _ShapedWidget(),
            ),
          ),
        ],
      ),
    );
  }
}

class _ShapedWidget extends StatelessWidget {
  _ShapedWidget({this.onlyTop = false});
  final double padding = 4.0;
  final bool onlyTop;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
          clipBehavior: Clip.antiAlias,
          shape: _ShapedWidgetBorder(
              borderRadius: BorderRadius.all(Radius.circular(padding)),
              padding: padding),
          elevation: 4.0,
          child: Container(
            padding: EdgeInsets.all(padding).copyWith(bottom: padding * 2),
            child: onlyTop
                ? SizedBox(
                    width: 150.0,
                    height: 20.0,
                  )
                : SizedBox(
                    width: 150.0,
                    height: 250.0,
                    child: Center(
                      child: Text('ShapedWidget'),
                    ),
                  ),
          )),
    );
  }
}

class _ShapedWidgetBorder extends RoundedRectangleBorder {
  const _ShapedWidgetBorder({
    required this.padding,
    side = BorderSide.none,
    borderRadius = BorderRadius.zero,
  }) : super(side: side, borderRadius: borderRadius);

  final double padding;

  @override
  Path getOuterPath(Rect rect, {TextDirection? textDirection}) {
    return Path()
      ..moveTo(rect.width - 8.0, rect.top)
      ..lineTo(rect.width - 20.0, rect.top - 16.0)
      ..lineTo(rect.width - 32.0, rect.top)
      ..addRRect(borderRadius.resolve(textDirection).toRRect(Rect.fromLTWH(
          rect.left, rect.top, rect.width, rect.height - padding)));
  }
}
