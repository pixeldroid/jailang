// from: https://youtu.be/ZHqFrNyLlpA?t=2182

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

  door : Door;
  door.entity = new Entity; // must set pointer before dereferencing!

  printf("door_test_pointer : door.position is (%f, %f, %f)\n", door.position.x, door.position.y, door.position.z);

  print_position :: (using entity : ^ Entity) {
    printf("door_test_pointer : position is (%f, %f, %f)\n", position.x, position.y, position.z);
  }

  print_position(^door);
}
