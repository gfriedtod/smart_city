package com.yans.smart_api.core.dto;

import lombok.Builder;
import lombok.Data;
import lombok.Value;

import java.io.Serializable;

/**
 * DTO for {@link com.yans.smart_api.entity.Email}
 */
@Value
@Builder
@Data
public class EmailDto implements Serializable {
    String address;

}