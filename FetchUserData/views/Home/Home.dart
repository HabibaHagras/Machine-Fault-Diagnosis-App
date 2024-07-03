import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/FetchUserData/controllers/Home/HomeFetchController.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/OTwidget.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/aboutUsFloat.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/feature.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/homeIteam.dart';
import 'package:flutter_application_2/FetchUserData/views/Home/ourteam.dart';
import 'package:flutter_application_2/data.dart';

import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../constants/colors.dart';

class rHome extends StatefulWidget {
  const rHome({super.key});

  @override
  State<rHome> createState() => _rHomeState();
}

class _rHomeState extends State<rHome> {
  /*---------------------ال URL بتاع اول جزء في سلايدر ------------------*/
  final urlImages = [
    'https://www.theterraproject.org/wp-content/uploads/2022/08/ai.jpeg',
    'https://assets.gatesnotes.com/8a5ac0b3-6095-00af-c50a-89056fbe4642/e675f5c2-624b-4efd-b82f-99e8a6ed968b/AI_20230215_new%20module_1200x580.jpg',
    'https://ichef.bbci.co.uk/news/1024/cpsprodpb/14202/production/_108243428_gettyimages-871148930.jpg'
  ];

  final CarouselController carouselController = CarouselController();
  int activeIndex = 0;
  int activeIndex2 = 0;
    FetchHomeController _fetchHomeController = Get.put(FetchHomeController());


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final Rheight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: rWhiteColor,
        floatingActionButton: aboutUsFloat(),
        body: ListView(
          children: [
            /*--------------- اول جزء الي فيه الصور الي بتتغير */
            Container(
                height: Rheight * .26,
                child: Stack(
                  children: [
                    CarouselSlider.builder(
                        itemCount: urlImages.length,
                        itemBuilder: ((context, index, realIndex) {
                          final urlimage = urlImages[index];
                          return buildimage(urlimage, index);
                        }),
                        options: CarouselOptions(
                            height: Rheight * .26,
                            viewportFraction: 1,
                            onPageChanged: ((index, reason) => setState(
                                  () => activeIndex = index,
                                )))),
                    Positioned(
                        bottom: 5,
                        left: size.width * .44,
                        child: buildindicator())
                  ],
                )),

            /*---------------انتهاء اول جزء ----------------------*/

            /*--------بداية جزء ال MAIN TITLE --------------- */
            Container(
              padding: EdgeInsets.only(right: 16, left: 16, top: 7),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    /* عنوان ال MAIN TITLE  */

                    "Main Title",
                    style: TextStyle(
                        color: RhomeTitleColor,
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Segoe UI'),
                  ),
                  Text(
                    /* -------------- محتوي كلام ال MAIN TITLE-------*/

                    "When you hear news about artificial intelligence (AI),\nit might be easy to assume it has nothing to do with you.\nYou might imagine that artificial intelligence is only something the big tech giants are focused on,\nand that AI doesn't impact your everyday life. In reality, artificial intelligence is encountered by people from morning until night.",
                    style: TextStyle(fontSize: 12, fontFamily: 'Segoe UI'),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 15, bottom: 20),
                    width: double.infinity,
                    height: Rheight * 0.32,

                    /* ----------------------صورة الماين تايتل---------------*/
                    child: Image(
                      image: AssetImage("assets/title.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),

            /*---------------------انتهاء جزء الماين تايتل----------------- */

            /*----------------------جزء ال Features---------------- */
            /***************************************************** 
                    ***********                            ************* 
                    ***********    here for feature card         ********** 
                    ***********                              *********** 
             
                    **************************************************** */
            FutureBuilder(
                future: _fetchHomeController.getHome(),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      physics: ScrollPhysics(),
                      itemCount: snapshot.data!.response!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return HomeItem(
                    i: index,
                    name: snapshot.data!.response![index].name.toString(),
                    image: snapshot.data!.response![index].imageUrl!.toString(), 
                    section: snapshot.data!.response![index].sectionText!.toString(),
                

                  );

                        // rFeatureBox(
                        //   list: Homee,
                        //   num: index,
                        // );
                      },
                    );
                  }
                  ;
                  return const SizedBox(
                    child: const CircularProgressIndicator(),
                    height: 0.0,
                    width: 0.0,
                  );
                }),

            /*----------------------انتهاء جزء ال features------------------ */

            /*---------------------------بداية كارد العاملين ------------------- */
            OTcont(
                A: Column(children: [
              OTCName(),

              /***************************************************** 
                    ***********                            ************* 
                    ***********    here for team card         ********** 
                    ***********                              *********** 
                    **************************************************** */
              CarouselSlider.builder(
                  itemCount: ourTeam.length,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      ourTeamCont(
                        list: ourTeam,
                        num: itemIndex,
                      ),
                  options: CarouselOptions(
                      reverse: false,
                      viewportFraction: 0.33,
                      height: 150,
                      onPageChanged: ((index, reason) => setState(
                            () => activeIndex2 = index,
                          )))),
              buildindicator2()
            ]))
          ],
        ));
  }

  Widget buildindicator() => AnimatedSmoothIndicator(
      effect:
          WormEffect(dotWidth: 10, dotHeight: 10, activeDotColor: rBasicColor),
      activeIndex: activeIndex,
      count: urlImages.length);

  Widget buildindicator2() => AnimatedSmoothIndicator(
      effect:
          WormEffect(dotWidth: 5, dotHeight: 5, activeDotColor: rBasicColor),
      activeIndex: activeIndex2 ~/ 2,
      count: ourTeam.length ~/ 3);
}

Widget buildimage(String urlimage, int index) => Container(
      // margin: EdgeInsets.symmetric(horizontal: 5),
      child: Image.network(
        urlimage,
        fit: BoxFit.cover,
        width: double.infinity,
      ),
    );
