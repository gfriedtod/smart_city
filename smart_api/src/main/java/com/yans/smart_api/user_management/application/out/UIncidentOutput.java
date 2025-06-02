package com.yans.smart_api.user_management.application.out;


import com.yans.smart_api.core.dto.IncidentDto;

import java.util.List;
import java.util.UUID;

public interface UIncidentOutput {

    List<IncidentDto> getIncidents();
    List<IncidentDto> getIncidentByUserId(UUID id);
    IncidentDto createIncident(IncidentDto incident);

}
