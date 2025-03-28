package ru.practicum.events.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ru.practicum.category.dto.CategoryDto;
import ru.practicum.events.model.State;
import ru.practicum.location.model.Location;
import ru.practicum.user.dto.UserShortDto;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class EventDto {

    private Long id;

    private String title;

    private String annotation;

    private CategoryDto category;

    private Boolean paid;

    private String eventDate;

    private UserShortDto initiator;

    private String description;

    private Long participantLimit;

    private State state;

    private String createdOn;

    private Location location;

    private Boolean requestModeration;

    private Long confirmedRequests;

    private String publishedOn;

    private Long views;
}
