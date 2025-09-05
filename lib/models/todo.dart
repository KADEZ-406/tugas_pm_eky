class Todo {
  final String id;
  final String title;
  final bool isDone;
  final DateTime createdAt;

  Todo({
    required this.id,
    required this.title,
    required this.isDone,
    required this.createdAt,
  });

  Todo copyWith({
    String? id,
    String? title,
    bool? isDone,
    DateTime? createdAt,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      isDone: isDone ?? this.isDone,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Todo && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;
}
