// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
  Category({
    this.id,
    this.code,
    this.sortOrder,
    this.visible,
    this.featured,
    this.lineage,
    this.depth,
    this.parent,
    this.description,
    this.productCount,
    this.store,
    this.children,
  });

  int id;
  String code;
  int sortOrder;
  bool visible;
  bool featured;
  String lineage;
  int depth;
  dynamic parent;
  Description description;
  int productCount;
  String store;
  List<dynamic> children;

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    code: json["code"],
    sortOrder: json["sortOrder"],
    visible: json["visible"],
    featured: json["featured"],
    lineage: json["lineage"],
    depth: json["depth"],
    parent: json["parent"],
    description: Description.fromJson(json["description"]),
    productCount: json["productCount"],
    store: json["store"],
    children: List<dynamic>.from(json["children"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "code": code,
    "sortOrder": sortOrder,
    "visible": visible,
    "featured": featured,
    "lineage": lineage,
    "depth": depth,
    "parent": parent,
    "description": description.toJson(),
    "productCount": productCount,
    "store": store,
    "children": List<dynamic>.from(children.map((x) => x)),
  };
}

class Description {
  Description({
    this.id,
    this.language,
    this.name,
    this.description,
    this.friendlyUrl,
    this.keyWords,
    this.highlights,
    this.metaDescription,
    this.title,
  });

  int id;
  String language;
  String name;
  String description;
  String friendlyUrl;
  String keyWords;
  String highlights;
  String metaDescription;
  String title;

  factory Description.fromJson(Map<String, dynamic> json) => Description(
    id: json["id"],
    language: json["language"],
    name: json["name"],
    description: json["description"],
    friendlyUrl: json["friendlyUrl"],
    keyWords: json["keyWords"],
    highlights: json["highlights"],
    metaDescription: json["metaDescription"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "language": language,
    "name": name,
    "description": description,
    "friendlyUrl": friendlyUrl,
    "keyWords": keyWords,
    "highlights": highlights,
    "metaDescription": metaDescription,
    "title": title,
  };
}
