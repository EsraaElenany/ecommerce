import 'package:ecommerce/shared.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'enums.dart';
import 'register_page.dart';
import 'onboarding_builder.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
   OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  List<Color> colors=[
    Colors.pink,
    Colors.yellow, Colors.green,Colors.yellow, Colors.pink,

  ];

  bool isLast = false;

 var title = "skip";

 var pageController = PageController();

   // saveOnBoarding(bool done, ){
   //   Shared.putBOOL(key: SharedKeys.isLastOnBoarding, value: done);
   //   Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> LoginPage())
   //       ,(route) => false );
   // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar:  AppBar(
         actions:   [
           TextButton(onPressed: (){
             setState(() {

                isLast= true;
                Shared.putBOOL(key: SharedKeys.isLastOnBoarding, value: isLast);
               Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RegisterPage())
                   ,(route) => false );
             });
             // back
             // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginPage()));

           },
             child: const Text("Skip", style: TextStyle(fontSize: 25,
               fontWeight: FontWeight.bold),), )
           // Padding(
           //   padding: EdgeInsets.all(8.0),
           //   child: Text("Skip", style: TextStyle(fontSize: 25,
           //       fontWeight: FontWeight.bold),),
           // ),
         ],
       ),
        body:
        // PageView(
        //   scrollDirection: Axis.vertical,
        //   children: [
        //      Container(
        //
        //        decoration: BoxDecoration(
        //          color: Colors.amber,
        //          borderRadius: BorderRadius.circular(20)
        //        ),
        //      ),
        //
        //      Container(
        //
        //        decoration: BoxDecoration(
        //          color: Colors.red,
        //          borderRadius: BorderRadius.circular(20)
        //        ),
        //      ),
        //
        //
        //
        //   ],
        // )
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: PageView.builder(
          controller: pageController,
            itemCount: data.length,
            onPageChanged: (index){
              if(index == data.length-1)
                {
                  setState(() {
                    isLast= true;
                  });

                } else {
                setState(() {
                  isLast = false;
                });

              }
            },
            itemBuilder:(context, index){
              return Column(
                children: [
                  OnboardingBuilder(onBoardingModel: data[index],),
                  const SizedBox(height: 10,),
                  SmoothPageIndicator(
                    controller: pageController,
                    count:  data.length,
                    axisDirection: Axis.horizontal,
              effect: const JumpingDotEffect(
                    dotHeight: 16,
                    dotWidth: 16,
                    jumpScale: .7,
                    verticalOffset: 15,
                  ),
                  ),
                  const SizedBox(height: 10,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Visibility(
                      visible: isLast,
                      child: ElevatedButton(onPressed: (){
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=> RegisterPage())
                            ,(route) => false );
                        Shared.putBOOL(key: SharedKeys.isLastOnBoarding, value: isLast);

                      }, child:
                                       const Text("Next",style: TextStyle(fontSize: 25,
                          fontWeight: FontWeight.bold),),),
                    ),
                  )
                ],
              );
            }
            ),
      ));
  }
}
