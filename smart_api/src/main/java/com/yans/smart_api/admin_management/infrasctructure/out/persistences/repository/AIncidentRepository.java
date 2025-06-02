package com.yans.smart_api.admin_management.infrasctructure.out.persistences.repository;

import com.yans.smart_api.core.IncidentStatus;
import com.yans.smart_api.entity.Incident;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.UUID;

public interface AIncidentRepository extends JpaRepository<Incident, UUID>, JpaSpecificationExecutor<Incident> {
  @Transactional
  @Modifying
  @Query("update Incident i set i.status = ?1 where i.id = ?2")
  void changeIncidentStatus(IncidentStatus status, UUID id);
}