import 'package:design_patterns/constants.dart';
import 'package:design_patterns/widgets/ComingSoon.dart';
import 'package:design_patterns/widgets/DesignPatternCard.dart';
import 'package:design_patterns/widgets/FadeSlideTransition.dart';
import 'package:design_patterns/widgets/PlatformBackButton.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final Map<String, dynamic> category;

  const CategoryPage({
    @required this.category,
    Key key,
  })  : assert(category != null),
        super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  final double _listAnimationIntervalStart = 0.65;
  final double _preferredAppBarHeight = 56.0;

  AnimationController _fadeSlideAnimationController;
  ScrollController _scrollController;
  double _appBarElevation = 0.0;
  double _appBarTitleOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _fadeSlideAnimationController = AnimationController(
      duration: Duration(milliseconds: 1500),
      vsync: this,
    )..forward();

    _scrollController = ScrollController()
      ..addListener(() {
        setState(() {
          _appBarElevation =
              _scrollController.offset > _scrollController.initialScrollOffset
                  ? 4.0
                  : 0.0;
          _appBarTitleOpacity = _scrollController.offset >
                  _scrollController.initialScrollOffset +
                      _preferredAppBarHeight / 2
              ? 1.0
              : 0.0;
        });
      });
  }

  @override
  void dispose() {
    _fadeSlideAnimationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Hero(
            tag: "${widget.category['id']}_background",
            child: Container(
              color: Color(int.parse(widget.category['color'])),
            ),
          ),
          SafeArea(
            child: Column(
              children: <Widget>[
                FadeSlideTransition(
                  controller: _fadeSlideAnimationController,
                  slideAnimationTween: Tween<Offset>(
                    begin: Offset(0.0, 0.5),
                    end: Offset(0.0, 0.0),
                  ),
                  begin: 0.0,
                  end: _listAnimationIntervalStart,
                  child: PreferredSize(
                    preferredSize: Size.fromHeight(_preferredAppBarHeight),
                    child: AppBar(
                      title: AnimatedOpacity(
                        opacity: _appBarTitleOpacity,
                        duration: const Duration(milliseconds: 250),
                        child: Text(widget.category['title']),
                      ),
                      backgroundColor:
                          Color(int.parse(widget.category['color'])),
                      elevation: _appBarElevation,
                      leading: PlatformBackButton(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ScrollConfiguration(
                    behavior: ScrollBehavior(),
                    child: SingleChildScrollView(
                      controller: _scrollController,
                      padding: const EdgeInsets.fromLTRB(
                        paddingL,
                        paddingZero,
                        paddingL,
                        paddingL,
                      ),
                      child: Column(
                        children: <Widget>[
                          FadeSlideTransition(
                            controller: _fadeSlideAnimationController,
                            slideAnimationTween: Tween<Offset>(
                              begin: Offset(0.0, 0.5),
                              end: Offset(0.0, 0.0),
                            ),
                            begin: 0.0,
                            end: _listAnimationIntervalStart,
                            child: Row(
                              children: <Widget>[
                                Text(
                                  widget.category['title'],
                                  style: Theme.of(context)
                                      .textTheme
                                      .title
                                      .copyWith(
                                        fontSize: 32.0,
                                        color: Colors.white,
                                      ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: spaceL),
                          for (var i = 0;
                              i < widget.category['patterns'].length;
                              i++)
                            FadeSlideTransition.staggered(
                              controller: _fadeSlideAnimationController,
                              slideAnimationTween: Tween<Offset>(
                                begin: Offset(0.0, 0.1),
                                end: Offset(0.0, 0.0),
                              ),
                              singleItemDurationInterval: 0.05,
                              index: i,
                              begin: _listAnimationIntervalStart,
                              end: 1.0,
                              child: Container(
                                margin: const EdgeInsets.only(top: marginL),
                                child: DesignPatternCard(
                                  designPattern: widget.category['patterns'][i],
                                ),
                              ),
                            ),
                          if (widget.category['patterns'].isEmpty)
                            FadeSlideTransition(
                              controller: _fadeSlideAnimationController,
                              slideAnimationTween: Tween<Offset>(
                                begin: Offset(0.0, 0.5),
                                end: Offset(0.0, 0.0),
                              ),
                              begin: 0.0,
                              end: _listAnimationIntervalStart,
                              child: ComingSoon(),
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
