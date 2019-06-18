import 'package:flutter/material.dart';
import 'package:waste_sorting_helper/model/wast_type_entity.dart';

enum WastType { houseHoldFood, residual, recyclable, hazardous }

class WastModel {
  String name;
  Color color;
  IconData icon;
  List<Wast> wasts = [];
  WastType type;
  String describe;
  String include;
  String requirement;

  WastModel(this.type) {
    switch (type) {
      case WastType.houseHoldFood:
        name = "湿垃圾";
        color = Colors.brown;
        icon = Icons.branding_watermark;
        describe = "日常生活垃圾产生的容易腐烂的生物质废弃物";
        include = "剩菜剩饭、瓜皮果核、花卉绿植、过期食品等";
        requirement =
            "纯流质的食物垃圾，如牛奶等，应直接倒进下水口 有包装物的湿垃圾应将包装物去除后分类投放，包装物请投放到对应的可回收物或干垃圾容器";
        break;
      case WastType.residual:
        name = "干垃圾";
        color = Colors.black;
        icon = Icons.account_box;
        describe = "除有害垃圾、可回收物、 湿垃圾以外的其他生活废弃物";
        include =
            "餐盒、餐巾纸、湿纸巾、卫生间用纸、塑料袋、 食品包装袋、污染严重的纸、烟蒂、纸尿裤、 一次性杯子、大骨头、贝壳、花盆、陶瓷等";
        requirement = "尽量沥干水分 难以辨识类别的生活垃圾投入干垃圾容器内";
        break;
      case WastType.recyclable:
        name = "可回收垃圾";
        color = Colors.blue;
        icon = Icons.restore_from_trash;
        describe = "适宜回收利用和资源化利 用的，如：玻、金、塑、 纸、衣";
        include = "酱油瓶、玻璃杯、平板玻璃、易拉罐、饮料瓶、 洗发水瓶、塑料玩具、书本、报纸、广告单、 纸板箱、衣服、床上用品等";
        requirement = "轻投轻放 清洁干燥，避免污染 废纸尽量平整 立体包装物请清空内容物，清洁后压扁投放 有尖锐边角的，应包裹后投放";
        break;
      case WastType.hazardous:
        name = "有害垃圾";
        color = Colors.red;
        icon = Icons.warning;
        describe = "对人体健康或者自然环境造成直接或潜在危害的废弃物";
        include = "废电池、油漆桶、荧光灯管、废药品及其包装物等";
        requirement = "投放时请注意轻放 易破损的请连带包装或包裹后轻放 如易挥发，请密封后投放";
        break;
    }
  }

  static WastModel fromSearch(int search) {
    WastModel model;
    switch (search) {
      case 1:
        model = WastModel(WastType.hazardous);
        break;
      case 2:
        model = WastModel(WastType.recyclable);
        break;
      case 3:
        model = WastModel(WastType.houseHoldFood);
        break;
      case 4:
        model = WastModel(WastType.residual);
        break;
      default:
        break;
    }
    return model;
  }
}
