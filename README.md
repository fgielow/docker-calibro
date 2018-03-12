# DOCKER-CALIBRO

This repository hosts the Dockerfile that describes the image for using calibro.

Calibro can be originally found here: http://www.esru.strath.ac.uk/Programs/Calibro.htm - and this repository is not maintained by the same personnel.
    
# Running Calibro

For ease of access, a Makefile was included. To enter the environment you can simply run:

    make
    
If you want to quickly run the SIMPLEST simulation, you can execute:

    make simplest
    
There is also a tagging mechanism that copies to easily operate with different sets of CSV files. You can copy all the files from examples/simplest/<TAG> to the root examples/simplest/ - so it is considered by the simplest simulation - by simply using:

    make TAG=v1 simplest
    
Note that the command above replaces all the .csv files from the root examples/simplest with the .csv files from examples/simplest/<TAG>, so if you operate with this fashion it is advisable to always work on "tagged" sets of csvs. You can obviously add new folders with different .csv sets to the examples/simplest folder.

# Building image

If needed, you can easily build the image by executing:

    make build
    
Note that the image is already hosted on Docker Hub so there's no need for you to compile the image. You can simply run the commands from the previous section and the proper image will be automatically Downloaded.

# Running on Windows

You need to install the make.exe tool for Windows, which can be obtained from here: http://gnuwin32.sourceforge.net/packages/make.htm -- note that you need to include the make.exe binary to the Windows Path so it can be found.

You can alternatively simply use the commands from within the Makefile without using the make command at all.


