// ignore_for_file: file_names, non_constant_identifier_names

class BasketModel {
    BasketModel({
        required this.id,
        required this.basketId,
        required this.name,
        required this.image,
        required this.categoryId,
        required this.categotyName,
        required this.quantity,
        required this.price,
        required this.subTotal,
        required this.basket_unitType,
        required this.description,
    });

    String id;
    String basketId;
    String name;
    String image;
    String categoryId;
    String categotyName;
    int quantity;
    int price;
    int subTotal;
    BasketUnitType? basket_unitType;
    String description;

    factory BasketModel.fromJson(Map<String, dynamic> json) => BasketModel(
        id: json["_id"] ?? "",
        basketId: json["basketId"] ?? "",
        name: json["name"]?? "",
        image: json["image"]?? "",
        categoryId: json["category_id"]?? "",
        categotyName: json["categoty_name"]?? "",
        quantity: json["quantity"]?? 0,
        price: json["price"]?? 0,
        subTotal: json["sun_total"]?? 0,
        basket_unitType: BasketUnitType.fromJson(json["unit_type"]),
        description: json["description"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "basketId":basketId,
        "name": name,
        "image": image,
        "category_id": categoryId,
        "categoty_name": categotyName,
        "quantity": quantity,
        "price": price,
        "sun_total": subTotal,
        "unit_type": basket_unitType!.toJson(),
        "description": description,
    };
}

class BasketUnitType {
    BasketUnitType({
        required this.name,
        required this.value,
        required this.price,
    });

    String name;
    String value;
    int price;

    factory BasketUnitType.fromJson(Map<String, dynamic> json) => BasketUnitType(
        name: json["name"]?? "",
        value: json["value"]?? "",
        price: json["price"]?? 0,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "price": price,
    };
}