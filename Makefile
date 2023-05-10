run:
	docker compose up -d

create-topic: 
	docker exec broker \
		kafka-topics \
		--bootstrap-server broker:9092 \
		--create --topic cadescooltopic

producer: 
	docker exec --interactive --tty broker \
		kafka-console-producer \
		--bootstrap-server broker:9092 \
		--topic cadescooltopic

consumer:
	docker exec --interactive --tty broker \
		kafka-console-consumer \
		--bootstrap-server broker:9092 \
		--topic cadescooltopic --from-beginning