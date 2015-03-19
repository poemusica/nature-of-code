class HopperSystem extends CreatureSystem {
  
  HopperSystem(PVector _orig) {
    super(_orig);
  }
  
  void addCreature(PVector _loc) {
    creatures.add(new Hopper(_loc));
  }    
}
