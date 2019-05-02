import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:musicplayer/color.dart';
import 'package:musicplayer/strings.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/animation.dart';

class ArtistPage extends StatefulWidget {
  @override
  _ArtistPageState createState() => _ArtistPageState();
}

class _ArtistPageState extends State<ArtistPage> with TickerProviderStateMixin {
  var _show = false;
  double _value = 0.0;
  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller = new AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 5000),
    );
    _animation = Tween(begin: -1.0, end: 0.0).animate(new CurvedAnimation(
      parent: _controller,
      curve: new Interval(0.0, 1.0, curve: Curves.linear),
    ));
  }

  var _title = "";
  void _up(title) {
    setState(() {
      if (!_show) {
        _show = true;
        _title = title;
        // _controller.forward();
      } else {
        _show = false;
        // _controller.reverse();
      }
    });
  }

  _topimage(height, width) {
    return new Stack(
      children: <Widget>[
        new Container(
          height: height / 1.74,
          width: width,
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.only(bottomLeft: Radius.circular(40.0)),
              image: DecorationImage(
                  image: AssetImage('assets/artist_big.jpg'),
                  fit: BoxFit.cover)),
        ),
        new Padding(
            padding: EdgeInsets.only(top: height / 1.9, left: width / 1.3),
            child: InkWell(
              onTap: () {},
              child: new Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(shape: BoxShape.circle, color: blue),
                child: new Icon(
                  Icons.play_arrow,
                  color: white,
                ),
              ),
            )),
        Align(
          alignment: Alignment.topCenter,
          child: new Container(
            height: height / 2,
            width: width,
            margin: EdgeInsets.only(left: width / 17),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new Text(
                  "Trending",
                  style: TextStyle(color: blue),
                ),
                new Padding(
                  padding: EdgeInsets.all(15.0),
                ),
                new AutoSizeText(
                  artistname,
                  maxFontSize: 50.0,
                  minFontSize: 40.0,
                  style: TextStyle(fontFamily: 'Vegan', color: white),
                ),
              ],
            ),
          ),
        ),
        new Align(
          alignment: Alignment.topCenter,
          child: new SafeArea(
            child: Container(
              margin: EdgeInsets.only(
                  left: width / 17, right: width / 17, top: 10.0),
              width: width,
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Icon(
                    Icons.menu,
                    color: white,
                  ),
                  new Icon(
                    Icons.info_outline,
                    color: white,
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  _body(height, width) {
    return new Container(
      width: width,
      margin: EdgeInsets.only(top: 15.0, right: width / 12, left: width / 12),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new AutoSizeText(
            "Popular",
            minFontSize: 20.0,
            maxFontSize: 30.0,
            style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Gidole"),
          ),
          new InkWell(
            onTap: () {},
            child: new Text(
              "Show all",
              style: TextStyle(color: blue, fontSize: 13.0),
            ),
          )
        ],
      ),
    );
  }

  _songlist(height, width) {
    return new ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: songs.length,
      itemBuilder: (context, index) {
        return new Container(
          width: width,
          margin:
              EdgeInsets.only(top: 15.0, right: width / 12, left: width / 12),
          child: new InkWell(
            onTap: () => _up(songs[index]['title']),
            child: new Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new AutoSizeText(
                    songs[index]['title'],
                    minFontSize: 12.0,
                    maxFontSize: 20.0,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      new Text(
                        songs[index]['time'],
                        style: TextStyle(color: grey, fontSize: 13.0),
                      ),
                      new Padding(
                        padding: EdgeInsets.all(5.0),
                      ),
                      new Icon(
                        FontAwesomeIcons.ellipsisH,
                        color: grey,
                      )
                    ],
                  )
                ]),
          ),
        );
      },
    );
  }

  void _setvalue(double value) => setState(() => _value = value);

  _player(height, width) {
    return new Container(
      alignment: Alignment.topCenter,
      height: height,
      width: width,
      child: new Stack(
        children: <Widget>[
          new Container(
            height: height,
            width: width,
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                color: white.withOpacity(0.0),
                child: new SafeArea(
                  child: Container(
                    alignment: Alignment.topCenter,
                    margin: EdgeInsets.only(
                        top: 20.0, left: width / 17, right: width / 17),
                    child: new Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Icon(
                          FontAwesomeIcons.longArrowAltLeft,
                          color: white,
                        ),
                        new AutoSizeText(
                          "Artist",
                          minFontSize: 18.0,
                          maxFontSize: 30.0,
                          style: TextStyle(color: white),
                        ),
                        new Icon(
                          Icons.info_outline,
                          color: white,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          new ListView(
            physics: BouncingScrollPhysics(),
            padding: EdgeInsets.all(0),
            children: <Widget>[
              new Container(
                height: height / 7,
              ),
              new Container(
                // height: height - (height / 7),
                width: width,
                decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50.0),
                        topRight: Radius.circular(50.0))),
                child: new Container(
                  margin: EdgeInsets.only(top: height / 12),
                  child: new Column(
                    children: <Widget>[
                      new Container(
                        height: height / 5.5,
                        width: width / 3.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/artist_small.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20.0)),
                      ),
                      new Container(
                        margin: EdgeInsets.only(
                            top: height / 12,
                            left: width / 15,
                            right: width / 15),
                        child: new LinearProgressIndicator(
                          value: _value,
                          backgroundColor: grey,
                          valueColor: new AlwaysStoppedAnimation<Color>(blue),
                        ),
                      ),
                      new Container(
                          margin: EdgeInsets.only(
                            top: height / 12,
                          ),
                          child: new Column(
                            children: <Widget>[
                              new Text(
                                _title,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Gidole",
                                    color: dark),
                              ),
                              new Padding(
                                padding: EdgeInsets.all(5.0),
                              ),
                              new Text(
                                "Ariana Grande",
                                style: TextStyle(color: blue),
                              )
                            ],
                          )),
                      new Container(
                          margin: EdgeInsets.only(
                            top: height / 12,
                          ),
                          alignment: Alignment.center,
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Container(
                                height: height / 12,
                                width: width / 6,
                                child: Center(
                                    child: new Icon(
                                  FontAwesomeIcons.backward,
                                  size: 15.0,
                                )),
                              ),
                              new Container(
                                height: height / 8,
                                width: width / 4,
                                child: Center(
                                    child: new Icon(
                                  FontAwesomeIcons.pause,
                                  size: 20.0,
                                )),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: grey, width: 1)),
                              ),
                              new Container(
                                height: height / 12,
                                width: width / 6,
                                child: Center(
                                    child: new Icon(
                                  FontAwesomeIcons.forward,
                                  size: 15.0,
                                )),
                              ),
                            ],
                          )),
                      new Container(
                        margin: EdgeInsets.only(
                            top: height / 12,
                            left: width / 25,
                            right: width / 25),
                        child: new Slider(
                          value: _value,
                          onChanged: _setvalue,
                          activeColor: dark,
                          inactiveColor: grey,
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var minheight = height / 4;
    return Scaffold(
      body: new Stack(
        children: <Widget>[
          new CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: <Widget>[
                SliverPersistentHeader(
                  pinned: true,
                  delegate: _SliverAppBarDelegate(
                      maxHeight: height / 1.6,
                      minHeight: minheight,
                      child: _topimage(height, width)),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [_body(height, width), _songlist(height, width)],
                  ),
                ),
              ]),
          new AnimatedContainer(
            duration: Duration(milliseconds: 5000),
            child: _show
                ? new WillPopScope(
                    onWillPop: () {
                      _up("");
                    },
                    child: _player(height, width))
                : new Container(),
            // transform:
            //     Matrix4.translationValues(0.0, _animation.value * width, 0.0),
          ),
        ],
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
  final double minHeight;
  final double maxHeight;
  final Widget child;
  @override
  double get minExtent => minHeight;
  @override
  double get maxExtent => math.max(maxHeight, minHeight);
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
