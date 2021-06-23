import 'Skill.dart';

class Skills {
  String id;
  List<Skill> skillRow;

  Skills({this.id, this.skillRow});

  Skills.build(String id, List<Skill> skillRow) {
    this.id = id;
    this.skillRow = skillRow;
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'skillRow': skillRow.map((skill) => skill.toMap()).toList(growable: true)
    };
  }

  static Skills fromMap(Map<String, dynamic> map) {
    return Skills(
      id: map['id'],
      skillRow: map['skillRow'],
    );
  }

  void setSkills(List<Skill> skillList) {
    skillRow = skillList;
  }

  @override
  String toString() {
    return 'Skills{id: $id, skillRow: $skillRow}';
  }
}
