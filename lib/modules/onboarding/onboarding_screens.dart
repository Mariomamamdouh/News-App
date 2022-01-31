import 'package:flutter/material.dart';
import 'package:news_app/layout/news_layout/newslayout_screen.dart';
import 'package:news_app/shared/component/component.dart';
import 'package:news_app/shared/styles/color.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import "package:hexcolor/hexcolor.dart";

class BoardingModel {
  late final String image;
  late final String title;
  late final String body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<BoardingModel> boarding = [
    BoardingModel(
        image: "assets/images/boarding1_1.jpg",
        title: "Welcome to News App",
        body: "Always Swip Up for Viewing the Next News"),
    BoardingModel(
        image: "assets/images/boarding2.png",
        title: "Read !!",
        body: "Tap to Card to Get a Source for the News"),
    BoardingModel(
        image: "assets/images/boarding3.jpg",
        title: "Search ",
        body: "Enter To Search to search For any News")
  ];
  var onboardcontroller = PageController();
  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Expanded(
                child: PageView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: onboardcontroller,
                  itemBuilder: (context, index) =>
                      BuildBoardItem(boarding[index]),
                  itemCount: 3,
                  onPageChanged: (int index){
                    if(index==boarding.length-1){
                      setState(() {
                        isLast=true;
                      });
                    }
                    else{
                      setState(() {
                        isLast=false;
                      });
                    }
                  },
                ),
              ),

              SmoothPageIndicator(
                  controller: onboardcontroller,
                  count: boarding.length,
                  effect: SwapEffect(
                    dotHeight: 14.0,
                      dotWidth: 15.0,
                      spacing: 10,
                      activeDotColor: HexColor("73C991"),
                      dotColor: HexColor("e5e5e5"))),
              Row(
                children: [
                  TextButton(
                      onPressed: () {
                        NavigateAndFinish(context, NewsScreen());
                      },
                      child: Text(
                        "SKIP",
                        style: TextStyle(color: Colors.grey[600]),
                      )),
                  //SizedBox(width: 60.0,),

                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        if(isLast){
                          NavigateAndFinish(context, NewsScreen());
                        }
                        else {
                          onboardcontroller.nextPage(
                              duration: const Duration(milliseconds: 700),
                              curve: Curves.easeInOutExpo);
                        }},
                      child: const Text("NEXT"))
                ],
              ),
            ],
          ),
        ));
  }

  Widget BuildBoardItem(BoardingModel model) => Column(
        //  crossAxisAlignment: CrossAxisAlignment.,
        children: [
          Expanded(
            flex: 5,
            child: Image(
              image: AssetImage("${model.image}"),
              fit: BoxFit.fitWidth,
            ),
          ),
          // SizedBox(height: 10.0,),
          Text(
            "${model.title}",
            style: const TextStyle(
                fontSize: 24.0, fontFamily: "pacifico", color: defaultColor),
          ),
          SizedBox(height: 20.0,),
          Expanded(
            flex: 1,
            child: Text(
              "${model.body}",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16.0, color: Colors.grey[400]),
            ),
          ),
        ],
      );
}
