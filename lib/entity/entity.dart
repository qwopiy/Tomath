class Entity {
  int HP = 10;
  int damage = 3;
  bool isDead = false;

  Entity(this.HP, this.damage, this.isDead);

  void takeDamage(int n) {
    if (isDead)
      return;
    HP -= n;
    if (HP < 0) {
      isDead = true;
      HP = 0;
    }
  }

  void attack(Entity attackedEntity){
    attackedEntity.takeDamage(damage);
  }
}