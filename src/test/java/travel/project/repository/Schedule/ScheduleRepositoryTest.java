package travel.project.repository.Schedule;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;
import travel.project.domain.*;
import travel.project.repository.DestinationRepository.DestinationRepository;

import java.util.List;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.*;

@Transactional
@SpringBootTest(properties = {"spring.config.location=classpath:application-test.yml"})
class ScheduleRepositoryTest {
    @Autowired
    private ScheduleRepository scheduleRepository;
    @Autowired
    private DestinationRepository destinationRepository;

//    @Test
//    void findScheduleById() throws Exception{
//        //given
//        Schedule schedule = new Schedule(1,1,1,"TOUR",1, "도쿄 투어");
//        //when
//        List<Schedule> scheduleById = scheduleRepository.findScheduleById(1);
//        //then
//        assertThat(scheduleById.size()).isEqualTo(2);
//        assertThat(scheduleById.get(0).getDescription()).isEqualTo("도쿄 투어");
//    }

    @Test
    void getMaxDayNum() throws Exception{
        //given
        List<Schedule> scheduleById = scheduleRepository.findScheduleById(1);
        //when
        int maxDayNum = scheduleRepository.getMaxDayNum(1);
        //then
        assertThat(scheduleById.size()).isEqualTo(maxDayNum);
    }

    @Test
    void findAttractionByDayNum() throws Exception{
        //given
        //when
        List<Attraction> attractionByDayNum = scheduleRepository.findAttractionByDayNum(1, 1);
        //then
        assertThat(attractionByDayNum.size()).isEqualTo(1);
    }

    @Test
    void findHotelByDayNum() {
        //given
        Hotels hotel = new Hotels(1,"아난티","도쿄", 4,"아난티 도쿄");
        //when
        Hotels hotelByDayNum = scheduleRepository.findHotelByDayNum(1, 1);
        //then
        assertThat(hotelByDayNum.getHotelName()).isEqualTo(hotel.getHotelName());
        assertThat(hotelByDayNum.getDestinationName()).isEqualTo(hotel.getDestinationName());
        assertThat(hotelByDayNum.getStarRating()).isEqualTo(hotel.getStarRating());
        assertThat(hotelByDayNum.getDescription()).isEqualTo(hotel.getDescription());

    }

    @Test
    void findRestaurantByDayNum() {
        List restaurantByDayNum = scheduleRepository.findRestaurantByDayNum(1, 1);
        assertThat(restaurantByDayNum.size()).isEqualTo(1);

    }

    @Test
    void getHotelImages() throws Exception {
        //given
        String hotel_name = "아난티 사진.jpg";
        //when
        List<Hotels_Img> hotelImages = scheduleRepository.getHotelImages(1);
        //then
        assertThat(hotelImages.size()).isEqualTo(1);
        assertThat(hotelImages.get(0).getImgName()).isEqualTo(hotel_name);
    }


    @Test
    void getDestinationImages() {

    }
    @Test
    void 호텔_부대시설() throws Exception{
        //given
        String ammenity1 = "swimming pool";
        String ammenity2 = "gym";
        //when
        List<HotelAmenities> hotelAmenities = scheduleRepository.getHotelAmenities(1);
        //then
        assertThat(hotelAmenities.size()).isEqualTo(2);
        assertThat(hotelAmenities.get(0).getAmenity()).isEqualTo(ammenity1);
        assertThat(hotelAmenities.get(1).getAmenity()).isEqualTo(ammenity2);

    }
}