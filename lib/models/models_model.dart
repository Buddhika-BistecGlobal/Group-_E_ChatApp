class ModelsModel {
  final String id;
  final int created;
   final String object;

  ModelsModel({
    required this.id,
    required this.object,
    required this.created,
  });

  factory ModelsModel.fromJson(Map<String, dynamic> json) => ModelsModel(
    id: json["id"],
    object:  json["object"],
    created: json["created"],
  );

  static List<ModelsModel> modelsFromSnapshot(List modelSnapshot) {
    return modelSnapshot.map((data) => ModelsModel.fromJson(data)).toList();
  }
}