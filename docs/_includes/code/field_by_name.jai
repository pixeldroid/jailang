/** from: https://youtu.be/JoNkttD_MUs?t=2349 */

field_by_name :: () {

  Vector3 :: struct {
    x, y, z: float;
  }

  get_field :: (any : Any, name : string) -> ^u8 {
    if any.type.type != Type_Info_Tag.STRUCT {
      printf("Error: argument is not a struct.\n");
      return;
    }

    info_struct := cast(any.type, ^Type_Info_Struct);

    for info_struct.members {
      if strings_match(it.name, cast(name, ^u8)) {
        base := cast(any.value_pointer, ^u8);
        return base + it.offset_in_bytes;
      }
    }

    printf("field '%s' not found.\n", name);
    return null;
  }

  printf("\n");

  vec : Vector3;
  vec.x = 1;
  vec.y = 4;
  vec.z = 9;

  coordinate_name := "y";

  pointer_to_y := get_field(vec, coordinate_name);

  printf("The '%s' coordinate is %f\n", coordinate_name, *cast(pointer_to_y, ^float));
}
