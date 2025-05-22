1. kafka-config.yml contains configuration required to boot up kafka container
2. Run command "docker compose up -d"  it will start container
       The -d flag stands for detached mode, which means:
             The containers run in the background.
             You get your terminal prompt back after they start.
3.  docker exec -it <kafka-container-name> bash  (command to access container)
4.  kafka-topics --bootstrap-server broker:29092 --list  (command to get list of topic created)
5.  kafka-topics --create \
  --bootstrap-server broker:29092 \
  --replication-factor 1 \
  --partitions 3 \
  --topic practice-topic    (helps us to create topic name practice-topic with 3 partition with 1 replication

    --bootstrap-server broker:29092: Connects to your Kafka broker (as per your Docker Compose setup).
6. kafka-topics --bootstrap-server broker:29092 --delete --topic <topic_name>  (command to delete topic)
7. kafka-topics --describe \
  --bootstrap-server broker:29092 \
  --topic practice-topic  (command to describe topic)


<img width="643" alt="image" src="https://github.com/user-attachments/assets/6c2e7c89-dde6-4580-900e-47aa845c97d4" />

8. send messages to topic with partitions using key-value pair
     kafka-console-producer \
    --bootstrap-server broker:29092 \
    --topic user-events \
    --property "parse.key=true" \
    --property "key.separator=:"

     user1:logged in
     user2:added item to cart
     user1:logged out

9. kafka-console-consumer \
  --bootstrap-server broker:29092 \
  --topic practice-topic \
  --partition 0 \
  --from-beginning (command to read messages from specific partition)


   Just FYI : data i produce , and how it stored it in partitions
   <img width="755" alt="image" src="https://github.com/user-attachments/assets/92d7246d-eec9-44cf-b6b3-dae422ce9f3c" />


10. Create consumer group "group-A" with 3 consumer and assign each consumer of group 1 partition of topic pratice-topic with 3 partitions
     kafka-console-consumer \
  --bootstrap-server broker:29092 \
  --topic practice-topic \
  --partition 0 \
  --group groupA \
  --from-beginning

kafka-console-consumer \
  --bootstrap-server broker:29092 \
  --topic practice-topic \
  --partition 1 \
  --group groupA \
  --from-beginning

kafka-console-consumer \
  --bootstrap-server broker:29092 \
  --topic practice-topic \
  --partition 2 \
  --group groupA \
  --from-beginning
