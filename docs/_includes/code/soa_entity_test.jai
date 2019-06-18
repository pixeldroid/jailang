// from https://youtu.be/ZHqFrNyLlpA?t=3565

Vector3 :: struct {
  x : float = 1;
  y : float = 4;
  z : float = 9;
}

soa_entity_test :: () {

  Entity :: struct SOA { // <-- SOA on the struct declaration
    position : Vector3;
    id : int;
    flags : u32;
  }

  Door :: struct {
    using entity : ^ Entity;

    openness_current : float = 0;
    openness_target : float = 0;
  }


  MAX_ENTITIES :: 100;
  num_entities : int = 0;

  entities : [MAX_ENTITIES] Entity;

  get_next_entity :: (entities : [] Entity, num_entities : ^ int) -> ^ Entity {
    result := ^entities[*num_entities];
    *num_entities += 1;
    return result;
  }

  door : Door;
  door.entity = get_next_entity(entities, ^num_entities);

  print_position :: (using entity : ^Entity) {
    printf("soa_entity_test: (%f, %f, %f)\n", position.x, position.y, position.z);
  }

  print_position(^door);
}
