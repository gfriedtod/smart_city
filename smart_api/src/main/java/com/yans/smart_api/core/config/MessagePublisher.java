package com.yans.smart_api.core.config;


import org.springframework.amqp.core.AmqpAdmin;
import org.springframework.amqp.core.ExchangeBuilder;
import org.springframework.amqp.core.Queue;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

@Component
public class MessagePublisher {
    private static final String GENERAL_EXCHANGE = "general";
    private static final String ADMIN_QUEUE = "admin";
    private static final String EMPTY_ROUTING_KEY = "";

    private final RabbitTemplate rabbitTemplate;
    private final AmqpAdmin rabbitAdmin;

    @Autowired
    public MessagePublisher(RabbitTemplate rabbitTemplate, AmqpAdmin rabbitAdmin) {
        this.rabbitTemplate = rabbitTemplate;
        this.rabbitAdmin = rabbitAdmin;
    }

    /**
     * Initializes the messaging infrastructure by declaring a fanout exchange
     * and an admin queue.
     *
     * @return The name of the declared admin queue
     */
    @Bean
    String initializeMessagingInfrastructure() {
        rabbitAdmin.declareExchange(
            ExchangeBuilder.fanoutExchange(GENERAL_EXCHANGE).build()
        );
        return rabbitAdmin.declareQueue(new Queue(ADMIN_QUEUE));
    }

    /**
     * Sends a message to a specific routing key.
     *
     * @param message The message content to send
     * @param routingKey The routing key for message delivery
     * @throws IllegalArgumentException if message or routingKey is null
     */
    public void sendMessage(String message, String routingKey) {
        if (message == null || routingKey == null) {
            throw new IllegalArgumentException("Message and routing key cannot be null");
        }
        rabbitTemplate.convertAndSend(routingKey, message);
    }

    /**
     * Sends a message to the general exchange.
     *
     * @param message The message content to send
     * @throws IllegalArgumentException if message is null
     */
    public void sendMessage(String message) {
        if (message == null) {
            throw new IllegalArgumentException("Message cannot be null");
        }
        rabbitTemplate.convertAndSend(GENERAL_EXCHANGE, EMPTY_ROUTING_KEY, message);
    }
}