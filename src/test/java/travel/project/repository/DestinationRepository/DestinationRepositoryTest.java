package travel.project.repository.DestinationRepository;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import travel.project.controller.PackController;
import travel.project.domain.Attraction;
import travel.project.domain.Destination;
import travel.project.domain.Restaurants;
import travel.project.mapper.DestinationMapper;

import java.util.List;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;

@Transactional
@SpringBootTest(properties = {"spring.config.location=classpath:application-test.yml"})
class DestinationRepositoryTest {

    @Autowired
    DestinationRepository destinationRepository;
//    @Test
//    void findDestByName() throws Exception{
//        //given
//        String destinationName = "JPN-NRT";
//        Destination destination = new Destination(10,"JPN-NRT","Japan","바로옆 개꿀");
//        //when
//        Destination destByName = destinationRepository.findDestByName(destinationName);
//        //then
//        assertThat(destination.getDestinationId()).isEqualTo(destByName.getDestinationId());
//        assertThat(destination.getCountry()).isEqualTo(destByName.getCountry());
//        assertThat(destination.getDestinationDescription()).isEqualTo(destByName.getDestinationDescription());
//    }

    @Test
    void findAttractionById() {
        List<Attraction> attractionById = destinationRepository.findAttractionById(1);
        assertThat(attractionById.size()).isEqualTo(1);
        assertThat(attractionById.get(0).getAttractionName()).isEqualTo("도쿄타워");

    }

    @Test
    void findRestaurantsById() {
        List<Restaurants> restaurantsById = destinationRepository.findRestaurantsById(1);
        assertThat(restaurantsById.size()).isEqualTo(1);
        assertThat(restaurantsById.get(0).getRestaurantName()).isEqualTo("먹담");
    }
}