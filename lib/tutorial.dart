import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sample_ui/walkthrough.dart';

class Tutorial extends StatefulWidget {
  @override
  _TutorialState createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
  
  final GlobalKey<ScaffoldState> _scaffoldState = GlobalKey<ScaffoldState>();
  int _currentIndexPage;
  int _pageLength;
 

  @override
  void initState() {
    _currentIndexPage = 0;
    _pageLength = 4;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      key: _scaffoldState,
      body: SafeArea(
        top: false,
        child: getTutorialView(context),
      ),
    );
  }

  Widget getTutorialView(BuildContext context) {
    return  Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: PageView(
                children: <Widget>[
                  Walkthrougth(
                    textContent: "Walkthrough one",
                  
                  ),
                  Walkthrougth(
                    textContent: "Walkthrough two",
                  
                  ),
                  Walkthrougth(
                    textContent: "Walkthrough tree",
                  ),
                  Walkthrougth(
                    textContent: "Walkthrough four",
                   
                  ),
                ],
                onPageChanged: (value) {
                  setState(() => _currentIndexPage = value);
                },
              ),
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 50.0,
            child: Padding(
              padding:  EdgeInsets.only(
                      left: 20.0,
                      right: 20.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: new DotsIndicator(
                      dotsCount: _pageLength,
                      position: _currentIndexPage,
                      decorator: DotsDecorator(
                        color: Colors.grey,
                        activeColor: Colors.blue,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 48, //48
                    width: double.infinity,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2.0)),
                      child: Text(
                       "Signup",
                        style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 16), //16
                      ),
                      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0),
                      elevation: 10,
                      color: Colors.white,
                      onPressed: () {
                       
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    
  }

 

}
