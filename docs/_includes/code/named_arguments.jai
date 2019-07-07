hello :: (name: string, phrase: string) {
  printf("My name is %s.  %s\n", name, phrase);
};
hello("fred", "booya"); // fine.
hello("booya", "fred"); // oops. but compiler can't help us.
hello(phrase = "booya", name = "fred"); // fine again.
hello("fred", phrase = "booya"); // also fine.
hello(name = "fred", "booya"); // error: unnamed arguments can't follow named ones.
