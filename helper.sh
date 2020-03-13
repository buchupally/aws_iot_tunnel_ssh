#!/bin/bash

# turn on bash's job control
set -m

# Start the localproxy and put it in the background
localproxy -r $AWS_REGION -s 5555 -t $SOURCE_ACCESS_TOKEN &

# Sleep for localproxy to startup
sleep 5

# Start ssh
if [ -z "$SSH_PRIVATE_KEY_FILE" ]
then
     ssh $REMOTE_USER@localhost -p 5555
else
     ssh -i $SSH_PRIVATE_KEY_FILE $REMOTE_USER@localhost -p 5555
fi
