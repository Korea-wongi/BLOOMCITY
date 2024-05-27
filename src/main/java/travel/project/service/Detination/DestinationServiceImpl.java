package travel.project.service.Detination;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import travel.project.domain.Attraction;
import travel.project.domain.Destination;
import travel.project.domain.Restaurants;
import travel.project.repository.DestinationRepository.DestinationRepository;

import java.util.List;

@RequiredArgsConstructor
@Service
public class DestinationServiceImpl implements DestinationService{

    private final DestinationRepository destinationRepository;


    @Override
    public Destination findDestByName(String destinationName) {
        return destinationRepository.findDestByName(destinationName);
    }

    @Override
    public List<Attraction> findAttractionById(long destId) {
        return destinationRepository.findAttractionById(destId);
    }

    @Override
    public List<Restaurants> findRestaurantsById(long destId) {
        return destinationRepository.findRestaurantsById(destId);
    }
}
