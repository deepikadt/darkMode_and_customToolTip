import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sample_ui/carousel.dart' as prefix0;
import 'package:sample_ui/custom_options.dart';

import 'bloc/theme_bloc.dart';
import 'tutorial.dart';

///This project shows how to add theme in flutter application using streams.
///Also i have made a custom tooltip.
void main() => runApp(MyApp());

final bloc = ThemeBloc();

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: false,
      stream: bloc.darkThemeEnabled,
      builder: (context, snapshot) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: snapshot.data ? ThemeData.dark() : ThemeData.light(),
        home: SafeArea(child: MyPage(snapshot.data)),
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  final bool darkThemeEnabled;

  MyPage(this.darkThemeEnabled);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  OverlayEntry _overlayEntry;
  GlobalKey _keyScaffold = GlobalKey();
  GlobalKey _keyRow = GlobalKey();
  GlobalKey _keyText = GlobalKey();
  GlobalKey _keyIcon = GlobalKey();
  GlobalKey _keyAppBar = GlobalKey();

  OverlayEntry _createOverlayEntry() {
    //scaffold
    RenderBox renderBoxScaffold =
        _keyScaffold.currentContext.findRenderObject() as RenderBox;
    var scaffoldSize = renderBoxScaffold.size;
    var scaffoldPosition = renderBoxScaffold.localToGlobal(Offset.zero);
    //icon in icon button
    RenderBox renderBoxIcon =
        _keyIcon.currentContext.findRenderObject() as RenderBox;
    var iconSize = renderBoxIcon.size;
    var iconPosition = renderBoxIcon.localToGlobal(Offset.zero);
    //text before icon
    RenderBox renderBoxText =
        _keyText.currentContext.findRenderObject() as RenderBox;
    var textSize = renderBoxText.size;
    var textPosition = renderBoxText.localToGlobal(Offset.zero);
    //row in which text and icon present
    RenderBox renderBoxRow =
        _keyRow.currentContext.findRenderObject() as RenderBox;
    var rowSize = renderBoxRow.size;
    var rowPosition = renderBoxRow.localToGlobal(Offset.zero);
    //app bar
    RenderBox renderBoxAppBar =
        _keyAppBar.currentContext.findRenderObject() as RenderBox;
    var appbarSize = renderBoxAppBar.size;
    var appbarPosition = renderBoxAppBar.localToGlobal(Offset.zero);

    double position =
        scaffoldSize.width - textSize.width - iconSize.width - 20.0;

    return OverlayEntry(
      builder: (context) => Positioned(
        bottom: scaffoldSize.height / 2 - rowSize.height / 2,
        width: scaffoldSize.width,
        child: _show(position),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _keyScaffold,
      appBar: AppBar(
        key: _keyAppBar,
        title: Text("Home Page"),
        actions: <Widget>[
          Switch(
            value: widget.darkThemeEnabled,
            onChanged: bloc.changeTheme,
            activeColor: Colors.blue,
            inactiveTrackColor: Colors.white54,
            inactiveThumbColor: Colors.white,
          )
        ],
      ),
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  key: _keyRow,
                  children: <Widget>[
                    Text(
                      "Why are you asking this?",
                      key: _keyText,
                    ),
                    IconButton(
                      key: _keyIcon,
                      onPressed: () {
                        //showing custom tooltip
                        showDialog(
                            context: _keyScaffold.currentContext,
                            barrierDismissible: false,
                            builder: (context) => WillPopScope(
                                onWillPop: () async {
                                  _overlayEntry.remove();
                                  return true;
                                },
                                child: Container()));
                        _overlayEntry = _createOverlayEntry();
                        Overlay.of(context).insert(_overlayEntry);
                      },
                      icon: Icon(Icons.info),
                    ),
                  
                  ],
                ),
              ),
            ),
              RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Tutorial()));
                      },
                      child: Text("tutorial screen"),
                    ),

                      RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => prefix0.CarouselDemo()));
                      },
                      child: Text("Carousel example"),
                    ),
                    RaisedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) =>CustomOptions()));
                      },
                      child: Text("Custom options"),
                    ),
          ],
        ),
      ),
    );
  }

  Widget _show(double arrowPosition) => Material(
        type: MaterialType.transparency,
        elevation: 4.0,
        child: Container(
          height: 170.0,
          width: double.infinity,
          color: Colors.transparent,
          child: Stack(
            alignment: Alignment.topRight,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: 145.0,
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.white),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Why are we asking this?",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                              IconButton(
                                icon: SizedBox(
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.black,
                                  ),
                                ),
                                onPressed: () {
                                  _overlayEntry.remove();
                                  Navigator.pop(_keyScaffold.currentContext);
                                },
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            "The General Data Protection Regulation (GDPR) has certain requirements for where the data of European Union citizens are stored.",
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                right: arrowPosition,
                child: Padding(
                  padding: const EdgeInsets.only(top: 133.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
