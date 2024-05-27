package travel.project.repository.DestinationRepository;

import travel.project.domain.Attraction;
import travel.project.domain.Destination;
import travel.project.domain.Restaurants;

import java.util.List;

public interface DestinationRepository {
    Destination findDestByName(String destinationName);

    List<Attraction> findAttractionById(long destId);

    List<Restaurants> findRestaurantsById(long destId);
}
