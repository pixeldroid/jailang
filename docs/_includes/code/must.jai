/** from: https://youtu.be/CttIYXCUeVY?t=3515 */

must :: () {
  Vector3 :: struct {
    x, y, z: float;
  }
  Vector2 :: struct {
    x, y: float;
  }

  producer :: (count: int) -> ^ Vector3 #must, ^ Vector2 #must, bool {
    is_even := (count % 2) == 0;

    return new [count] Vector3, new [count*2] Vector2, is_even;
  }

  r1 : ^Vector3;
  r2 : ^Vector2;
  r3 : bool;

  r1, r2, r3 = producer(5); // this is valid
  r1, r2 = producer(7);     // this is valid
  r1 = producer(9);         // this generates compiler error: "disallowed by #must"
  producer(9);              // this generates compiler error: "disallowed by #must"
}
