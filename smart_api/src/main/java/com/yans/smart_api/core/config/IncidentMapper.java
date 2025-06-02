package com.yans.smart_api.core.config;

import org.springframework.stereotype.Component;
import lombok.RequiredArgsConstructor;
import com.yans.smart_api.core.dto.IncidentDto;
import com.yans.smart_api.entity.Incident;

@Component
@RequiredArgsConstructor
public class IncidentMapper {

    private final UserMapper userMapper;
    private final CategoryMapper categoryMapper;

    public IncidentDto toDto(Incident incident) {
        if (incident == null) {
            return null;
        }

        return IncidentDto.builder()
                .id(incident.getId())
                .name(incident.getName())
                .description(incident.getDescription())
                .image(incident.getImage())
                .longitude(incident.getLongitude())
                .latitude(incident.getLatitude())
                .createdAt(incident.getCreatedAt())
                .updatedAt(incident.getUpdatedAt())
                .user(userMapper.toDto(incident.getAppUser()))
                .category(categoryMapper.toDto(incident.getCategory()))
                .status(incident.getStatus())
                .build();
    }

    public Incident toEntity(IncidentDto incidentDto) {
        if (incidentDto == null) {
            return null;
        }

        Incident incident = new Incident();
        incident.setName(incidentDto.getName());
        incident.setDescription(incidentDto.getDescription());
        incident.setImage(incidentDto.getImage());
        incident.setLongitude(incidentDto.getLongitude());
        incident.setLatitude(incidentDto.getLatitude());
        incident.setAppUser(userMapper.toEntity(incidentDto.getUser()));
        incident.setCategory(categoryMapper.toEntity(incidentDto.getCategory()));
        incident.setStatus(incidentDto.getStatus());
        return incident;
    }
}