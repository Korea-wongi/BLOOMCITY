package travel.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import travel.project.domain.Attraction;
import travel.project.domain.AttractionView;
import travel.project.domain.Attraction_each_day;
import travel.project.domain.Destination;
import travel.project.domain.HotelView;
import travel.project.domain.Hotel_each_day;
import travel.project.domain.Hotels;
import travel.project.domain.Pack;
import travel.project.domain.RestaurantView;
import travel.project.domain.Restaurant_each_day;
import travel.project.domain.Restaurants;
import travel.project.domain.Schedule;


@Mapper
public interface PackMapper {

	// 호텔 등록
    void saveHotel(Hotels hotels);

    // 호텔 이름으로 찾기
    Hotels selectOne(String hotelName);

    // 호텔 이미지 등록
    void saveHotelImg(@Param("imgNames") List<String> imgNames, @Param("id") long id);
    
    // 호텔 편의시설 등록
    void saveHotelAmenities(@Param("amenities") List<String> amenities,@Param("id") long id);
    
    List<Pack> findAllPacks();

    List<Pack> findPacksByDestination(String destination);

    
    // Destination 등록
    long saveDestination(Destination destination); 
    
    // Destination 리스트 반환

    // restaurant 등록
    void saveRestaurant(@Param("restaurants") Restaurants restaurants, @Param("destination_Id") long destination_Id);
    
    // 식당, 명소, 관광지 이미지 등록
    void saveImg(@Param("imgNames") List<String> imgNames, @Param("type")String type, @Param("id")long id);
    
    // Attraction 등록
    void saveAttraction(@Param("attraction") Attraction attraction, @Param("id") long id);
    
    // Pack 등록
    void savePack(Pack pack);
    
    // Pack 인덱스 반환
    long selectLastPack();
    
    // Pack id 조회
    Pack findByIdPack(long packId);
    
	// 호텔 모든 열 지역으로 검색
    List<HotelView> findByDestinationHotels(String destinationName);
    
	// 레스토랑 모든 열 지역으로 검색
    List<RestaurantView> findByDestinationRestaurant(String destinationName);

    List<Destination> findAllDestination();




    // 관광지 모든 열 지역으로 검색
    List<AttractionView> findByDestinationAttraction(@Param("destinationName")String destinationName, @Param("type")String type);
    
    // Schedule 등록 
    void saveSchedule(Schedule schedule);
    
    // hotel_each_day 등록
    void saveEachHotel(Hotel_each_day hotel_each_day);
    
    // Attraction_each_day 등록
    void saveEachAttraction(Attraction_each_day attraction_each_day);
    
    // Restaurant_each_day 등록
    void saveEachRestaurant(Restaurant_each_day restaurant_each_day);


    List<HotelView> findHotelsByDestinationName(String destinationName);

    Pack findPackById(long packId);
    
    //패키지 조회
    List<Pack> reservationInquiry(@Param("startDate") String startDate,@Param("endDate") String endDate);

    // 패키지 삭제 처리
    void packagesDelete(long packId);
    
    // 호텔 뷰 조회
    HotelView findHotelsBypackId(long packId);
    
    // 패키지 수정
    void updatePack(Pack pack);
    
    // 스케줄 삭제
    void deleteSchedule(long packId);
    
    // each table 삭제
    void deleteEachTable(Map<String, Object> params);
    
    
}
