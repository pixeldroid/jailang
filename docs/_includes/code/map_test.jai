// from: https://youtu.be/7Fsy2WaxLOY?t=3540

map_test :: () {

  /*

  An experiment in programming in a more Lisp-y style.

  */

  N :: 5;

  a: [N] int;
  for 0..N-1 a[it] = it+1;

  for a printf("a[%d] = %d\n", it_index, it);

  // map: apply f to each element of array, returning the resulting array.

  map :: (array: [] $T, f: (T) -> $R) -> [] R {

    result: [] R;
    result.data = malloc(array.count * size_of(R));
    result.count = array.count;

    for array result[it_index] = f(it);

    return result;

  }

  square :: (n: int) -> int { return n*n; }

  b := map(a, square);
  for b printf("b[%d] = %d\n", it_index, it);

  free(b.data);

}
