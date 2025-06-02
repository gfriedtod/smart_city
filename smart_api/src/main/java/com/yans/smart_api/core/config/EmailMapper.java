package com.yans.smart_api.core.config;

import com.yans.smart_api.entity.Email;
import org.springframework.stereotype.Component;

@Component
class EmailMapper {

    public Email mapToEntity(com.yans.smart_api.core.dto.EmailDto emailDto) {
        return new Email(emailDto.getAddress());
    }

    public com.yans.smart_api.core.dto.EmailDto mapToDto(Email email) {
        return com.yans.smart_api.core.dto.EmailDto.builder()
                .address(email.getAddress())
                .build();
    }
}
