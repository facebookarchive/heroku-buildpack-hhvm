# Linter tests

The linter used to validate `.hdf` files is quite simplistic, but ensures that
syntactically it's correct. However, there may be edge cases which haven't been
considered that the linter thinks are valid.

## What to do

Create a new file, `test_x.in` which repros the edge case. Create a new file
`test_x.out` which contains the output expected from the linter. 

That's it! Next time when you run the `test` script, the new test case will be
included. 

Of course, you need to do all this after having fixed the linter to consider
the new edge case discovered.


Note: The test script should always be ran from the `tests` directory,
otherwise the lint output might differ.
