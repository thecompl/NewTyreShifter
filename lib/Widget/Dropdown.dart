import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tyreshifter/Suppliers/Complete_Order.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'dart:io' show Platform;

import 'Textfield.dart';

class Dropdown extends StatefulWidget {
  final border_color;
  final List list;

  final style;
  String current_value;
  final String? hinttxt;
  final hintstyle;
  final Function? onchange;
  final double? height;
  final double? width;

  final dropdowncolor;

  final Textalignment;

  final double? borderradius;

  Dropdown(
      {Key? key,
      this.border_color,
      required this.list,
      this.style,
      this.hintstyle,
      this.hinttxt,
      this.height,
      required this.current_value,
      this.width,
      this.dropdowncolor,
      this.Textalignment = AlignmentDirectional.center,
      this.borderradius = 10,
      this.onchange})
      : super(key: key);

  @override
  State<Dropdown> createState() => _DropdownState();
}

class _DropdownState extends State<Dropdown> {
  String? _chosenValue = "";
  int index = 0;
  @override
  void initState() {
    _chosenValue = widget.list[0].toString();
    widget.current_value = _chosenValue!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Column(
      children: [
        _chosenValue != ""
            ? Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      widget.hinttxt!,
                      style: widget.style,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ],
              )
            : Container(),
        Container(
          height: widget.height,
          decoration: BoxDecoration(
              color: widget.dropdowncolor,
              border: Border.all(color: widget.border_color),
              borderRadius: BorderRadius.circular(widget.borderradius!)),
          width: widget.width,
          child: Theme(
            data: Theme.of(context).copyWith(
                // background color for the dropdown items
                buttonTheme: ButtonTheme.of(context).copyWith(
              alignedDropdown:
                  true, //If false (the default), then the dropdown's menu will be wider than its button.
            )),
            child: Platform.isAndroid
                ? DropdownButton<String>(
                    iconSize: 30,
                    isExpanded: true,
                    icon: Container(
                        padding: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.keyboard_arrow_down_sharp,
                          size: 30,
                        )),
                    underline: SizedBox(),
                    value: _chosenValue,
                    //elevation: 5,
                    style: TextStyle(color: Colors.white),
                    iconEnabledColor: color.black,
                    items: widget.list.map((value) {
                      return DropdownMenuItem<String>(
                          alignment: widget.Textalignment,
                          value: value,
                          child: Container(
                            child: Textfield().text(
                              value,
                              widget.style,
                            ),
                          ));
                    }).toList(),
                    hint: Textfield().text(
                      widget.hinttxt,
                      widget.hintstyle,
                    ),
                    onChanged: (value) {
                      setState(() {
                        _chosenValue = value!;
                        // nextScreen(context, Complete_Order());
                      });
                      widget.onchange!(value);
                    },
                  )
                : CupertinoButton(
                    padding: EdgeInsets.zero,

                    // Display a CupertinoPicker with list of fruits.
                    onPressed: () => showCupertinoModalPopup(
                        context: context,
                        builder: (context) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  border: Border(
                                    bottom: BorderSide(
                                      color: Color(0xff999999),
                                      width: 0.0,
                                    ),
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    CupertinoButton(
                                      child: Text('Cancel'),
                                      onPressed: () {
                                        backScreen(context);
                                      },
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 5.0,
                                      ),
                                    ),
                                    CupertinoButton(
                                      child: Text('Confirm'),
                                      onPressed: () {
                                        setState(() {
                                          _chosenValue = widget.list[index];
                                        });
                                        backScreen(context);
                                      },
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0,
                                        vertical: 5.0,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                height: 250.0,
                                color: Color(0xfff7f7f7),
                                child: CupertinoPicker(
                                  magnification: 1.22,
                                  squeeze: 1.2,
                                  // useMagnifier: true,
                                  itemExtent: 40.0,
                                  // This is called when selected item is changed.
                                  onSelectedItemChanged: (selectedItem) {
                                    setState(() {
                                      index = selectedItem;
                                    });
                                    print(_chosenValue.toString());
                                  },
                                  children: widget.list.map((value) {
                                    return DropdownMenuItem<String>(
                                        alignment: widget.Textalignment,
                                        value: value,
                                        child: Container(
                                          child: Textfield().text(
                                            value,
                                            widget.style,
                                          ),
                                        ));
                                  }).toList(),
                                ),
                              ),
                            ],
                          );
                        }),
                    // This displays the selected fruit name.
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _chosenValue == ""
                              ? Text(
                                  widget.hinttxt!,
                                  style: widget.style,
                                  textAlign: TextAlign.center,
                                )
                              : Text(
                                  _chosenValue!,
                                  style: widget.style,
                                  textAlign: TextAlign.center,
                                ),
                          Container(
                              padding: EdgeInsets.only(right: 5),
                              child: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 30,
                                color: color.black,
                              )),
                        ],
                      ),
                    ),
                  ),
          ),
        ),
      ],
    );
  }

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => Container(
              height: 320,
              // padding: const EdgeInsets.only(top: 6.0),
              // The Bottom margin is provided to align the popup above the system navigation bar.

              // Provide a background color for the popup.
              color: CupertinoColors.systemBackground.resolveFrom(context),
              // Use a SafeArea widget to avoid system overlaps.
              child: SafeArea(
                top: false,
                child: child,
              ),
            ));
  }
}
