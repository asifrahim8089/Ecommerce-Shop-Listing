// To parse this JSON data, do
//
//     final storeModel = storeModelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators, prefer_null_aware_operators

import 'dart:convert';

StoreModel storeModelFromJson(String str) =>
    StoreModel.fromJson(json.decode(str));

String storeModelToJson(StoreModel data) => json.encode(data.toJson());

class StoreModel {
  StoreModel({
    this.data,
  });

  List<Datum> data;

  factory StoreModel.fromJson(Map<String, dynamic> json) => StoreModel(
        data: json["data"] == null
            ? null
            : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "data": data == null
            ? null
            : List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  Datum({
    this.markets,
    this.shops,
  });

  Markets markets;
  List<ShopElement> shops;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        markets:
            json["markets"] == null ? null : Markets.fromJson(json["markets"]),
        shops: json["shops"] == null
            ? null
            : List<ShopElement>.from(
                json["shops"].map((x) => ShopElement.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "markets": markets == null ? null : markets.toJson(),
        "shops": shops == null
            ? null
            : List<dynamic>.from(shops.map((x) => x.toJson())),
      };
}

class Markets {
  Markets({
    this.id,
    this.name,
    this.state,
    this.city,
    this.address,
    this.latitude,
    this.longitude,
    this.showDefault,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String name;
  String state;
  String city;
  String address;
  String latitude;
  String longitude;
  String showDefault;
  String image;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory Markets.fromJson(Map<String, dynamic> json) => Markets(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        address: json["address"] == null ? null : json["address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        showDefault: json["show_default"] == null ? null : json["show_default"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "address": address == null ? null : address,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "show_default": showDefault == null ? null : showDefault,
        "image": image == null ? null : image,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "deleted_at": deletedAt,
      };
}

class ShopElement {
  ShopElement({
    this.shop,
    this.offers,
    this.status,
    this.ratings,
    this.categories,
    this.shopkeeper,
  });

  ShopShop shop;
  String offers;
  String status;
  String ratings;
  List<Category> categories;
  Map<String, String> shopkeeper;

  factory ShopElement.fromJson(Map<String, dynamic> json) => ShopElement(
        shop: json["shop"] == null ? null : ShopShop.fromJson(json["shop"]),
        offers: json["offers"] == null ? null : json["offers"],
        status: json["status"] == null ? null : json["status"],
        ratings: json["ratings"] == null ? null : json["ratings"],
        categories: json["categories"] == null
            ? null
            : List<Category>.from(
                json["categories"].map((x) => Category.fromJson(x))),
        shopkeeper: json["shopkeeper"] == null
            ? null
            : Map.from(json["shopkeeper"]).map(
                (k, v) => MapEntry<String, String>(k, v == null ? null : v)),
      );

  Map<String, dynamic> toJson() => {
        "shop": shop == null ? null : shop.toJson(),
        "offers": offers == null ? null : offers,
        "status": status == null ? null : status,
        "ratings": ratings == null ? null : ratings,
        "categories": categories == null
            ? null
            : List<dynamic>.from(categories.map((x) => x.toJson())),
        "shopkeeper": shopkeeper == null
            ? null
            : Map.from(shopkeeper).map(
                (k, v) => MapEntry<String, dynamic>(k, v == null ? null : v)),
      };
}

class Category {
  Category({
    this.id,
    this.categoryType,
    this.name,
    this.slug,
    this.parentId,
    this.commission,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String categoryType;
  String name;
  String slug;
  dynamic parentId;
  String commission;
  String image;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"] == null ? null : json["id"],
        categoryType:
            json["category_type"] == null ? null : json["category_type"],
        name: json["name"] == null ? null : json["name"],
        slug: json["slug"] == null ? null : json["slug"],
        parentId: json["parent_id"],
        commission: json["commission"] == null ? null : json["commission"],
        image: json["image"] == null ? null : json["image"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "category_type": categoryType == null ? null : categoryType,
        "name": name == null ? null : name,
        "slug": slug == null ? null : slug,
        "parent_id": parentId,
        "commission": commission == null ? null : commission,
        "image": image == null ? null : image,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "deleted_at": deletedAt,
      };
}

class ShopShop {
  ShopShop({
    this.id,
    this.userId,
    this.shopName,
    this.slugName,
    this.gstNumber,
    this.shopNumber,
    this.street,
    this.landmark,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.googleAddress,
    this.latitude,
    this.longitude,
    this.openTime,
    this.closeTime,
    this.deliveryRange,
    this.description,
    this.currentSubscriptionId,
    this.qrImage,
    this.image,
    this.marketId,
    this.isShopClosed,
    this.isSelfDelivered,
    this.isAutoAccept,
    this.gstImage,
    this.shopDays,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  String id;
  String userId;
  String shopName;
  String slugName;
  String gstNumber;
  String shopNumber;
  String street;
  dynamic landmark;
  String city;
  String state;
  String country;
  String pincode;
  String googleAddress;
  String latitude;
  String longitude;
  String openTime;
  String closeTime;
  String deliveryRange;
  String description;
  String currentSubscriptionId;
  dynamic qrImage;
  String image;
  String marketId;
  String isShopClosed;
  String isSelfDelivered;
  String isAutoAccept;
  dynamic gstImage;
  String shopDays;
  String createdAt;
  String updatedAt;
  dynamic deletedAt;

  factory ShopShop.fromJson(Map<String, dynamic> json) => ShopShop(
        id: json["id"] == null ? null : json["id"],
        userId: json["user_id"] == null ? null : json["user_id"],
        shopName: json["shop_name"] == null ? null : json["shop_name"],
        slugName: json["slug_name"] == null ? null : json["slug_name"],
        gstNumber: json["gst_number"] == null ? null : json["gst_number"],
        shopNumber: json["shop_number"] == null ? null : json["shop_number"],
        street: json["street"] == null ? null : json["street"],
        landmark: json["landmark"],
        city: json["city"] == null ? null : json["city"],
        state: json["state"] == null ? null : json["state"],
        country: json["country"] == null ? null : json["country"],
        pincode: json["pincode"] == null ? null : json["pincode"],
        googleAddress:
            json["google_address"] == null ? null : json["google_address"],
        latitude: json["latitude"] == null ? null : json["latitude"],
        longitude: json["longitude"] == null ? null : json["longitude"],
        openTime: json["open_time"] == null ? null : json["open_time"],
        closeTime: json["close_time"] == null ? null : json["close_time"],
        deliveryRange:
            json["delivery_range"] == null ? null : json["delivery_range"],
        description: json["description"] == null ? null : json["description"],
        currentSubscriptionId: json["current_subscription_id"] == null
            ? null
            : json["current_subscription_id"],
        qrImage: json["qr_image"],
        image: json["image"] == null ? null : json["image"],
        marketId: json["market_id"] == null ? null : json["market_id"],
        isShopClosed:
            json["is_shop_closed"] == null ? null : json["is_shop_closed"],
        isSelfDelivered: json["is_self_delivered"] == null
            ? null
            : json["is_self_delivered"],
        isAutoAccept:
            json["is_auto_accept"] == null ? null : json["is_auto_accept"],
        gstImage: json["gst_image"],
        shopDays: json["shop_days"] == null ? null : json["shop_days"],
        createdAt: json["created_at"] == null ? null : json["created_at"],
        updatedAt: json["updated_at"] == null ? null : json["updated_at"],
        deletedAt: json["deleted_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "user_id": userId == null ? null : userId,
        "shop_name": shopName == null ? null : shopName,
        "slug_name": slugName == null ? null : slugName,
        "gst_number": gstNumber == null ? null : gstNumber,
        "shop_number": shopNumber == null ? null : shopNumber,
        "street": street == null ? null : street,
        "landmark": landmark,
        "city": city == null ? null : city,
        "state": state == null ? null : state,
        "country": country == null ? null : country,
        "pincode": pincode == null ? null : pincode,
        "google_address": googleAddress == null ? null : googleAddress,
        "latitude": latitude == null ? null : latitude,
        "longitude": longitude == null ? null : longitude,
        "open_time": openTime == null ? null : openTime,
        "close_time": closeTime == null ? null : closeTime,
        "delivery_range": deliveryRange == null ? null : deliveryRange,
        "description": description == null ? null : description,
        "current_subscription_id":
            currentSubscriptionId == null ? null : currentSubscriptionId,
        "qr_image": qrImage,
        "image": image == null ? null : image,
        "market_id": marketId == null ? null : marketId,
        "is_shop_closed": isShopClosed == null ? null : isShopClosed,
        "is_self_delivered": isSelfDelivered == null ? null : isSelfDelivered,
        "is_auto_accept": isAutoAccept == null ? null : isAutoAccept,
        "gst_image": gstImage,
        "shop_days": shopDays == null ? null : shopDays,
        "created_at": createdAt == null ? null : createdAt,
        "updated_at": updatedAt == null ? null : updatedAt,
        "deleted_at": deletedAt,
      };
}
