class Product{
  String id;
  String title;
  String description;
  String price;
  String poster;
  String price_type;
  int ratings;

  Product({this.id, this.title, this.description, this.price, this.poster,
      this.price_type, this.ratings});

  factory Product.fromJson(dynamic json){
    return Product(
        id:json['id'],
        title:json['title'],
        description:json['description'],
        price:json['price'],
        poster:json['poster'],
        price_type:json['price_type'],
        ratings:json['ratings']);
  }

}