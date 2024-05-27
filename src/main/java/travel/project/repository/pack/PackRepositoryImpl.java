package travel.project.repository.pack;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
import travel.project.mapper.CustomerMapper;
import travel.project.mapper.PackMapper;

@Slf4j
@RequiredArgsConstructor
@Repository
public class PackRepositoryImpl implements PackRepository{

	private final PackMapper packMapper;

	// 호텔 등록 후 반환
	@Override
	public Hotels saveHotel(Hotels hotels) {
		packMapper.saveHotel(hotels);

		return packMapper.selectOne(hotels.getHotelName());
	}
	// 호텔 이미지 등록
	@Override
	public void saveHotelImg(List<String> imgNames, long id) {
		packMapper.saveHotelImg(imgNames, id);
	}

	// 호텔 편의시설 등록
	@Override
	public void saveHotelAmenities(List<String> amenities, long id) {
		packMapper.saveHotelAmenities(amenities, id);
	}

	// Destination 등록
	@Override
	public long saveDestination(Destination destination) {
		return packMapper.saveDestination(destination);
	}

	// Destination 리스트 반환
	@Override
	public List<Destination> findAllDestination() {
		return packMapper.findAllDestination();
	}

	// Restaurants 등록
	@Override
	public void saveRestaurant(Restaurants restaurants, long destination_Id) {
		packMapper.saveRestaurant(restaurants, destination_Id);
	}
	
	// 식당, 명소, 관광지 이미지 등록
	@Override
	public void saveImg(List<String> imgNames, String type, long id) {
		packMapper.saveImg(imgNames, type, id);
	}


	@Override
	public List<Pack> findAllPacks() {
		return packMapper.findAllPacks();
	}

	@Override
	public List<Pack> findPackList(String destination) {
		List<Pack> packList = new ArrayList<>();
		// PathVariable 이 All 이면 모든 리스트 보여줌
		if(destination.equals("all")){
			packList = packMapper.findAllPacks();
		}else{
			// PathVariable 이 특정 목적지면 해당 목적지의 리스트 보여줌
			packList = packMapper.findPacksByDestination(destination);
		}
		return packList;
	}
	
	// Attraction 등록
	@Override
	public void saveAttraction(Attraction attraction, long id) {
		packMapper.saveAttraction(attraction, id);
	}
	
	// Pack 등록 후 리턴
	@Override
	public long savePack(Pack pack) {
		packMapper.savePack(pack);
		return packMapper.selectLastPack();
	}
	
	// 호텔 모든 열 지역으로 검색
	@Override
	public List<HotelView> findByDestinationHotels(String destinationName) {
		return packMapper.findByDestinationHotels(destinationName);
	}
	
	// 레스토랑 모든 열 지역으로 검색
	@Override
	public List<RestaurantView> findByDestinationRestaurant(String destinationName) {
		return packMapper.findByDestinationRestaurant(destinationName);
	}

	@Override
	public Pack findPackById(long packId) {
		return packMapper.findPackById(packId);
	}
	
	//패키지 조회
	@Override
	public List<Pack> reservationInquiry(String startDate,String endDate) {
	    List<Pack> list = packMapper.reservationInquiry(startDate,endDate);
	    return list;
	}

	@Override
	public List<HotelView> findHotelsByDestinationName(String destinationName) {
		return packMapper.findHotelsByDestinationName(destinationName);
	}
	
	// 관광지 모든 열 지역으로 검색
	@Override
	public List<AttractionView> findByDestinationAttraction(String destinationName, String type) {
		return packMapper.findByDestinationAttraction(destinationName, type);
	}
	
	// Schedule 등록
	@Override
	public void saveSchedule(Schedule schedule) {
		packMapper.saveSchedule(schedule);
	}
	
	// hotel_each_day 등록
	@Override
	public void saveEachHotel(Hotel_each_day hotel_each_day) {
		packMapper.saveEachHotel(hotel_each_day);
	}
	
	// Attraction_each_day 등록
	@Override
	public void saveEachAttraction(Attraction_each_day attraction_each_day) {
		packMapper.saveEachAttraction(attraction_each_day);
	}
	
	// Restaurant_each_day 등록
	@Override
	public void saveEachRestaurant(Restaurant_each_day restaurant_each_day) {
		packMapper.saveEachRestaurant(restaurant_each_day);
	}
	
	// 패키지 삭제 처리
	@Override
	public void packagesDelete(long packId) {
		packMapper.packagesDelete(packId);
	}
	
	// 패키지 수정
	@Override
	public Pack updatePack(Pack pack) {
		packMapper.updatePack(pack);
		
		return packMapper.findByIdPack(pack.getPackId());
	}
	
	// 스케줄 삭제
	@Override
	public void deleteSchedule(long packId) {
		packMapper.deleteSchedule(packId);
		
        List<String> tableNames = Arrays.asList("hotel_each_day", "restaurant_each_day", "attraction_each_day");

		for(String tableName : tableNames) {
			Map<String, Object> params = new HashMap<>();
			params.put("tableName", tableName);
			params.put("packId", packId);
			packMapper.deleteEachTable(params);
		}
	}
	
	
}
