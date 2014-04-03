#!/bin/bash

ID=${HOSTNAME#db-}

function wait_for_mongo() {
  ret=`mongo --eval 'printjson(db.serverStatus())'`

  if [ $? -eq 0 ]; then
    [[ "$ret" =~ "\"ok\" : 1" ]] || return 0
  fi

  echo "Cannot connect to Mongo, retrying in 2 seconds..."
  sleep 2
  wait_for_mongo
}

function intialize_replica_set() {
  ret=`mongo 192.168.1.1/27017 --eval 'printjson(rs.initiate({ "_id" : "replSet", "version" : 1, "members" : [ { "_id" : 0, "host" : "192.168.1.1:27017" } ] }))'`

  if [ $? -eq 0 ]; then
    [[ "$ret" =~ "\"ok\" : 1" ]] || return 0
  fi

  return 1
}

function add_member_to_replica_set() {
  ret=`mongo 192.168.1.1/27017 --eval "printjson(rs.add(\"192.168.1.$ID:27017\"))"`

  if [ $? -eq 0 ]; then
    [[ "$ret" =~ "\"ok\" : 1" ]] || return 0
  fi

  return 1
}

function init_or_add_to_replica_set() {
  wait_for_mongo

  if [ "$ID" == "1"  ]; then
    # This is the first node, initialize the replica
    intialize_replica_set

    if [ $? -ne 0 ]; then
      echo "Cannot initialize replica set, retrying in 2 seconds..."
      sleep 2
      intialize_replica_set
    fi
  else
    # This is just another node, add it to the replica
    add_member_to_replica_set

    if [ $? -ne 0 ]; then
      echo "Cannot add member to replica set, retrying in 2 seconds..."
      sleep 2
      add_member_to_replica_set
    fi
  fi 
}

init_or_add_to_replica_set &

exec /usr/bin/mongod -f /etc/mongod.conf

