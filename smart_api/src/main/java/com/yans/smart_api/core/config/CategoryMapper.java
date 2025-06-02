package com.yans.smart_api.core.config;

import com.yans.smart_api.core.dto.CategoryDto;
import com.yans.smart_api.entity.Category;
import org.springframework.stereotype.Component;

import java.time.OffsetDateTime;
import java.util.List;
import java.util.stream.Collectors;

/**
 * CategoryMapper is a utility class responsible for converting between
 * {@link Category} entities and their corresponding {@link CategoryDto} representations.
 * This class provides methods for mapping individual entities to DTOs, lists of entities to
 * DTO lists, and vice versa. It also enables updating an existing entity instance from a DTO.
 * The class is marked as a Spring Component, which allows it to be autodetected and managed by
 * Spring's dependency injection container.
 */
@Component
public class CategoryMapper {

    /**
     * Converts a {@link Category} entity to a {@link CategoryDto}.
     *
     * @param category the {@link Category} entity to be converted. Can be null.
     * @return an instance of {@link CategoryDto} containing the mapped data from the given entity.
     *         Returns null if the provided {@link Category} is null.
     */
    public CategoryDto toDto(Category category) {
        if (category == null) return null;

        return CategoryDto.builder()
                .id(category.getId())
                .name(category.getName())
                .createdAt(category.getCreatedAt())
                .updatedAt(category.getUpdatedAt())
                .isActive(category.getIsActive())
                .build();
    }

    /**
     * Converts a list of {@link Category} entities to a list of {@link CategoryDto} objects.
     *
     * @param categories the list of {@link Category} entities to be converted. Must not be null.
     * @return a list of {@link CategoryDto} objects containing the mapped data from the provided entities.
     *         Returns an empty list if the input list is empty.
     */
    public List<CategoryDto> toDtoList(List<Category> categories) {
        return categories.stream()
                .map(this::toDto)
                .collect(Collectors.toList());
    }

    /**
     * Converts a {@link CategoryDto} object to a {@link Category} entity.
     * If the provided {@link CategoryDto} object is null, this method returns null.
     *
     * @param dto the {@link CategoryDto} object to be converted. Can be null.
     * @return an instance of {@link Category} with values mapped from the given {@link CategoryDto}.
     *         Returns null if the input {@link CategoryDto} is null.
     */
    public Category toEntity(CategoryDto dto) {
        if (dto == null) return null;

        Category category = new Category();
        category.setId(dto.getId());
        category.setName(dto.getName());
        category.setCreatedAt(dto.getCreatedAt() != null ? dto.getCreatedAt() : OffsetDateTime.now());
        category.setUpdatedAt(OffsetDateTime.now());
        category.setIsActive(dto.getIsActive() != null ? dto.getIsActive() : true);
        return category;
    }

    /**
     * Updates the fields of a {@link Category} entity using the provided {@link CategoryDto}.
     * Only non-null fields from the {@link CategoryDto} will be updated in the {@link Category} entity.
     * The update time of the {@link Category} entity will be set to the current timestamp.
     *
     * @param dto the {@link CategoryDto} containing the data to update. Can be null.
     * @param category the {@link Category} entity to be updated. Can be null.
     */
    public void updateEntityFromDto(CategoryDto dto, Category category) {
        if (dto == null || category == null) return;

        if (dto.getName() != null) {
            category.setName(dto.getName());
        }
        if (dto.getIsActive() != null) {
            category.setIsActive(dto.getIsActive());
        }
        category.setUpdatedAt(OffsetDateTime.now());
    }
}
