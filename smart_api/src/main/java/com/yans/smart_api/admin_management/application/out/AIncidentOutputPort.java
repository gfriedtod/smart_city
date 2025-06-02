package com.yans.smart_api.admin_management.application.out;

import com.yans.smart_api.admin_management.domain.dto.request.ChangeIncidentStatusRequest;

public interface AIncidentOutputPort {
    void updateIncident(ChangeIncidentStatusRequest request);
}
