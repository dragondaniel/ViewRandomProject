# Read me for building the Dockerfile

# Run the following to check if the steam image is already built:

$ sudo docker image ls

# If it is built then no need to build the image again.
# In case you need to build the image again under a different name:
# Run the following in the current directory

$ sudo docker build -t steam .

#-t = gives a tag to the image

