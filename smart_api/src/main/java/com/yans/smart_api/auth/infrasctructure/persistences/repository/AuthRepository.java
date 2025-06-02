package com.yans.smart_api.auth.infrasctructure.persistences.repository;

import com.yans.smart_api.entity.AppUser;
import com.yans.smart_api.entity.Email;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;
import java.util.UUID;

@Repository
public interface AuthRepository extends JpaRepository<AppUser, UUID>, JpaSpecificationExecutor<AppUser> {

    <T> Optional<AppUser> findByEmail(Email email);
}