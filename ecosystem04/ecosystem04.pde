// Take your creature from Step 3 and build a system of creatures. 
// Can you use inheritance and polymorphism to create a variety of creatures, derived from the same code base? 
// A. How can they interact with each other? 
//    Develop a methodology for how they compete for resources (for example, food).
// B. Can you track a creature’s “health” much like we tracked a particle’s lifespan, removing creatures when appropriate?
// C. What rules can you incorporate to control how creatures are born?
// D. Consider using a particle system itself in the design of a creature.
//    What happens if your emitter is tied to the creature’s location?)

// Food
//  Placed randomly every ?? frames.
// Prey
//  Food attracts. Predators repel. Gain health from colliding with food.
// Predators
//  Prey attracts. Other predators repel. Gain health from colliding with prey.
// Health
//  Decreases every ?? frames. If health is 0, the creature is dead.
// Eggs
//  Eggs are a type of food. Each creature lays eggs and can eat any eggs except its own kind.
//  If eggs are not eaten after ?? frames, the egg is replaced by a new creature of the appropriate kind.

