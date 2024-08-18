package ru.practicum.dto.category;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.hibernate.validator.constraints.Length;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@Data
@Schema(description = "Категория")
public class CategoryDto {

    @Schema(description = "Идентификатор категории", example = "1")
    @NotNull
    private Long id;

    @Schema(description = "Название категории", example = "Концерты")
    @NotBlank
    @Length(max = 50, min = 1)
    private String name;
}
