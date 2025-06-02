package com.yans.smart_api.user_management.infrasctructure.in;

import com.yans.smart_api.core.dto.IncidentDto;
import com.yans.smart_api.user_management.application.in.UIncidentInput;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Pageable;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.UUID;

@RestController
@RequestMapping("user/incidents")
@CrossOrigin("*")
class UIncidentController {

    private final UIncidentInput incidentService;

    @Autowired
    public UIncidentController(UIncidentInput incidentService) {
        this.incidentService = incidentService;
    }

    @GetMapping
    public ResponseEntity<?> getAllIncidents() {
        try {
            List<IncidentDto> incidents = incidentService.getIncidents();
            return ResponseEntity.ok(incidents);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getIncidentById(@PathVariable UUID id) {
        try {
            return ResponseEntity.ok(incidentService.getIncidentByUserId(id));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PostMapping("")
    public ResponseEntity<?> createIncident(@RequestBody IncidentDto incident) {
        try {
            return ResponseEntity.ok(incidentService.createIncident(incident));

        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
