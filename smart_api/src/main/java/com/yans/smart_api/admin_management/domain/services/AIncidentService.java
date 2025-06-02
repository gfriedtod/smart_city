package com.yans.smart_api.admin_management.domain.services;

import com.yans.smart_api.admin_management.application.in.AIncidentInput;
import com.yans.smart_api.admin_management.application.out.AIncidentOutputPort;
import com.yans.smart_api.admin_management.domain.dto.request.ChangeIncidentStatusRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Service class responsible for handling incident management operations.
 * This class provides functionality to modify the status of incidents.
 * It acts as an intermediary between the input interface and the output port.
 */
@Service
public  class AIncidentService implements AIncidentInput {
    private final AIncidentOutputPort aPort;
    @Autowired
    public AIncidentService(AIncidentOutputPort aPort) {
        this.aPort = aPort;
    }

    @Override
    public void changeStatus(ChangeIncidentStatusRequest request) {
        this.aPort.updateIncident(request);
    }
}
