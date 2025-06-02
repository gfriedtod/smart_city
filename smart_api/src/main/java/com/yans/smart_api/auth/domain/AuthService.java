package com.yans.smart_api.auth.domain;

import com.yans.smart_api.auth.application.out.AuthOut;
import com.yans.smart_api.auth.domain.request.AuthRequest;
import com.yans.smart_api.auth.domain.request.RegisterRequest;
import com.yans.smart_api.auth.domain.response.AuthResponse;
import com.yans.smart_api.core.UserProfile;
import com.yans.smart_api.core.dto.EmailDto;
import com.yans.smart_api.core.dto.UserDto;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.OffsetDateTime;

@Slf4j
@Service
@RequiredArgsConstructor
public class AuthService {
    private final AuthOut userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtService jwtService;
    private final AuthenticationManager authenticationManager;

    public AuthResponse register(RegisterRequest request) {
        String encode = passwordEncoder.encode(request.getPassword());
        log.info("encode: {}", encode);
        var user = UserDto.builder()
                .username(request.getUsername())
                .email(EmailDto.builder().address(request.getEmail()).build())
                .password(encode)
                .profile(UserProfile.USER)
                .isActive(true)
                .createdAt(OffsetDateTime.now())
                .updatedAt(OffsetDateTime.now())
                .build();

        userRepository.save(user);
        var token = jwtService.generateToken(user);
        return AuthResponse.builder()
                .token(token)
                .build();
    }

    public AuthResponse authenticate(AuthRequest request) {
        log.debug("Authenticating user: {}", request.getUsername());

        // Check if user exists first
        var user = userRepository.findByUsername(request.getUsername());
        if (user == null) {
            log.error("User not found: {}", request.getUsername());
            throw new UsernameNotFoundException("User not found: " + request.getUsername());
        }

        try {
            if(!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
                log.error("Invalid password for user: {}", request.getUsername());
                throw new UsernameNotFoundException("Invalid credentials");
            }
//            authenticationManager.authenticate(
//                    new UsernamePasswordAuthenticationToken(
//                            user.getEmail(),
//                            user.getPassword()
//                    )
//            );
        } catch (Exception e) {
            log.error(String.valueOf(e));
            log.error("Authentication failed for user {}: {}", request.getUsername(), e.getMessage());
            throw new UsernameNotFoundException("Invalid credentials");
        }

        var token = jwtService.generateToken(user);
        log.debug("Generated token for user: {}", request.getUsername());

        return AuthResponse.builder()
                .token(token)
                .build();
    }
}