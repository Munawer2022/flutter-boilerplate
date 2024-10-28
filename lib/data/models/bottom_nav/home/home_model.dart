class HomeModel {
  HomeModel();
  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel();
  factory HomeModel.empty() => HomeModel();
  //fromJson is null pass ?? ""
}
