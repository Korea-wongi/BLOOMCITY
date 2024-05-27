package travel.project.repository.Schedule;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Repository;
import travel.project.domain.*;
import travel.project.mapper.ScheduleMapper;

import java.util.List;

@RequiredArgsConstructor
@Slf4j
@Repository
public class ScheduleRepositoryImpl implements ScheduleRepository {

    private final ScheduleMapper scheduleMapper;

    @Override
    public List<Schedule> findScheduleById(long packId) {
        return scheduleMapper.findScheduleById(packId);
    }

    @Override
    public int getMaxDayNum(long packId) {
        return scheduleMapper.getMaxDayNum(packId);
    }

    @Override
    public List<Attraction> findAttractionByDayNum(int i,long packId) {
        return scheduleMapper.findAttractionByDayNum(i,packId);
    }

    @Override
    public Hotels findHotelByDayNum(int i,long packId) {
        return scheduleMapper.findHotelByDayNum(i,packId);
    }

    @Override
    public List findRestaurantByDayNum(int i,long packId) {
        return scheduleMapper.findRestaurantByDayNum(i,packId);
    }

    @Override
    public List<Hotels_Img> getHotelImages(long hotelId) {
        return scheduleMapper.getHotelImages(hotelId);
    }

    @Override
    public List<Destinations_Img> getDestinationImages(long destId) {
        return scheduleMapper.getDestinationImages(destId);
    }

    @Override
    public List<HotelAmenities> getHotelAmenities(long hotelId) {
        return scheduleMapper.getHotelAmenities(hotelId);
    }
}
