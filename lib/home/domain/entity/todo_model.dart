import 'package:equatable/equatable.dart';

class ToDo extends Equatable {
  const ToDo({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.done,
  });

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? '',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'] as String)
          : DateTime.now(),
      updatedAt: json['updatedAt'] != null
          ? DateTime.parse(json['updatedAt'] as String)
          : DateTime.now(),
      done: json['done'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      'done': done,
    };
  }

  final String id;
  final String name;
  final DateTime createdAt;
  final DateTime updatedAt;
  final bool done;

  @override
  List<Object?> get props => [id, name, createdAt, updatedAt, done];
}

List<ToDo> toDosFromJson(List<dynamic> jsonList) {
  return jsonList
      .map((json) => ToDo.fromJson(json as Map<String, dynamic>))
      .toList();
}
