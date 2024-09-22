import 'package:card_swiper/card_swiper.dart';
import 'package:ecommerce/product_items.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'category_item.dart';
import 'category_model.dart';

class HomePage extends StatelessWidget {
   HomePage({super.key});

  List<String> images= [
   "assets/images/pic4.jpeg",
    "assets/images/pic5.png"
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  //    backgroundColor: Color(0xffb62ee7),
      //backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text("HomePage"),
        centerTitle: true,

      ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    itemBuilder: (BuildContext context,int index){
                      return Image.asset(images[index]);
                    },
                    autoplay: true,
                    itemCount: images.length,
                    pagination: SwiperPagination(),
                    //control: SwiperControl(),
                  ),
                ),
            
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Category", style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                  ),),
                ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.38,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    separatorBuilder: (context, index)=> const SizedBox(width: 15,),
                    itemCount:categoryData.length,
                    itemBuilder: (context, index){ return  CategoryItem(
                      categoryModel: categoryData[index],
                    );}
                ),
              )
             ,
                const Align(
                  alignment: Alignment.bottomLeft,
                  child: Text("Item", style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                SizedBox(
                 // height: 500,
                  height: 300,
                  width:MediaQuery.of(context).size.width,
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: .25



                      ),
                      itemCount: 3,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index){
                        return ProductItems(

                    categoryModel: productData[index],
                        );}
                        ))
            
              ],
            ),
          ),
        ),
    );
  }
}
