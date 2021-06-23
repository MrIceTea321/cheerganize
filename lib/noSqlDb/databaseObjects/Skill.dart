class Skill {
  final String id;
  String skill;

  Skill({this.id, this.skill});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'skill': skill,
    };
  }

  static Skill fromMap(Map<String, dynamic> map) {
    return Skill(
      id: map['id'],
      skill: map['skill'],
    );
  }

  void setSkill(String value) {
    skill = value;
  }
}
