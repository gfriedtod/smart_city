package com.yans.smart_api.user_management.infrasctructure.persistences.repository;

import com.yans.smart_api.entity.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.UUID;

public interface UCategoryRepository extends JpaRepository<Category, UUID>, JpaSpecificationExecutor<Category> {
}