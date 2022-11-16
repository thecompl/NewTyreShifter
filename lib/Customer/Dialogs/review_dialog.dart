import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:tyreshifter/config/Color.dart';
import 'package:tyreshifter/config/Navagate_Next.dart';
import 'package:tyreshifter/config/string.dart';

import '../../Widget/Gesture.dart';
import '../../Widget/Textfield.dart';
import '../../config/TextStyles/Textstyles.dart';

class ReviewPopUp extends StatefulWidget {
  ReviewPopUp({Key? key}) : super(key: key);

  @override
  State<ReviewPopUp> createState() => _ReviewPopUpState();
}

class _ReviewPopUpState extends State<ReviewPopUp> {
  TextEditingController Write_Comment = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      child: Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
          width: size.width * 0.8,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              right: 20,
              left: 20,
              bottom: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Textfield().text(
                    review_popup,
                    TextStyles.withColor(
                        TextStyles.mb18, color.text_grey2_color)),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: RatingBar.builder(
                    itemSize: 40,
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: color.star,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: color.border_grey_color),
                        borderRadius: BorderRadius.circular(15)),
                    height: size.height * 0.2,
                    width: size.width,
                    child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: TextField(
                          maxLines: 5,
                          keyboardType: TextInputType.text,
                          controller: Write_Comment,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: write_comment,
                              hintStyle: TextStyles.mn14),
                        )),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  divider,
                ),
                Container(
                  height: 50,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 100,
                          child: GestureDetector(
                              child: Textfield().text(
                                  "Cancel",
                                  TextStyles.withColor(
                                    TextStyles.mb20,
                                    color.Primary_second_Color,
                                  ),
                                  TextAlign.center),
                              onTap: () {
                                backScreen(context);
                              }),
                        ),
                        Image.asset(
                          vertical,
                          height: size.height * 0.04,
                        ),
                        Container(
                          width: 100,
                          child: GestureDetector(
                              child: Textfield().text(
                                  "Send",
                                  TextStyles.withColor(
                                    TextStyles.mb20,
                                    color.Primary_second_Color,
                                  ),
                                  TextAlign.center),
                              onTap: () {
                                backScreen(context);
                              }),
                        ),
                      ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
