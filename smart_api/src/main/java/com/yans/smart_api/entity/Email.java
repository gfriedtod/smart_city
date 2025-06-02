package com.yans.smart_api.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;

@Embeddable
@Getter
@Setter
@Builder
public class Email {
    private static final String EMAIL_PATTERN = "^[A-Za-z0-9+_.-]+@(.+)$";
    
    @Column(name = "email", nullable = false)
    private String address;
    
    public Email() {}
    
    public Email(String address) {
        setAddress(address);
    }
    
    /**
     * Sets the email address with validation
     * @param address email address to set
     * @throws IllegalArgumentException if email is invalid
     */
    public void setAddress(String address) {
        if (address != null && !isValidEmailFormat(address)) {
            throw new IllegalArgumentException("Invalid email format");
        }
        this.address = address;
    }
    
    /**
     * Checks if the stored email address is valid
     * @return true if email is not null and matches a valid email format
     */
    public boolean isValidEmailAddress() {
        return address != null && isValidEmailFormat(address);
    }
    
    private boolean isValidEmailFormat(String email) {
        return email.matches(EMAIL_PATTERN);
    }
}