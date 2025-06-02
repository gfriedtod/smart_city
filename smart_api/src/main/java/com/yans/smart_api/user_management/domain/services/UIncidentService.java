package com.yans.smart_api.user_management.domain.services;

import com.yans.smart_api.core.dto.IncidentDto;
import com.yans.smart_api.user_management.application.in.UIncidentInput;
import com.yans.smart_api.user_management.application.out.UIncidentOutput;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.UUID;

/**
 * Service class for managing user-related incidents.
 *
 * UIncidentService serves as a bridge between the application layer and the
 * persistence or external service layer for fetching and processing incidents
 * related to users. This service implements the UIncidentOutput interface to
 * ensure consistency in the contract for fetching incident data.
 *
 * Dependencies:
 * - An instance of {@link UIncidentOutput}, which provides the actual
 *   implementation for retrieving incident data.
 *
 * Methods:
 * - Implements getIncidents() from UIncidentOutput to retrieve a list of all incidents.
 * - Implements getIncidentByUserId(UUID id) from UIncidentOutput to retrieve
 *   a list of incidents associated with a specific user ID.
 */
@Service
class UIncidentService implements UIncidentInput {
    private final UIncidentOutput uIncidentOutput;

    public UIncidentService(UIncidentOutput uIncidentOutput) {
        this.uIncidentOutput = uIncidentOutput;
    }


    /**
     * Retrieves a list of all incidents.
     * This method delegates the retrieval of incident data to the implementation
     * of the {@link UIncidentOutput} interface. It returns a list of {@link IncidentDto}
     * objects representing the details of each incident.
     *
     * @return a list of {@link IncidentDto} objects containing incident details.
     */
    @Override
    public List<IncidentDto> getIncidents() {
        return  uIncidentOutput.getIncidents();
    }

    /**
     * Retrieves a list of incidents associated with a specific user ID.
     *
     * @param id the UUID of the user whose incidents are to be fetched
     * @return a list of {@link IncidentDto} representing the incidents related to the given user ID
     */
    @Override
    public List<IncidentDto> getIncidentByUserId(UUID id) {
        return uIncidentOutput.getIncidentByUserId(id);
    }

    /**
     * Creates a new incident based on the provided incident details.
     *
     * This method delegates the creation of a new incident to the implementation
     * of the {@link UIncidentOutput} interface. It returns the created incident
     * as an {@link IncidentDto}.
     *
     * @param incident the {@link IncidentDto} object containing the details of the incident to be created
     * @return the newly created {@link IncidentDto} object
     */
    @Override
    public IncidentDto createIncident(IncidentDto incident) {
        return uIncidentOutput.createIncident(incident);
    }
}
