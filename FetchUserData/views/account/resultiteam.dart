import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/views/account/viewPdf.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';

import '../../../Auth/controllers/Result/deleteResult_Controller.dart';
import '../../../Auth/controllers/Result/editResult_Controller.dart';
import '../../../constants/colors.dart';
import '../../controllers/Result/ResultController.dart';
import '../../editing_labels/FeedbackLabel.dart';

class BookItem extends StatefulWidget {
  int i;
  String name;
  int rate;
  String feedback;
  String pdfUrl;
  String id;
  String createdAt;

  BookItem({
    Key? key,
    required this.i,
    required this.name,
    required this.rate,
    required this.feedback,
    required this.pdfUrl,
    required this.id,
    required this.createdAt,
  }) : super(key: key);

  @override
  State<BookItem> createState() => _BookItemState();
}

class _BookItemState extends State<BookItem> {
  ResultController _resultController = Get.put(ResultController());

  EditResultController _editResultController = Get.put(EditResultController());

  DeleteResultController _deleteResultController =
      Get.put(DeleteResultController());

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    return Container(
        height: 80,
        decoration: const BoxDecoration(
          border: Border(
            bottom: BorderSide(
              //                   <--- left side
              color: Colors.black45,
              width: 1.0,
            ),
          ),
        ),
        padding: const EdgeInsets.only(top: 10, bottom: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text(
                //   // list[num].name!.toString(),
                //   widget.name,
                //   style: const TextStyle(fontSize: 17),
                // ),
                Container(
                width: 100,
                child: Text(widget.name,
                style: TextStyle(
                  fontSize: 17
                ),),
              ),
                InkWell(
                  onLongPress: () {
                    AwesomeDialog(
                      context: context,
                      dialogType: DialogType.noHeader,
                      animType: AnimType.rightSlide,
                      body: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: Column(
                          children: [
                            Text(
                              'Rate Ai Solution',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: rBasicColor),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RatingBar.builder(
                              itemSize: 30,
                              initialRating: widget.rate.toDouble(),
                              minRating: 0,
                              direction: Axis.horizontal,
                              allowHalfRating: false,
                              itemCount: 5,
                              itemPadding:
                                  EdgeInsets.symmetric(horizontal: 1.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: ( rating) {
                                setState(() {
                                  widget.rate = rating.toInt();
                                });
                              },
                            ),
                            // SizedBox(
                            //   height: 10,
                            // ),
                            // EditingFeedbackLabel(
                            //     EditingFeedbackController: EditResultController
                            //         .EditingFeedbackController,
                            //     indexofresponce: widget.i)
                                       SizedBox(
                      height: 43.39,
                      width: double.infinity,
                      // margin: const EdgeInsets.all(20),
                      child: EditingFeedbackLabel(
                                EditingFeedbackController: EditResultController
                                    .EditingFeedbackController,
                                indexofresponce: widget.i)
                  ),
                          ],
                        ),
                      ),
                      btnCancelOnPress: () {
                     
                      },
                      btnCancelColor: Colors.grey,
                      btnOkColor: rBasicColor,
                      btnOkOnPress: () {   _editResultController.EditResult(widget.id,widget.rate);},
                    ).show();
                  },
                  child: Container(
                    height: 25,
                    child: RatingBar.builder(
                      itemSize: 20,
                      initialRating: widget.rate.toDouble(),
                      minRating: 0,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          widget.rate = rating.toInt();
                        });
                      },
                    ),
                  ),
                ),
                // RatingBar.builder(
                //   itemSize: 20,
                //   initialRating: widget.rate,
                //   minRating: 0,
                //   direction: Axis.horizontal,
                //   allowHalfRating: true,
                //   itemCount: 5,
                //   itemPadding: const EdgeInsets.symmetric(horizontal: 1.0),
                //   itemBuilder: (context, _) => const Icon(
                //     Icons.star,
                //     color: Colors.amber,
                //   ),
                //   onRatingUpdate: (rating) {
                //     print(rating);
                //   },
                // ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //list[num]['pdfUrl']  //for using for show pdf
                    IconButton(
                        icon: Icon(CupertinoIcons.eye_fill),
                        onPressed: () async {
                          Get.to(() => viewPdf(
                                i: widget.i,
                              ));
                        }),
                    // InkWell(child: Icon(Icons.delete_rounded)),
                    IconButton(
                        icon: Icon(Icons.delete_rounded),
                        onPressed: () async {
                          _deleteResultController.deleteResult(widget.id);
                          // Get.to(() => viewPdf());
                        }),
                  ],
                )
              ],
            ),
            // const SizedBox(
            //   height: 1,
            // ),
            Row(
              children: [
                Text(formatDate(widget.createdAt.toString()),
                    style: const TextStyle(color: rhint1Color, fontSize: 10)),
              ],
            )
          ],
        ));
  }
}

String formatDate(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String formattedDateTime = DateFormat('hh:mm a, dd/MM/yyyy').format(dateTime);
  return formattedDateTime;
}
