// from: https://youtu.be/ZHqFrNyLlpA?t=2330

Vector3 :: struct {
  x : float = 1;
  y : float = 4;
  z : float = 9;
}

door_test_pointer  :: () {

  Entity :: struct {
    position : Vector3;
  }

  Door :: struct {
    using entity : ^ Entity; // default value is null

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

  printf("door_test_packed: position is (%f, %f, %f)\n", door.position.x, door.position.y, door.position.z);
}