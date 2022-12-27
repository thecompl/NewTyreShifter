import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
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
      // padding: EdgeInsets.only(left: 30, right: 30),
      child: Dialog(
        backgroundColor: color.popupbgcolor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20.0))),
        insetPadding: EdgeInsets.zero,
        child: SizedBox(
          width: size.width * 0.85,
          child: Padding(
            padding: const EdgeInsets.only(
              top: 20,
              // right: 20,
              // left: 20,
              bottom: 10,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Textfield().text(
                          review_popup,
                          TextStyles.withColor(
                              TextStyles.mb18, color.text_grey2_color)),
                      SizedBox(
                        height: 30,
                      ),
                      RatingBar(
                        wrapAlignment: WrapAlignment.start,
                        initialRating: 3,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        ratingWidget: RatingWidget(
                          full: SvgPicture.string(star_icon),
                          half: SvgPicture.string(star_icon),
                          empty: SvgPicture.string(unselected_star_icon),
                        ),
                        itemPadding: EdgeInsets.symmetric(horizontal: 9),
                        onRatingUpdate: (rating) {
                          // widget.onratingupdate!(rating);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                              color: color.white,
                              border:
                                  Border.all(color: color.border_grey_color),
                              borderRadius: BorderRadius.circular(15)),
                          height: size.height * 0.15,
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
                    ],
                  ),
                ),
                // SizedBox( child: Divider()),
                Divider(
                  thickness: 1.2,
                  height: 1,
                ),
                SizedBox(height: 10),
                Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            backScreen(context);
                          },
                          child: Container(
                            width: size.width * 0.35,
                            height: 45,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.red)),
                            child: GestureDetector(
                                child: Textfield().text(
                                    "Cancel",
                                    TextStyles.withColor(
                                      TextStyles.mb18,
                                      color.Primary_second_Color,
                                    ),
                                    TextAlign.center),
                                onTap: () {
                                  backScreen(context);
                                }),
                          ),
                        ),
                        SizedBox(width: 15),
                        Image.asset(
                          vertical,
                          height: size.height * 0.04,
                        ),
                        SizedBox(width: 15),
                        InkWell(
                          onTap: () {
                            backScreen(context);
                          },
                          child: Container(
                            width: size.width * 0.35,
                            height: 45,
                            alignment: Alignment.center,
                            // decoration: BoxDecoration(
                            //     border: Border.all(color: Colors.red)),
                            child: Textfield().text(
                                "Send",
                                TextStyles.withColor(
                                  TextStyles.mb18,
                                  color.Primary_second_Color,
                                ),
                                TextAlign.center),
                          ),
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
