// from: https://youtu.be/7Fsy2WaxLOY?t=1276

get_field :: (info: ^Type_Info_Struct, name: string) -> ^Type_Info_Struct_Member {
  for ^ info.members if it.name == name return it;
  return null;
}

satisfies_struct_interface :: (info: ^Type_Info_Struct, target: ^Type_Info_Struct) -> bool {
  for target.members {
    field := get_field(info, cast(it.name, string)); // dumb cast
    if !field return false;

    if field.type != it.type return false;
  }

  return true;
}

satisfies_interface :: (info: ^Type_Info, target: ^Type_Info) -> bool {
  if info.type != Type_Info_Tag.STRUCT return false;
  if target.type != Type_Info_Tag.STRUCT return false;

  return satisfies_struct_interface(cast(info, ^Type_Info_Struct), cast(target, ^Type_Info_Struct));
}


Ints :: struct { x, y: int; }
Vector2 :: struct { x, y: float; }
Vector4 :: struct { x, y, z, w: float; }

printf("Does Ints satisfy Vector2? : %d\n", satisfies_interface(type_info(Ints), type_info(Vector2))); // 0 (false)
printf("Does Vector4 satisfy Vector2? : %d\n", satisfies_interface(type_info(Vector4), type_info(Vector2))); // 1 (true)
printf("Does Vector2 satisfy Vector4? : %d\n", satisfies_interface(type_info(Vector2), type_info(Vector4))); // 0 (false)
