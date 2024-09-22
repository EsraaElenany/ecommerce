import 'package:ecommerce/product_details.dart';
import 'package:flutter/material.dart';

import 'category_model.dart';

class ProductItems extends StatelessWidget {
  CategoryModel categoryModel ;
   ProductItems({super.key, required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return   InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>
            ProductDetails(
            categoryModel: categoryModel,
            )));
      },
      child: Container(
        padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.grey[300],
              // image: DecorationImage(image: AssetImage("assets/images/pic9.jpg"),
              // fit: BoxFit.fill
              ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset("${categoryModel.pic}", width: 150,height: 100,fit: BoxFit.cover,),
            Text("${categoryModel.name ?? " "}", style: TextStyle(
                fontWeight: FontWeight.w600,
            fontSize: 15
            ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Text("${categoryModel.price}",style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15
                ),),
                IconButton(onPressed: (){}, icon: Icon(Icons.favorite,color: Colors.red,))

              ],
            ),
          ],
        ) ,
            // child: ListTile(
            //   title: Text("PHONE")`,
            //   subtitle: Text("price 300"),
            // ),


      ),
    );
  }
}
