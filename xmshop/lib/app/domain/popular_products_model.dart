class PopularProductsEntity {
  List<PopularProductsItem>? result;

  PopularProductsEntity({this.result});

  PopularProductsEntity.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <PopularProductsItem>[];
      json['result'].forEach((v) {
        result?.add(PopularProductsItem.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PopularProductsItem {
  String? sId;
  String? title;
  String? cid;
  int? price;
  String? pic;
  String? subTitle;
  String? sPic;

  PopularProductsItem(
      {this.sId,
      this.title,
      this.cid,
      this.price,
      this.pic,
      this.subTitle,
      this.sPic});

  PopularProductsItem.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    title = json['title'];
    cid = json['cid'];
    price = json['price'];
    pic = json['pic'];
    subTitle = json['sub_title'];
    sPic = json['s_pic'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['_id'] = sId;
    data['title'] = title;
    data['cid'] = cid;
    data['price'] = price;
    data['pic'] = pic;
    data['sub_title'] = subTitle;
    data['s_pic'] = sPic;
    return data;
  }
}
