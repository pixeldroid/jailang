/** from: https://youtu.be/JoNkttD_MUs?t=399 */

print_all_types :: () {
  printf("The type table has %d entries:\n", _type_table.count);
  for _type_table {
    printf("%3d: ", it_index);
    print_type(it, true);
    printf("\n");
  }
}

print_type :: (info : ^Type_Info, is_toplevel : bool) {
  if !info then {
    printf("Input type must not be null.\n");
    return;
  }

  using Type_Info_Tag.members;

  if info.type == INTEGER {
    info_integer := cast(info, ^Type_Info_Integer);
    if info_integer.signed then {
      printf("s%d", info_integer.size_in_bits);
    } else {
      printf("u%d", info_integer.size_in_bits);
    }
    return;
  }

  if info.type == FLOAT {
    info_float := cast(info, ^Type_Info_Float);
    printf("float%d", info_float.size_in_bits);
    return;
  }

  if info.type == BOOL {
    printf("bool");
    return;
  }

  if info.type == STRING {
    printf("string");
    return;
  }

  if info.type == POINTER {
    info_pointer := cast(info, ^Type_Info_Pointer);
    printf("^");
    print_type(info_pointer.pointer_to, false);
    return;
  }

  if info.type == PROCEDURE {
    info_procedure := cast(info, ^Type_Info_Procedure);
    printf("(");
    for info_procedure.argument_types {
      print_type(it, false);
      if it_index != info_procedure.argument_types.count-1 then printf(", ");
    }
    printf(") -> ");
    print_type(info_procedure.pointer_to, false);
    return;
  }

  if info.type == VOID {
    printf("void");
    return;
  }

  if info.type == STRUCT {
    info_struct := cast(info, ^Type_Info_Struct);
    if info_struct.name && !is_toplevel then {
      printf("%s", info_struct.name);
    } else {
      if info_struct.name then printf("%s :: ", info_struct.name);
      printf("struct { ");
      for info_struct.members {
        printf("%s: ", it.name);
        print_type(it.type, false);
        printf(" offset %d", it.offset_in_bytes);
        printf("; ");
      }
    }
    return;
  }

  if info.type == ARRAY {
    info_array := cast(info, ^Type_Info_Array);
    if info_array.array_type == Type_Info_Array.DYNAMIC {
      printf("[..] ");
    } else if info_array.array_type == Type_Info_Array.FIXED {
      printf("[%d] ", info_array.array_count);
    } else {
      printf("[] ");
    }
    if info_array.soa_packing != -1 then printf("SOA ");
    print_type(info_array.element_type, false);
    return;
  }

  if info.type == NULL {
    printf("null");
    return;
  }

  if info.type == ANY {
    printf("Any");
    return;
  }

  if info.type == ENUM {
    info_enum := cast(info, ^Type_Info_Enum);
    printf("enum");  // incomplete
    return;
  }

  printf("??? (%d)", info.type);
}
