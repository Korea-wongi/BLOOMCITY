package travel.project.repository.DestinationRepository;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;
import travel.project.domain.Attraction;
import travel.project.domain.Destination;
import travel.project.domain.Restaurants;
import travel.project.mapper.DestinationMapper;

import java.util.List;

@RequiredArgsConstructor
@Repository
public class DestinationRepositoryImpl implements DestinationRepository{

    private final DestinationMapper destinationMapper;

// Destination을 이름으로 찾음
    @Override
    public Destination findDestByName(String destinationName) {
        return destinationMapper.findDestByName(destinationName);
    }
// Attraction과 DestinationId로 조인해놓은 뷰에서 attraction 에 관한 정보 select
    @Override
    public List<Attraction> findAttractionById(long destId) {
        return destinationMapper.findAttractionById(destId);
    }

    @Override
    public List<Restaurants> findRestaurantsById(long destId) {
        return destinationMapper.findRestaurantsById(destId);
    }
}
