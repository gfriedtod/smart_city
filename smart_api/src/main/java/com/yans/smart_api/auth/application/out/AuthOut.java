package com.yans.smart_api.auth.application.out;

import com.yans.smart_api.core.dto.UserDto;


public interface AuthOut {

    void save(UserDto userDto);

     UserDto findByUsername(String username);
}
