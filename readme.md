<img src="https://github.com/southwinds-io/artisan/raw/main/artisan.png" width="100" align="right"/>

# Artisan Runtimes

Artisan runtimes are container images that can automatically run an entrypoint with an artisan command.

There are two types of runtimes as follows:

## Application Runtimes

Allow to run an application that has been packaged using artisan.

### Why using an application runtime?

To facilitate operating system patching in the container image.

Essentially, by decoupling the Operating System from the application that run in it, either the application or the OS
can be updated without changing the other one.

It also reduces the dependencies between the development teams and the operational teams at the time of patching, 
by simply updating one runtime, all applications running on it are immediately patched.

Development teams do not need to intervene in the patching process.

## Automation Runtimes

Allow to run an automation script using a particular tool chain without having to install the relevant tools.