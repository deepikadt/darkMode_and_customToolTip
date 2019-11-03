import 'package:flutter/material.dart';

class CustomToolTip extends StatefulWidget {
  //this context is required for getting size of screen used to position the custom tooltip
  final BuildContext context;

  CustomToolTip(this.context);
  @override
  _CustomToolTipState createState() => _CustomToolTipState();
}

class _CustomToolTipState extends State<CustomToolTip> {
  //overlay will let us create a widget and with help of positioned we can position that widget anywhere in the screen by finding out it's coordinates.
  OverlayEntry _overlayEntry;

  @override
  void initState() {
    super.initState();
  }

  OverlayEntry _createOverlayEntry() {
    //scaffold
    RenderBox renderBox = widget.context.findRenderObject();
    var size = renderBox.size;
    var position = renderBox.localToGlobal(Offset.zero);
    //icon button
    RenderBox renderBoxIcon = context.findRenderObject();
    var sizeIcon = renderBoxIcon.size;
    var iconPosition = renderBoxIcon.localToGlobal(Offset.zero);

    // left: iconPosition.dx,
    // top: iconPosition.dy + sizeIcon.height + 5.0,
    // width: sizeIcon.width,
    return OverlayEntry(
      builder: (context) => Positioned(
        //  left:iconPosition.dx ,
        bottom: iconPosition.dy,
        width: size.width,
        child: _show(),
      ),
    );
  }

  Widget _show() => Material(
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
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 133.0),
                  child: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        _overlayEntry = _createOverlayEntry();
        Overlay.of(context).insert(_overlayEntry);
      },
      icon: Icon(Icons.info),
    );
  }
}
