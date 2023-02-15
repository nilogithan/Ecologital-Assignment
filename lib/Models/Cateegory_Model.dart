// ignore_for_file: file_names

class CategoryModel {
    CategoryModel({
         this.id,
         this.name,
         this.image,
    });

    String? id;
    String? name;
    String? image;

    factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["_id"] ?? "",
        name: json["name"]?? "",
        image: json["image"]?? "",
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "image": image,
    };
}