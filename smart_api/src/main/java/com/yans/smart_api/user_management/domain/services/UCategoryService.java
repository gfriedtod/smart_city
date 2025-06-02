package com.yans.smart_api.user_management.domain.services;

import com.yans.smart_api.core.dto.CategoryDto;
import com.yans.smart_api.user_management.application.in.UCategoryInput;
import com.yans.smart_api.user_management.application.out.UCategoryOutput;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
class UCategoryService implements UCategoryInput {
    private  final UCategoryOutput uCategoryOutput;

    UCategoryService(UCategoryOutput uCategoryOutput) {
        this.uCategoryOutput = uCategoryOutput;
    }


    /**
     * @return
     */
    @Override
    public List<CategoryDto> getAllCategory() {
        return uCategoryOutput.getAllCategory();
    }
}
