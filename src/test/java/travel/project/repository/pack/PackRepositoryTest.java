package travel.project.repository.pack;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import travel.project.domain.HotelView;
import travel.project.domain.Hotels;
import travel.project.mapper.PackMapper;
import travel.project.repository.DestinationRepository.DestinationRepository;
import travel.project.repository.Schedule.ScheduleRepository;

import java.util.List;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;

@Transactional
@SpringBootTest(properties = {"spring.config.location=classpath:application-test.yml"})
class PackRepositoryTest {

    @Autowired
    private PackRepository packRepository;
    @Autowired
    private ScheduleRepository scheduleRepository;
    @Autowired
    private PackMapper packMapper;

    @Test
    void saveHotel() throws Exception{
        //given
        Hotels hotel = new Hotels(2,"힐튼","JPN-NRT",5,"개좋음");
        //when
        packRepository.saveHotel(hotel);
        Hotels hotel1 = packMapper.selectOne(hotel.getHotelName());
        //then
        assertThat(hotel1.getHotelName()).isEqualTo(hotel1.getHotelName());
    }
    @Test
    void saveHotelImg() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void saveHotelAmenities() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void findAllPacks() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void saveDestination() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void findAllDestination() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void saveRestaurant() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void saveImg() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void saveAttraction() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void savePack() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void findByDestinationHotels() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void findPackById() throws Exception{
        //given

        //when

        //then
    }
    @Test
    void findHotelsByDestinationName() throws Exception{
        //given

        //when

        //then
    }
}