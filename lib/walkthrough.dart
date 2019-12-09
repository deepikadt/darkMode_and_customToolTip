import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Walkthrougth extends StatelessWidget {
  final String textContent;

  Walkthrougth({Key key, @required this.textContent}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _walkthroughForPotrait(context);
  }

  Widget _walkthroughForPotrait(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.grey),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Expanded(
            child: Icon(Icons.arrow_drop_down),
            flex: 5,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "This is a tutorial",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ),
            flex: 1,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: Text(
                "This is the tutorial subheading which is used for showing in the dummy screen for the reference",
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 5,
                    fontWeight: FontWeight.w400),
              ),
            ),
            flex: 1,
          ),
        ],
      ),
    );
  }
}
