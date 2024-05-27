package travel.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import travel.project.domain.Attraction;
import travel.project.domain.Destination;
import travel.project.domain.Restaurants;

import java.util.List;

@Mapper
public interface DestinationMapper {

    Destination findDestByName(String destinationName);

    List<Attraction> findAttractionById(long destId);

    List<Restaurants> findRestaurantsById(long destId);
}
