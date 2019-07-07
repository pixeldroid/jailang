fun :: (x: int) -> first: string = "Hello", second: string = "Sailor!" {
    if x == 0 return;
    if x == 1 return "Simple";
    if x == 2 return "Simple", "Simon";
    if x == 3 return second = "Simple", first = "Simon";

    return second = "Dolly"
}

a, b: string;

a, b = fun(0); // Hello Sailor!
a, b = fun(1); // Simple Sailor!
a, b = fun(2); // Simple Simon
a, b = fun(3); // Simon Simple
a, b = fun(4); // Hello Dolly
