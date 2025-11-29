class Player {
  final String username;
  final String skin_path;
  final String title_name;
  final int currency;
  final int progress;

  const Player({
    required this.username,
    required this.skin_path,
    required this.title_name,
    required this.currency,
    required this.progress,
  });

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      username: map['username'] as String,
      skin_path: map['skin_path'] as String,
      title_name: map['title_name'] as String,
      currency: map['currency'] as int,
      progress: map['progress'] as int,
    );
  }

  @override
  String toString() {
    return 'Player(username: $username, skin_path: $skin_path, title_name: $title_name, currency: $currency, progress: $progress)';
  }
}