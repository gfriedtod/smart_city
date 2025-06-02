package com.yans.smart_api.core.dto;

import com.yans.smart_api.core.UserProfile;
import com.yans.smart_api.entity.AppUser;
import lombok.Builder;
import lombok.Data;

import java.io.Serializable;
import java.time.OffsetDateTime;
import java.util.UUID;

/**
 * DTO for {@link AppUser}
 */
@Builder
@Data
public class UserDto implements Serializable {
    UUID id;
    String username;
    String password;
    OffsetDateTime updatedAt;
    OffsetDateTime createdAt;
    Boolean isActive;
    EmailDto email;
    UserProfile profile;
}