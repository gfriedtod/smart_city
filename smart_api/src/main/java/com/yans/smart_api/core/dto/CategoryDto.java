package com.yans.smart_api.core.dto;

import lombok.Builder;
import lombok.Value;

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * DTO for {@link com.yans.smart_api.entity.Category}
 */
@Value
@Builder
public class CategoryDto implements Serializable {
    UUID id;
    String name;
    OffsetDateTime createdAt;
    OffsetDateTime updatedAt;
    Boolean isActive;
}