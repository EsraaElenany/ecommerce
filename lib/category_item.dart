import 'package:flutter/material.dart';

import 'category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;
   CategoryItem({super.key ,required this.categoryModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300]
        // image:  DecorationImage(
        //     image: AssetImage("${categoryModel.pic}"),
        // ),
      ),
      // child: ListTile(
      //   title: Text("${categoryModel.name}"),
      //   subtitle: Text("${categoryModel.price}"),
      //   trailing: Icon(Icons.favorite) ,
      // ),

           child:
           Column(
       children: [
      Image.asset("${categoryModel.pic}",),
      Text("${categoryModel.name}"),
      Text("${categoryModel.price}"),
      Icon(Icons.favorite) ,]),
   //-----------------
   //         ListTile(
   //           title:Image.asset("${categoryModel.pic}") ,
   //            // title: Text("${categoryModel.name}"),
   //             subtitle: Text("${categoryModel.price}"),
   //             trailing: Icon(Icons.favorite) ,
   //           ),

     );
  }
}
