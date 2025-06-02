package com.yans.smart_api.user_management.infrasctructure.persistences.repository;

import com.yans.smart_api.entity.Incident;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

import java.util.UUID;

@Repository
public interface UIncidentRepository extends JpaRepository<Incident, UUID>, JpaSpecificationExecutor<Incident> {
}