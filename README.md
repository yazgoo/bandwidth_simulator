HTTP-serves static files with a specified bandwidth.
This allow to test the static part of your web site simulating a bandwidth limited environment.

# Example usage

Let's say you have a directory, you wan't to test at 16384 bytes per second, just issue a:

    $ ruby bandwidth_simulator.rb /path/to/your/directory 16384
