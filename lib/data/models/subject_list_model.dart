class SubjectListModel {
  final Map<String, String> subjectMap;

  SubjectListModel({required this.subjectMap});

  List<String> getSubjectList() {
    return subjectMap.values.toList();
  }

  factory SubjectListModel.fromJson(Map<String, dynamic> json) {
    Map<String, String> subjectMap = Map.from(json);
    return SubjectListModel(subjectMap: subjectMap);
  }
}
