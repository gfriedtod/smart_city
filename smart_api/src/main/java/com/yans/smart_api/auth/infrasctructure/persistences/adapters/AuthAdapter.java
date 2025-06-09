package com.yans.smart_api.auth.infrasctructure.persistences.adapters;

import com.yans.smart_api.auth.application.out.AuthOut;
import com.yans.smart_api.auth.infrasctructure.persistences.repository.AuthRepository;
import com.yans.smart_api.core.config.MessagePublisher;
import com.yans.smart_api.core.config.UserMapper;
import com.yans.smart_api.core.dto.UserDto;
import com.yans.smart_api.entity.AppUser;
import com.yans.smart_api.entity.Email;
import org.springframework.stereotype.Component;

import java.util.Optional;

@Component
class AuthAdapter implements AuthOut {
    
    private final AuthRepository authRepository;
    private final UserMapper userMapper;
    private static final String NOTIFICATION_PREFIX = "notification-" ;
    private static final String ORDER_PREFIX = "order-" ;
    private static final String NOTIFICATION_ALL_PREFIX = "notification-all" ;
    private final MessagePublisher messagePublisher;

    AuthAdapter(AuthRepository authRepository, UserMapper userMapper, MessagePublisher messagePublisher) {
        this.authRepository = authRepository;
        this.userMapper = userMapper;
        this.messagePublisher = messagePublisher;
    }

    @Override
    public void save(UserDto userDto) {
        authRepository.save(userMapper.toEntity(userDto));
        
    }

    @Override
    public UserDto findByUsername(String username) {
        Optional<AppUser> user = authRepository.findByEmail(new Email(username));

        return user.map(userMapper::toDto).orElse(null);


    }
}
