// from: https://youtu.be/ZHqFrNyLlpA?t=1835

print_floats_in_memory :: () {

  Vector3 :: struct {
    x : float = 1;
    y : float = 4;
    z : float = 9;
  }

  print_floats_in_memory :: (data : ^ float, count : int) {
    for 0..count-1 {
      s := " ";
      if it > 9 then s = "";
      printf("  %s[%d] = %f\n", s, it, data[it]);
    }
  }

  N :: 3;

  a : [N] Vector3;
  b : [N] SOA Vector3;

  printf("\n");

  printf("Layout of a:\n");
  print_floats_in_memory(cast(a.data, ^float), N*3);
  printf("\n");

  printf("Layout of b:\n");
  print_floats_in_memory(cast(b.data, ^float), N*3);
  printf("\n");
}

/* results:

Layout of a:
   [0] = 1.000000
   [1] = 4.000000
   [2] = 9.000000
   [3] = 1.000000
   [4] = 4.000000
   [5] = 9.000000
   [6] = 1.000000
   [7] = 4.000000
   [8] = 9.000000

Layout of b:
   [0] = 1.000000
   [1] = 1.000000
   [2] = 1.000000
   [3] = 4.000000
   [4] = 4.000000
   [5] = 4.000000
   [6] = 9.000000
   [7] = 9.000000
   [8] = 9.000000
*/
