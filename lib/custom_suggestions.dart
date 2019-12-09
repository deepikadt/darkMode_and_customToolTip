import 'package:flutter/material.dart';

class CustomTextFieldWithSuggestionList extends StatefulWidget {
  @override
  _CustomTextFieldWithSuggestionListState createState() =>
      _CustomTextFieldWithSuggestionListState();
}

class _CustomTextFieldWithSuggestionListState
    extends State<CustomTextFieldWithSuggestionList> {

  FocusNode _countryFocusNode = new FocusNode();
  OverlayEntry _overlayEntry;
  LayerLink _layerLink = LayerLink();
  TextEditingController _textEditingController=TextEditingController();
 
  List list = ["India", "Japan", "Russia", "U.S.", "U.K.","wfgwt","grt","Wrtrt","rtwth","trhtrh","htrh","wrthr","wrhwy","thrthhrt"];

  @override
  void initState() {
    super.initState();
    _countryFocusNode.addListener(() {
      if (_countryFocusNode.hasFocus) {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      } else
        _overlayEntry.remove();
    });
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject();
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: this._layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          // child: Material(
          //   elevation: 4.0,
          //   child: ListView(
          //     padding: EdgeInsets.zero,
          //     shrinkWrap: true,
          //     children: <Widget>[
          //       ListTile(
          //         title: Text('Syria'),
          //         onTap: () {
          //           print('Syria Tapped');
          //         },
          //       ),
          //       ListTile(
          //         title: Text('Lebanon'),
          //         onTap: () {
          //           print('Lebanon Tapped');
          //         },
          //       )
          //     ],
          //   ),
          // ),
          child: Material(
            elevation: 4.0,
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              itemCount: list.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(list[index]),
                  onTap: () {
                    print(list[index]);
                    setState(() {
                      _textEditingController.text=list[index];
                      print(_textEditingController.text);
                    });
                    
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: TextField(
        focusNode: _countryFocusNode,
        decoration: InputDecoration(labelText: "Country"),
        controller:_textEditingController ,
        textInputAction: TextInputAction.done,
      ),
    );
  }
}


//if list is long?
