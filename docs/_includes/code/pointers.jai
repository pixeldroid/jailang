// from: https://youtu.be/-UPFH0eWHEI?t=769

N :: 10;

Entity :: struct {
   serial_number : int;
}

value : Entity;     // type declared as Entity
values : [N] float; // type declared as N-long array of floats

pointer : ^Entity; // type declared as address of an Entity
pointer = ^value;  // assignment as address of Entity named 'value'
pointers : [N] ^Entity // type declared as N-long array of addresses of Entities

pointer := ^value; // get a pointer to a value's memory address
value := *pointer; // get a value by dereferencing a pointer
