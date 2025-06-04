package com.yans.smart_api.user_management.infrasctructure.persistences.adapters;

import com.yans.smart_api.core.dto.IncidentDto;
import com.yans.smart_api.entity.Incident;
import com.yans.smart_api.user_management.application.out.UIncidentOutput;
import com.yans.smart_api.core.config.IncidentMapper;
import com.yans.smart_api.user_management.infrasctructure.persistences.repository.UIncidentRepository;
import org.springframework.stereotype.Component;

import java.util.List;
import java.util.UUID;
import org.springframework.data.jpa.domain.Specification;


/**
 * Adapter class that provides an implementation of the {@link UIncidentOutput} interface.
 * It acts as a bridge between the application layer and the persistence layer, allowing
 * operations related to incidents such as retrieval, creation, and filtering by user ID.
 * This class makes use of the {@link UIncidentRepository} to interact with the database
 * and the {@link IncidentMapper} for transforming entities to DTOs and vice versa.
 */
@Component
class UIncidentAdapter implements UIncidentOutput {
    
    private final UIncidentRepository incidentRepository;
    private final IncidentMapper incidentMapper;

    UIncidentAdapter(UIncidentRepository incidentRepository, IncidentMapper incidentMapper) {
        this.incidentRepository = incidentRepository;
        this.incidentMapper = incidentMapper;
    }

    /**
     * Retrieves a list of all incidents from the repository and maps them to their
     * corresponding Data Transfer Objects (IncidentDto).
     *
     * @return a list of IncidentDto objects representing all incidents stored in the system
     */
    @Override
    public List<IncidentDto> getIncidents() {
        return incidentRepository.findAll()
                .stream()
                .map(incidentMapper::toDto)
                .toList();
    }

    /**
     * Retrieves a list of incidents associated with a specific user ID.
     *
     * @param id the UUID of the user whose incidents are to be retrieved
     * @return a list of IncidentDto objects representing incidents related to the specified user
     */
    @Override
    public List<IncidentDto> getIncidentByUserId(UUID id) {
        return incidentRepository.findAll(hasUserId(id))
                .stream()
                .map(incidentMapper::toDto)
                .toList();
    }

    /**
     * Creates a new incident in the system by saving it to the repository and returns the created incident
     * as a Data Transfer Object (IncidentDto).
     *
     * @param incident the IncidentDto representing the incident to be created; contains the
     *                 necessary details such as name, description, location, associated user, category,
     *                 and status
     * @return the IncidentDto representation of the newly created incident, including its unique identifier
     *         and other details saved in the repository
     */
    @Override
    public IncidentDto createIncident(IncidentDto incident) {
        System.out.println(incident.getStatus());
        return incidentMapper.toDto(incidentRepository.save(incidentMapper.toEntity(incident)));
    }

    /**
     * Creates a specification to filter incidents based on the user ID associated with them.
     *
     * @param userId the UUID of the user whose incidents are to be matched
     * @return a Specification object to be used for querying incidents by user ID
     */
    private static Specification<Incident> hasUserId(UUID userId) {
        return (root, query, cb) -> cb.equal(root.get("user").get("id"), userId);
    }
}