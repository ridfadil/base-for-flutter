import 'package:flutter/material.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

class PKCardSkeleton extends StatefulWidget {
  final bool isCircularImage;
  final bool isBottomLinesActive;
  PKCardSkeleton(
      {this.isCircularImage = true, this.isBottomLinesActive = true});
  @override
  _PKCardSkeletonState createState() => _PKCardSkeletonState();
}

class _PKCardSkeletonState extends State<PKCardSkeleton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    animation = Tween<double>(begin: -1.0, end: 2.0).animate(
        CurvedAnimation(curve: Curves.easeInOutSine, parent: _controller));

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed ||
          status == AnimationStatus.dismissed) {
        _controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      height: width * 0.13,
                      width: width * 0.13,
                      decoration:
                      myBoxDec(animation, isCircle: widget.isCircularImage),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      height: width * 0.13,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            height: height * 0.008,
                            width: width * 0.3,
                            decoration: myBoxDec(animation),
                          ),
                          Container(
                            height: height * 0.007,
                            width: width * 0.2,
                            decoration: myBoxDec(animation),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                widget.isBottomLinesActive
                    ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: height * 0.007,
                      width: width * 0.7,
                      decoration: myBoxDec(animation),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.007,
                      width: width * 0.8,
                      decoration: myBoxDec(animation),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: height * 0.007,
                      width: width * 0.5,
                      decoration: myBoxDec(animation),
                    ),
                  ],
                )
                    : Offstage()
              ],
            ),
          ),
        );
      },
    );
  }
}

class PKCardListSkeleton extends StatelessWidget {
  final bool isCircularImage;
  final bool isBottomLinesActive;
  final int length;
  PKCardListSkeleton({
    this.isCircularImage = true,
    this.length = 10,
    this.isBottomLinesActive = true,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: length,
      itemBuilder: (BuildContext context, int index) {
        return PKCardSkeleton(
          isCircularImage: isCircularImage,
          isBottomLinesActive: isBottomLinesActive,
        );
      },
    );
  }
}