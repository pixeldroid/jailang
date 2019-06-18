// from: https://youtu.be/ZHqFrNyLlpA?t=1835

Vector3 :: struct {
  x : float = 1;
  y : float = 4;
  z : float = 9;
}

door_test :: () {

  Entity :: struct {
    position : Vector3;
  }

  Door :: struct {
    using entity : Entity;

    openness_current : float = 0;
    openness_target : float = 0;
  }

  door : Door;

  // since the struct has access to the entity namespace, we don't need to say: door.entity.position, just door.position
  printf("door_test: door.position is (%f, %f, %f)\n", door.position.x, door.position.y, door.position.z);

  // but, since entity is named, we can take a pointer to it if we want
  e : ^Entity = ^door.entity;
  printf("e.position.x is %f\n", e.position.x);
}
