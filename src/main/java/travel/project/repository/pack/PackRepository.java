package travel.project.repository.pack;

import java.util.List;
import java.util.Map;

import travel.project.domain.Destination;
import travel.project.domain.Hotels;
import travel.project.domain.Pack;
import travel.project.domain.Restaurants;
import travel.project.domain.Attraction;
import travel.project.domain.Customer;
import travel.project.domain.Destination;
import travel.project.domain.HotelView;
import travel.project.domain.Hotels;
import travel.project.domain.Pack;
import travel.project.domain.RestaurantView;
import travel.project.domain.Restaurants;
import travel.project.domain.*;


public interface PackRepository {

	// 호텔 등록 후 반환
    Hotels saveHotel(Hotels hotels);

    // 호텔 이미지 등록
    void saveHotelImg(List<String> imgNames, long id);

    // 호텔 편의시설 등록
    void saveHotelAmenities(List<String> amenities, long id);

    List<Pack> findAllPacks();

    List<Pack> findPackList(String destination);

    // Destination 등록
    long saveDestination(Destination destination);

    // Destination 리스트 반환
    List<Destination> findAllDestination();

    // Restaurants 등록
    void saveRestaurant(Restaurants restaurants, long destination_Id);


    // 패키지 조회
	List<Pack> reservationInquiry(String startDate,String endDate);

    
    // 식당, 명소, 관광지 이미지 등록
    void saveImg(List<String> imgNames, String type, long id);
    
    // Attraction 등록
    void saveAttraction(Attraction attraction, long id);
    
    // Pack 등록 후 조회
    long savePack(Pack pack);
    
	// 호텔 모든 열 지역으로 검색
    List<HotelView> findByDestinationHotels(String destinationName);
    
	// 레스토랑 모든 열 지역으로 검색
    List<RestaurantView> findByDestinationRestaurant(String destinationName);

    // 관광지 모든 열 지역으로 검색
    List<AttractionView> findByDestinationAttraction(String destinationName, String type);
    
    // Schedule 등록
    void saveSchedule(Schedule schedule);
    
    // hotel_each_day 등록
    void saveEachHotel(Hotel_each_day hotel_each_day);
    
    // Attraction_each_day 등록
    void saveEachAttraction(Attraction_each_day attraction_each_day);
    
    // Restaurant_each_day 등록
    void saveEachRestaurant(Restaurant_each_day restaurant_each_day);

    // 패키지 조회 (id)로
    Pack findPackById(long packId);
  
    // Destination에 묶여있는 호텔 리스트 조회
    List<HotelView> findHotelsByDestinationName(String destinationName);

    // 패키지 삭제 처리
	public void packagesDelete(long packId);

    // 패키지 수정
	Pack updatePack(Pack pack);
	
	// 스케줄 삭제
	void deleteSchedule(long packId);
}
