// ignore_for_file: file_names

class ItemModel {
    ItemModel({
        required this.id,
        required this.name,
        required this.image,
        required this.categoryId,
        required this.categotyName,
        required this.price,
        this.unitType,
        required this.description,
    });

    String id;
    String name;
    String image;
    String categoryId;
    String categotyName;
    int price;
    List<UnitType>? unitType;
    String description;

    factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        id: json["_id"] ?? "",
        name: json["name"] ?? "",
        image: json["image"] ?? "",
        categoryId: json["category_id"] ?? "",
        categotyName: json["categoty_name"] ?? "",
        price: json["price"] ?? 0,
        unitType: json["unit_type"] == null ? [] : List<UnitType>.from(json["unit_type"]!.map((x) => UnitType.fromJson(x))),
        description: json["description"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
        "category_id": categoryId,
        "categoty_name": categotyName,
        "price": price,
        "unit_type": unitType == null ? [] : List<dynamic>.from(unitType!.map((x) => x.toJson())),
        "description": description,
    };
}

class UnitType {
    UnitType({
        required this.name,
        required this.value,
        required this.price,
    });

    String name;
    String value;
    int price;

    factory UnitType.fromJson(Map<String, dynamic> json) => UnitType(
        name: json["name"] ?? "",
        value: json["value"] ?? "",
        price: json["price"] ?? 0,
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "value": value,
        "price": price,
    };
}
