docker-concrete5.7
================

A Docker config for a container running Concrete5.7 

To use this config, first build a container:
 
     docker build .

Then run the container, passing in these environment variables so that
the run script knows how to connect to your MySQL database instance to 
create the database - this is optional if you have already created your DB

     docker run --name c57 -e DB_USER=root -e DB_PASS=password -e DB_HOST=172.17.0.23 -e DB_NAME=c57 CONTAINER_ID

Next, figure out your C5 container's IP:

    docker inspect CONTAINER_ID
    
Then, connect to that IP in a browser, and you shoud see the Concrete5
Install screen.   
