import 'package:flutter/material.dart';

import 'onboarding_model.dart';

class OnboardingBuilder extends StatelessWidget {
  OnBoardingModel onBoardingModel;
   OnboardingBuilder({super.key,required this.onBoardingModel});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Image.asset("${onBoardingModel.pic}"),

     const SizedBox(height: 10,),
       Text("${onBoardingModel.disc}"

        ,style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold,
        overflow: TextOverflow.ellipsis,


        ),
          maxLines:2


      )
    ],);
  }
}
