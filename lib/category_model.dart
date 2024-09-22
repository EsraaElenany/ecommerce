class CategoryModel{
  String? pic ;
  String? name ;
  double? price;
  String? dis;

  CategoryModel({this.pic, this.name, this.price, this.dis});
}

List<CategoryModel> categoryData=[
  CategoryModel(pic: "assets/images/pic8.jpg", name: "Iphone14", price: 200000, ),
  CategoryModel(pic: "assets/images/pic8.jpg", name: "CaverIphone", price: 2500000, ),
  CategoryModel(pic: "assets/images/pic8.jpg", name: "Iphone12", price: 50000, ),
];

List<CategoryModel> productData=[
  CategoryModel(price: 3000, pic: "assets/images/pic9.jpg", name: "phone"),
  CategoryModel(price: 400, pic: "assets/images/pic8.jpg", name:"cover", dis: "hello my new phone "),
  CategoryModel(price: 3600, pic: "assets/images/pic9.webp", ),

];