// ignore_for_file: file_names

class PlaceOrderModel {
    PlaceOrderModel({
        required this.status,
        required this.message,
    });

    bool status;
    String message;

    factory PlaceOrderModel.fromJson(Map<String, dynamic> json) => PlaceOrderModel(
        status: json["status"],
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
    };
}
