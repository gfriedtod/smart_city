package com.yans.smart_api.auth.infrasctructure.in;

import com.yans.smart_api.auth.domain.request.AuthRequest;
import com.yans.smart_api.auth.domain.response.AuthErrorResponse;
import com.yans.smart_api.auth.domain.response.AuthResponse;
import com.yans.smart_api.auth.domain.AuthService;
import com.yans.smart_api.auth.domain.request.RegisterRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping("auth/")
@CrossOrigin("*")
@RequiredArgsConstructor
public class AuthController {

    private final AuthService authService;

    @PostMapping("register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest request) {
        try{
            return ResponseEntity.ok(authService.register(request));
        } catch (Exception e) {
            log.error(e.getCause().getMessage());
            return ResponseEntity.badRequest().body(new AuthErrorResponse(e.getMessage()));
        }
    }

    @PostMapping("authenticate")
    public ResponseEntity<?> authenticate(@RequestBody AuthRequest request) {
        try{
            return ResponseEntity.ok(authService.authenticate(request));

        } catch (Exception e) {
            log.error(String.valueOf(e));
            return ResponseEntity.badRequest().body(new AuthErrorResponse(e.getMessage()));
        }
    }
}