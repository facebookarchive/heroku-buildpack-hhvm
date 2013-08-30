# What is it?

The linter runs as part of the `compile` process of the buildpack. You can
think of it as a pre-commit hook - if the linter can't validate the `.hdf`
config file you're trying to submit it will stop deployment. If you think your
config file is valid and the linter is wrong, you can either
[create a task](https://github.com/facebook/hiphop-php/), either send a pull
request that fixes it :) 

If you're opting for sending a pull request, make sure you take a quick look at
the `tests` folder and add the case you encoutered to a new test. 


Note: The test script should always be ran from the `tests` directory,
otherwise the lint output might differ.
