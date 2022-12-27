import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/string.dart';

import '../Widget/Custome_Dialog.dart';
import '../Widget/Texboxwidget.dart';
import '../Widget/Textfield.dart';
import '../config/Navagate_Next.dart';
import '../config/TextStyles/Textstyles.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  RangeValues _currentRangeValuessuv = const RangeValues(0, 100);
  RangeValues _currentRangeValuesnormal = const RangeValues(0, 100);
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          // decoration: BoxDecoration(border: Border.all(color: Colors.red)),
          height: size.height,
          width: size.width,
          child: Image.asset(
            mapimage,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            showDialog(
                context: context,
                builder: (BuildContext context) => StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                      return Custom_dialog(
                        bgpopupcolor: color.popupbgcolor,
                        iconsvg: Editsvg,
                        iconheight: 50.0,
                        title: edittxt,
                        showchild: true,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 20),
                            Center(
                              child: Textfield().text(
                                  "Filters",
                                  TextStyles.withColor(
                                      TextStyles.mb20, color.text_grey2_color)),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            setprice_card1("Price"),
                            Divider(
                              thickness: 2,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child:
                                  Textfield().text("Ratings", TextStyles.mb20),
                            ),
                            SizedBox(height: 10),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: RatingBar.builder(
                                initialRating: 3,
                                itemSize: 30,
                                minRating: 1,
                                direction: Axis.horizontal,
                                textDirection: TextDirection.ltr,
                                allowHalfRating: true,
                                itemCount: 5,
                                unratedColor: color.unselected_color,
                                itemPadding:
                                    EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(Icons.star,
                                    color: Colors.amber, size: 7),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            SizedBox(height: 20),
                            Divider(
                              thickness: 2,
                            ),
                            setprice_card1("Distance"),
                          ],
                        ),
                        cancellabel: cancel,
                        confirmlabel: apply,
                        Oncanceltap: () {
                          backScreen(context);
                        },
                        Onconfirmtap: () {
                          backScreen(context);
                        },
                      );
                    }));
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SvgPicture.string(filtersvgicon),
          ),
        )
      ],
    );
  }

  setprice_card1(txt) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Textfield().text(txt, TextStyles.mb20),
          Container(
              color: Colors.transparent,
              height: 50,
              // height: 100,
              // width: 3000,
              child: SliderTheme(
                data: SliderThemeData(
                    trackHeight: 4,
                    activeTrackColor: color.Primary_second_Color,
                    overlayShape: SliderComponentShape.noOverlay,
                    inactiveTrackColor: color.border_grey_color,
                    thumbColor: color.white,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 20)),
                child: RangeSlider(
                  values: _currentRangeValuessuv,
                  min: 0,
                  max: 100,
                  // divisions: 10,
                  labels: RangeLabels(
                    _currentRangeValuessuv.start.round().toString(),
                    _currentRangeValuessuv.end.round().toString(),
                  ),
                  onChanged: (RangeValues values) {
                    setState(() {
                      _currentRangeValuessuv = values;
                    });
                  },
                ),
              )),
        ],
      ),
    );
  }

  setprice_card2(txt) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Textfield().text(txt, TextStyles.mb16),
            Container(
                height: 50,
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: SliderTheme(
                  data: SliderThemeData(
                      trackHeight: 1,
                      overlayShape: SliderComponentShape.noOverlay,
                      activeTrackColor: color.border_grey_color,
                      inactiveTrackColor: color.border_grey_color,
                      thumbColor: color.Primary_second_Color,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 20)),
                  child: Container(
                    // width: double.infinity,
                    child: RangeSlider(
                      values: _currentRangeValuesnormal,
                      min: 0,
                      max: 300,
                      // divisions: 10,
                      labels: RangeLabels(
                        _currentRangeValuesnormal.start.round().toString(),
                        _currentRangeValuesnormal.end.round().toString(),
                      ),
                      onChanged: (RangeValues values) {
                        setState(() {
                          _currentRangeValuesnormal = values;
                        });
                      },
                    ),
                  ),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.border_grey_color)),
                  child: Textfield().text(
                      "kr" + _currentRangeValuesnormal.start.round().toString(),
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color),
                      TextAlign.center),
                ),
                Container(
                  alignment: Alignment.center,
                  height: 40,
                  width: 70,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: color.border_grey_color)),
                  child: Textfield().text(
                      "kr" + _currentRangeValuesnormal.end.round().toString(),
                      TextStyles.withColor(
                          TextStyles.mb14, color.txt_dark_color),
                      TextAlign.center),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
