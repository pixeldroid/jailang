foo :: () -> int, int {
    return 3, 5;
}

x : int;
y : int;

x, y = foo();
printf("x is %d; y is %d.\n", x, y);
