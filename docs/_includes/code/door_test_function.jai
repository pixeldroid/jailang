// from: https://www.youtube.com/watch?v=ZHqFrNyLlpA&t=4175

MAX_ENTITIES :: 100;
Entity :: struct {
  position : Vector3;
}

entities : [MAX_ENTITIES] Entity;

door_test_function :: () {
  Door :: struct {
    using entity_proc :: (door : ^Door) -> ^Entity {
      return ^entities[door.entity_index];
    }

    entity_index : u16;

    openness_current : float;
    openness_target : float;
  }

  num_entities : int = 0;

  get_next_entity :: (num_entities : ^int) -> u16 {
    result := cast(*num_entities, u16);
    *num_entities += 1;
    return result;
  }

  door : Door;
  door.entity_index = get_next_entity(^num_entities);

  printf("door_test_function: door.position is (%f, %f, %f)\n", door.position.x, door.position.y, door.position.z);
}