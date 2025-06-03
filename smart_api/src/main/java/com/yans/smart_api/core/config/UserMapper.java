package com.yans.smart_api.core.config;

import com.yans.smart_api.core.dto.UserDto;
import com.yans.smart_api.entity.AppUser;
import com.yans.smart_api.entity.Email;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Component;

@Component
@RequiredArgsConstructor
public class UserMapper {

    private final EmailMapper emailMapper;

    public UserDto toDto(AppUser appUser) {
        if (appUser == null) {
            return null;
        }

        return UserDto.builder()
                .id(appUser.getId())
                .username(appUser.getUsername())
                .email(appUser.getEmail().getAddress())
                .password(appUser.getPassword())
                .profile(appUser.getProfile())
                .createdAt(appUser.getCreatedAt())
                .updatedAt(appUser.getUpdatedAt())
                .isActive(appUser.getIsActive())
                .build();
    }

    public AppUser toEntity(UserDto userDto) {
        if (userDto == null) {
            return null;
        }

        return AppUser.builder()
                .id(userDto.getId())
                .username(userDto.getUsername())
                .email(new Email(userDto.getEmail()))
                .password(userDto.getPassword())
                .profile(userDto.getProfile())
                .createdAt(userDto.getCreatedAt())
                .updatedAt(userDto.getUpdatedAt())
                .isActive(userDto.getIsActive())
                .build();
    }
}