class Skill {
  String id;
  String skill;

  Skill({this.id, this.skill});

  Skill.build(String id, String skill) {
    this.id = id;
    this.skill = skill;
  }

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

  String getSkill() {
    return skill;
  }

  @override
  String toString() {
    return 'Skill{id: $id, skill: $skill}';
  }
}
