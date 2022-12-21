/// @author       ShiShaoPo
/// @time         2022/11/922:47
/// @description  首页
class MainBean {
  final String? name;
  final int age;

  MainBean.fromJson(Map<String, dynamic> json)
      : age = int.tryParse(json["age"]) ?? -1,
        name = json["name"].toString();
// {
//   name = json["name"].toString();
//   age = int.tryParse(json["age"]) ?? -1;
// }

// static MainBean? fromJson(Map<String, dynamic> json) {
//   var bean = MainBean()
//     ..name = json["name"].toString()
//     ..age = int.tryParse(json["age"]) ?? -1;
//   return bean;
// }
}
