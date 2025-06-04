package com.yans.smart_api.admin_management.infrasctructure.out.persistences.adapters;

import com.yans.smart_api.admin_management.application.out.AIncidentOutputPort;
import com.yans.smart_api.admin_management.domain.dto.request.ChangeIncidentStatusRequest;
import com.yans.smart_api.admin_management.infrasctructure.out.persistences.repository.AIncidentRepository;
import com.yans.smart_api.core.config.MessagePublisher;
import org.springframework.stereotype.Component;


@Component
public class AIncidentAdapter implements AIncidentOutputPort {
    private  final AIncidentRepository incidentRepository;
    private static final String NOTIFICATION_PREFIX = "notification-" ;
    private static final String ORDER_PREFIX = "order-" ;
    private static final String NOTIFICATION_ALL_PREFIX = "notification-all" ;
    private final MessagePublisher messagePublisher;
    public AIncidentAdapter(AIncidentRepository incidentRepository, MessagePublisher messagePublisher) {
        this.incidentRepository = incidentRepository;
        this.messagePublisher = messagePublisher;
    }

    @Override
    public void updateIncident(ChangeIncidentStatusRequest request) {
        System.out.println(request.status());
        System.out.println(request.id());

        incidentRepository.changeIncidentStatus(request.status().name(), request.id());
        var incident = incidentRepository.findById(request.id());
        System.out.println(NOTIFICATION_PREFIX + incident.get().getAppUser().getEmail().getAddress().toString());
        incident.ifPresent(value -> messagePublisher.sendMessage(" your incident has been updated", NOTIFICATION_PREFIX + value.getAppUser().getEmail().getAddress().toString()));

    }
}
