package ru.practicum.utils;

import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

public class PaginationUtils {

    public static Pageable getPageable(int from, int size) {
        return PageRequest.of(from / size, size);
    }

}
