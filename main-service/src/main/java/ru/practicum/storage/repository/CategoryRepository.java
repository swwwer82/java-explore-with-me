package ru.practicum.storage.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ru.practicum.model.entity.Category;

public interface CategoryRepository extends JpaRepository<Category, Long> {

    Boolean existsByName(String name);

}
