package com.yans.smart_api.auth.domain;

import com.yans.smart_api.auth.application.out.AuthOut;
import com.yans.smart_api.core.UserProfile;
import com.yans.smart_api.core.dto.UserDto;
import lombok.RequiredArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.Collections;

@Service
@RequiredArgsConstructor
public class CustomUserDetailsService implements UserDetailsService {
    private final AuthOut userRepository;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDto user = userRepository.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with username: "+username);
        }
        
        Collection<GrantedAuthority> authorities = createUserAuthority(user.getProfile());
        
        return new User(
            user.getUsername(),
            user.getPassword(),
            authorities
        );
    }

    private Collection<GrantedAuthority> createUserAuthority(UserProfile profile) {
        if (profile == null) {
            throw new IllegalArgumentException("User profile cannot be null");
        }
        return Collections.singleton(new SimpleGrantedAuthority("ROLE_"+profile.name()));
    }
}