package com.yans.smart_api.admin_management.infrasctructure.in;

import com.yans.smart_api.admin_management.application.in.AIncidentInput;
import com.yans.smart_api.admin_management.domain.dto.request.ChangeIncidentStatusRequest;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@Slf4j
@RestController
@CrossOrigin("*")
@RequestMapping("admin/incident")
//@PreAuthorize("hasRole('ADMIN')")
class AIncidentController {

    private final AIncidentInput incidentInput;

    AIncidentController(AIncidentInput incidentInput) {
        this.incidentInput = incidentInput;
    }

    @PutMapping("/changeStatus")
    public ResponseEntity<?> changeIncidentStatus(@RequestBody ChangeIncidentStatusRequest request) {
//         try {
             incidentInput.changeStatus(request);
             return ResponseEntity.ok().build();
//         } catch (Exception e) {
//             log.error(e.getCause().getMessage());
//             return ResponseEntity.badRequest().build();
//         }
    }
}
