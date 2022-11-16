import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tyreshifter/Widget/Textfield.dart';
import 'package:tyreshifter/config/Color.dart';

import '../config/TextStyles/Textstyles.dart';
import '../config/string.dart';

class ReviewCardwidget extends StatefulWidget {
  final String destxt;

  final desstyle;

  final String customer_name;

  final custome_name_style;

  final String img;
  final bgcolor;

  ReviewCardwidget(
      {Key? key,
      required this.destxt,
      this.desstyle,
      required this.customer_name,
      this.custome_name_style,
      required this.img, this.bgcolor})
      : super(key: key);

  @override
  State<ReviewCardwidget> createState() => _ReviewCardwidgetState();
}

class _ReviewCardwidgetState extends State<ReviewCardwidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: widget.bgcolor,
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(widget.img, fit: BoxFit.cover)), //Text
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: color.appbartext_color)),
                        child: Row(
                          children: [
                            Textfield().text(widget.customer_name,
                                widget.custome_name_style),
                            Container(),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        // decoration: BoxDecoration(
                        //     border: Border.all(color: color.appbartext_color)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: RatingBar.builder(
                                itemSize: 16,
                                initialRating: 4.5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                // itemPadding:
                                //     EdgeInsets.symmetric(horizontal: 4.0),
                                itemBuilder: (context, _) => Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (rating) {
                                  print(rating);
                                },
                              ),
                            ),
                            Textfield().text(
                                "30 April,2022",
                                TextStyles.withColor(
                                    TextStyles.mb14, color.text_grey2_color),
                                TextAlign.start,
                                TextOverflow.ellipsis),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 10),
            Textfield().text(widget.destxt, widget.desstyle),
          ],
        ),
      ), //C,
    );
    ;
  }
}
