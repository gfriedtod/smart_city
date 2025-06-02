package com.yans.smart_api.user_management.infrasctructure.in;

import com.yans.smart_api.user_management.application.in.UCategoryInput;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
@CrossOrigin("*")
@RequestMapping("user/category")
class UCategoryController {

    private final UCategoryInput categoryInput;

    UCategoryController(UCategoryInput categoryInput) {
        this.categoryInput = categoryInput;
    }

    @GetMapping("")
    ResponseEntity<?> getAllCategory(){
         try{
              return ResponseEntity.ok(categoryInput.getAllCategory());
         } catch (Exception e){
             log.error(e.getMessage());
             return ResponseEntity.badRequest().body(e.getMessage());
         }
    }
}
