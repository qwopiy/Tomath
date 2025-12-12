class Title {
  final int title_id;
  final String name;
  final int is_unlocked;

  const Title({
    required this.title_id,
    required this.name,
    required this.is_unlocked,
  });

  factory Title.fromMap(Map<String, dynamic> map) {
    return Title(
      title_id: map['title_id'] as int,
      name: map['name'] as String,
      is_unlocked: map['is_unlocked'] as int,
    );
  }

  @override
  String toString() {
    return 'Title(title_id: $title_id, name: $name, is_unlocked: $is_unlocked )';
  }
}

class Skin {
  final int skin_id;
  final String path;
  final int is_unlocked;

  const Skin({
    required this.skin_id,
    required this.path,
    required this.is_unlocked,
  });

  factory Skin.fromMap(Map<String, dynamic> map) {
    return Skin(
      skin_id: map['skin_id'] as int,
      path: map['path'] as String,
      is_unlocked: map['is_unlocked'] as int,
    );
  }

  @override
  String toString() {
    return 'Skin(skin_id: $skin_id, path: $path, is_unlocked: $is_unlocked )';
  }
}