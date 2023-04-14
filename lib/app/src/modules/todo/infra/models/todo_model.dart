import '../../../../../../../ciss_test_exports.dart';

class TodoModel extends TodoEntity {
  const TodoModel(
      {required super.userId,
      super.id,
      required super.title,
      required super.completed});

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        userId: json['userId'] ?? 0,
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        completed: json['completed'] ?? false,
      );

  @override
  List<Object?> get props => [userId, id, completed, title];

  Map<String, dynamic> toJson() => {
        if (id != null) "id": id,
        "userId": userId ?? 0,
        "title": title ?? '',
        "completed": completed ?? false,
      };

  @override
  bool? get stringify => true;
}

extension TodoEntityToModel on TodoEntity {
  TodoModel get toModel => TodoModel(
      userId: userId ?? 0,
      id: id,
      title: title ?? '',
      completed: completed ?? false);
}

extension TodoModelToEntity on TodoModel {
  TodoEntity get toEntity => TodoEntity(
      userId: userId ?? 0,
      id: id ,
      title: title ?? '',
      completed: completed ?? false);
}

extension TodoModelCopyWith on TodoEntity {
  TodoEntity copyWith({int? userId, int? id, String? title, bool? completed}) =>
      TodoEntity(
        userId: userId ?? this.userId,
        id: id ?? this.id,
        title: title ?? this.title,
        completed: completed ?? this.completed,
      );
}
