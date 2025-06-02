package com.yans.smart_api.admin_management.application.in;

import com.yans.smart_api.admin_management.domain.dto.request.ChangeIncidentStatusRequest;
import com.yans.smart_api.core.IncidentStatus;

import java.util.UUID;

public interface AIncidentInput {
    void changeStatus(ChangeIncidentStatusRequest request);

}
