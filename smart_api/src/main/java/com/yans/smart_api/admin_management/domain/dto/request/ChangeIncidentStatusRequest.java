package com.yans.smart_api.admin_management.domain.dto.request;

import com.yans.smart_api.core.IncidentStatus;
import lombok.Builder;

import java.util.UUID;

/**
 * A record representing a request to change the status of an incident.
 *
 * This record encapsulates the necessary data required to update the status of an incident.
 * It serves as a Data Transfer Object (DTO) to facilitate communication between different
 * layers of the application, particularly in the context of managing and modifying
 * incident statuses.
 *
 * Fields:
 * - `status`: Represents the new status of the incident. It is of type {@link IncidentStatus}
 *   which defines the various status values an incident can have (e.g., SUBMIT, IN_PROGRESS, RESOLVED).
 * - `id`: Represents the unique identifier (UUID) of the incident whose status needs to be changed.
 *
 * This request is used in methods such as:
 * - `changeStatus` in the {@link AIncidentInput} interface to handle incident status updates.
 * - `updateIncident` in the {@link AIncidentOutputPort} interface to persist the status change.
 */
@Builder
public record ChangeIncidentStatusRequest(
        IncidentStatus status , UUID id
) {
}
