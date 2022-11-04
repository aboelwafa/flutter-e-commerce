// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, must_be_immutable, unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:market/modules/login_screen/LoginShopScreen.dart';
import 'package:market/shared/Components/components.dart';
import 'package:market/shared/network/local/Cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

//1 create class to change image in screen
class BoardingModel{
  final String image;

  BoardingModel({required this.image});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
// 2-create list contain images
    List<BoardingModel>boardin=[
      // frist image
      BoardingModel(image: 'assets/images/shopping.png'),
      BoardingModel(image: 'assets/images/addtocart.png'),
      BoardingModel(image: 'assets/images/shopping.png'),
      BoardingModel(image: 'assets/images/mobileShop.png'),
      BoardingModel(image: 'assets/images/carshop1.png'),
    ];
    bool islast= false;

      void submit()
      {
        cacheHelper.saveData(
          key: 'onBoarding', 
          value: true).then((value)
          {
            if(value!)
            {
              navigateAndFinish
        (context, ShopLogin());}}
          );
      }
    var boardController=PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(onPressed: (){
            submit();
          }, 
          child: Text('SKIP')
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index==boardin.length-1){
                    setState(() {
                      islast=true;
                    });
                  }
                  else{
                    setState(() {
                      islast=false;
                    });
                  }
                },
                controller: boardController,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>  buildBoardingItem(boardin[index]),
                itemCount: boardin.length,
                ),
            ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                 SmoothPageIndicator(
                  controller: boardController,
                   count: boardin.length,
                   effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    expansionFactor: 2,
                    dotHeight: 10.0,
                    spacing: 5,
                    activeDotColor: Colors.blue,
                   ),
                   ) ,
              Spacer(),
                FloatingActionButton(onPressed: (){
                  if(islast){
                    submit();
                  }
                  else{
                  boardController.nextPage(
                    duration:
                     Duration(milliseconds: 750),
                      curve:Curves.fastLinearToSlowEaseIn 
                      );

                  }
                },child: Icon(Icons.arrow_forward_ios),)
                ],

              ),
          ],
        ),
      ),

    );
  }

  // widget use in page.view(itemBuilde) call it
  Widget buildBoardingItem(BoardingModel model)=>Column(
        children: [
          Expanded(child: Image(image: AssetImage('${model.image}'))),

        ],
      );
}