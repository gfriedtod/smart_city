package com.yans.smart_api.core.dto;

import com.yans.smart_api.core.IncidentStatus;
import lombok.Builder;
import lombok.Data;
import lombok.Value;

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * DTO for {@link com.yans.smart_api.entity.Incident}
 */
@Value
@Builder
@Data
public class IncidentDto implements Serializable {
    UUID id;
    String name;
    String description;
    String image;
    Double longitude;
    Double latitude;
    OffsetDateTime createdAt;
    OffsetDateTime updatedAt;
    UserDto user;
    CategoryDto category;
    IncidentStatus status;
}