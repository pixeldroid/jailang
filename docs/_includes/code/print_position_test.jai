// from: https://youtu.be/ZHqFrNyLlpA?t=1472

Vector3 :: struct {
  x : float = 1;
  y : float = 4;
  z : float = 9;
}

print_position_test :: () {

  Entity :: struct {
    position : Vector3;
  }

  print_position_a :: (entity : ^Entity) {
    printf("print_position_a: (%f, %f, %f)\n", entity.position.x, entity.position.y, entity.position.z);
  }

  print_position_b :: (entity : ^Entity) {
    using entity;
    printf("print_position_b: (%f, %f, %f)\n", position.x, position.y, position.z);
  }

  print_position_c :: (using entity : ^Entity) {
    printf("print_position_c: (%f, %f, %f)\n", position.x, position.y, position.z);
  }

  print_position_d :: (entity : ^Entity) {
    using entity.position;
    printf("print_position_d: (%f, %f, %f)\n", x, y, z);
  }

  e : Entity;

  print_position_a(^e);
  print_position_b(^e);
  print_position_c(^e);
  print_position_d(^e);
}