import 'package:tomath/entity/entity.dart';

class Player extends Entity{
  Player(super.HP, super.damage, super.isDead);

  void setDamage(int n){
    damage = n;
  }
}