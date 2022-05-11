
class Products {
  int? id;
  String? title;
  num? price;
  String? image;
  String? description;
  String? category;


  Products(
      {this.id,
        this.title,
        this.price,
        this.image,
        this.description,
        this.category,

      });

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
    category = json['category'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    data['category'] = this.category;
    return data;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Products &&
        o.id == id &&
        o.title == title &&
        o.image == image &&
        o.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
    title.hashCode ^
    image.hashCode ^
    price.hashCode;
  }
}