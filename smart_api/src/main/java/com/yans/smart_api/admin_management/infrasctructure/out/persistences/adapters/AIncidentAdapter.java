package com.yans.smart_api.admin_management.infrasctructure.out.persistences.adapters;

import com.yans.smart_api.admin_management.application.out.AIncidentOutputPort;
import com.yans.smart_api.admin_management.domain.dto.request.ChangeIncidentStatusRequest;
import com.yans.smart_api.admin_management.infrasctructure.out.persistences.repository.AIncidentRepository;
import org.springframework.stereotype.Component;


@Component
public class AIncidentAdapter implements AIncidentOutputPort {
    private  final AIncidentRepository incidentRepository;

    public AIncidentAdapter(AIncidentRepository incidentRepository) {
        this.incidentRepository = incidentRepository;
    }

    @Override
    public void updateIncident(ChangeIncidentStatusRequest request) {
        System.out.println(request.status());
        System.out.println(request.id());

        incidentRepository.changeIncidentStatus(request.status().name(), request.id());
    }
}
