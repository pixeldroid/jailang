// from: https://youtu.be/7Fsy2WaxLOY?t=2456

concat :: (s: string, t: string) -> string {
  return case(mprintf("%s%s", s, t), string);
}

length :: (using v: $T) -> float

#body_text (T: ^Type_Info) -> string {

  if T.type != Type_Info_Tag.STRUCT {
    printf("Error: 'length' wants a Vector type, but you gave it something that wasn't a struct!\n");
    return null;
  }

  // this leaks; in real code, you would use a string builder here.

  squares := "x*x";
  if has_field(T, "y") squares = concat(squares, " + y*y");
  if has_field(T, "z") squares = concat(squares, " + z*z");
  if has_field(T, "w") squares = concat(squares, " + w*w");

  s := mprintf("return sqrtf(%s);", squares);

  printf("** Returning generated body text: %s\n", s);

  return cast(s, string); // dumb cast!
}

Vector2 :: struct {
  x : float = 1;
  y : float = 4;
}

Vector3 :: struct {
  x : float = 1;
  y : float = 4;
  z : float = 9;
}

Vector4 :: struct {
  x : float = 1;
  y : float = 4;
  z : float = 9;
  w : float = 16;
}

v2: Vector2;
v3: Vector3;
v4: Vector4;

printf("Length of v2 is: %f\n", length(v2));
printf("Length of v3 is: %f\n", length(v3));
printf("Length of v4 is: %f\n", length(v4));
