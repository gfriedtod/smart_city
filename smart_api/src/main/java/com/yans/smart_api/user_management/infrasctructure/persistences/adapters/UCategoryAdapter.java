package com.yans.smart_api.user_management.infrasctructure.persistences.adapters;

import com.yans.smart_api.core.config.CategoryMapper;
import com.yans.smart_api.core.dto.CategoryDto;
import com.yans.smart_api.user_management.application.out.UCategoryOutput;
import com.yans.smart_api.user_management.infrasctructure.persistences.repository.UCategoryRepository;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
class UCategoryAdapter implements UCategoryOutput {

    private final UCategoryRepository uCategoryRepository;
    private final CategoryMapper categoryMapper;

    UCategoryAdapter(UCategoryRepository uCategoryRepository, CategoryMapper categoryMapper) {
        this.uCategoryRepository = uCategoryRepository;
        this.categoryMapper = categoryMapper;
    }

    /**
     * @return
     */
    @Override
    public List<CategoryDto> getAllCategory() {
        return categoryMapper.toDtoList(uCategoryRepository.findAll());
    }
}
