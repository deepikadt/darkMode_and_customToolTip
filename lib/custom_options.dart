import 'package:flutter/material.dart';
import 'package:sample_ui/custom_suggestions.dart';

class CustomOptions extends StatefulWidget {
  @override
  _CustomOptionsState createState() => _CustomOptionsState();
}

class _CustomOptionsState extends State<CustomOptions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App"),
      ),
      body:  SingleChildScrollView(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(

              children: <Widget>[
               CustomTextFieldWithSuggestionList(),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "City"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                TextField(
                  decoration: InputDecoration(labelText: "Address"),
                ),
                SizedBox(
                  height: 10.0,
                ),
                RaisedButton(
                  child: Text("Submit"),
                  onPressed: () {},
                ),
                
              ],
            ),
          ),
      ),
     
    );
  }
}
