class SubBabModel {
  final int sub_bab_id;
  final int bab_id;
  final String before_winning_info;
  final String after_winning_info;
  final String mission;
  final String material;
  final int reward;
  final int is_finished;


  const SubBabModel({
    required this.sub_bab_id,
    required this.bab_id,
    required this.before_winning_info,
    required this.after_winning_info,
    required this.mission,
    required this.material,
    required this.reward,
    required this.is_finished,
  });

  factory SubBabModel.fromMap(Map<String, dynamic> map) {
    return SubBabModel(
      sub_bab_id: map['sub_bab_id'] as int,
      bab_id: map['bab_id'] as int,
      before_winning_info: map['before_winning_info'] as String,
      after_winning_info: map['after_winning_info'] as String,
      mission: map['mission'] as String,
      material: map['material'] as String,
      reward: map['reward'] as int,
      is_finished: map['is_finished'] as int,
    );
  }

  @override
  String toString() {
    return 'SubBabModel(sub_bab_id: $sub_bab_id,'
        ' bab_id: $bab_id,'
        ' before_winning_info: $before_winning_info,'
        ' after_winning_info: $after_winning_info,'
        ' mission: $mission'
        ' material: $material'
        ' reward: $reward'
        'is_finished: $is_finished)';
  }
}