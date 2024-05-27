package travel.project.service.ScheduleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;
import travel.project.domain.*;
import travel.project.repository.Schedule.ScheduleRepository;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Service
public class ScheduleServiceImpl implements ScheduleService{

    private final ScheduleRepository scheduleRepository;

    @Override
    public List<Schedule> findScheduleById(long packId) {
        return scheduleRepository.findScheduleById(packId);
    }

    @Override
    public int getMaxDayNum(long packId) {
        return scheduleRepository.getMaxDayNum(packId);
    }

    @Override
    public List<Attraction> findAttractionByDayNum(int i,long packId) {
        return scheduleRepository.findAttractionByDayNum(i,packId);
    }

    @Override
    public Hotels findHotelByDayNum(int i,long packId) {
        return scheduleRepository.findHotelByDayNum(i,packId);
    }

    @Override
    public List findRestaurantByDayNum(int i,long packId) {
        return scheduleRepository.findRestaurantByDayNum(i,packId);
    }

    @Override
    public List<Hotels_Img> getHotelImages(long hotelId) {
        return scheduleRepository.getHotelImages(hotelId);
    }

    @Override
    public List<Destinations_Img> getDestinationImages(long destId) {
        return scheduleRepository.getDestinationImages(destId);
    }

    @Override
    public List<HotelAmenities> getHotelAmenities(long hotelId) {
        return scheduleRepository.getHotelAmenities(hotelId);
    }
}
