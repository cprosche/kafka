topic := cadescooltopic

run:
	docker compose up -d

create-topic: 
	docker exec broker \
		kafka-topics \
		--bootstrap-server broker:9092 \
		--create --topic $(topic)

producer: 
	docker exec -it broker \
		kafka-console-producer \
		--bootstrap-server broker:9092 \
		--topic $(topic)

consumer:
	docker exec -it broker \
		kafka-console-consumer \
		--bootstrap-server broker:9092 \
		--topic $(topic) --from-beginning