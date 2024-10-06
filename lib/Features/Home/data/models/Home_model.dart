
import 'dart:convert';

Getproducts getproductsFromJson(String str) => Getproducts.fromJson(json.decode(str));

String getproductsToJson(Getproducts data) => json.encode(data.toJson());

class Getproducts {
    bool status;
    dynamic message;
    Data data;

    Getproducts({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Getproducts.fromJson(Map<String, dynamic> json) => Getproducts(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    List<Banner> banners;
    List<Product> products;
    String ad;

    Data({
        required this.banners,
        required this.products,
        required this.ad,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: List<Banner>.from(json["banners"].map((x) => Banner.fromJson(x))),
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        ad: json["ad"],
    );

    Map<String, dynamic> toJson() => {
        "banners": List<dynamic>.from(banners.map((x) => x.toJson())),
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "ad": ad,
    };
}

class Banner {
    int id;
    String image;
    dynamic category;
    dynamic product;

    Banner({
        required this.id,
        required this.image,
        required this.category,
        required this.product,
    });

    factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        image: json["image"],
        category: json["category"],
        product: json["product"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "category": category,
        "product": product,
    };
}

class Product {
    int id;
    double price;
    double oldPrice;
    int discount;
    String image;
    String name;
    String description;
    List<String> images;
    bool inFavorites;
    bool inCart;

    Product({
        required this.id,
        required this.price,
        required this.oldPrice,
        required this.discount,
        required this.image,
        required this.name,
        required this.description,
        required this.images,
        required this.inFavorites,
        required this.inCart,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        price: json["price"]?.toDouble(),
        oldPrice: json["old_price"]?.toDouble(),
        discount: json["discount"],
        image: json["image"],
        name: json["name"],
        description: json["description"],
        images: List<String>.from(json["images"].map((x) => x)),
        inFavorites: json["in_favorites"],
        inCart: json["in_cart"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "price": price,
        "old_price": oldPrice,
        "discount": discount,
        "image": image,
        "name": name,
        "description": description,
        "images": List<dynamic>.from(images.map((x) => x)),
        "in_favorites": inFavorites,
        "in_cart": inCart,
    };
}
