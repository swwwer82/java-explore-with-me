package practicum.stats.mapper;

import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;
import practicum.stats.model.EndpointHit;
import ru.practicum.dto.EndpointHitInDto;



@Mapper(unmappedTargetPolicy = ReportingPolicy.IGNORE,
        componentModel = "spring")
public interface StatMapper {
    EndpointHit toEndpointHit(EndpointHitInDto endHit);
}
