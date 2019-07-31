// from: https://youtu.be/7Fsy2WaxLOY?t=3110

Spacing_Mode :: enum {
  NONE,
  INDENT,
  EXDENT
}

using Spacing_Mode.members;

print_names_and_values :: (names: [] string, values: [] int, $$ mode: Spacing_Mode.strict, use_dots: bool) {
  if mode == EXDENT printf("       ");
  printf("print_names_and_values says:\n");

  for 0..names.count-1 {
    if mode == INDENT printf("    ");

    printf("%8s:", names[it]);

    if use_dots printf("......");
    else printf("      ")

    printf("%d\n", values[it]);
  }
}

N :: 5;

names  : [N] string;
values : [N] int;

names[0] = "Cow";
names[1] = "Horse";
names[2] = "Pig";
names[3] = "Mule";
names[4] = "Llama";

values[0] = 1;
values[1] = 4;
values[2] = 6;
values[3] = 4;
values[4] = 1;

print_names_and_values(names, values, NONE, false);
print_names_and_values(names, values, INDENT, true);
