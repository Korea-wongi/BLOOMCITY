package travel.project.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

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
import travel.project.mapper.PackMapper;
import travel.project.repository.pack.PackRepository;

@Service
@Slf4j
@RequiredArgsConstructor
@Transactional
public class PackServiceImpl implements PackService{

	private final PackRepository packRepository;
    private static String UPLOADED_FOLDER = "C://temp//";
    private int count = 0;


	// 호텔 등록 후 반환
	@Override
	public Hotels saveHotel(Hotels hotels) {
		return packRepository.saveHotel(hotels);
	}

	// 호텔 이미지 등록
	@Override
	public void saveHotelImg(List<String> imgNames, long id) {
		packRepository.saveHotelImg(imgNames, id);
	}


	// 호텔 편의시설 등록
	@Override
	public void saveHotelAmenities(List<String> amenities, long id) {
		packRepository.saveHotelAmenities(amenities, id);
	}

	@Override
	public List<Pack> getPackageListByDestination(String destination) {
		return packRepository.findPackList(destination);
	}
	
	// 이미지 업로드
	@Override
	public List<String> uploadImage(MultipartFile[] files, long id, String category) {
		List<String> imgNames = new ArrayList<>();
		count = (int)id;
		String FolderPath = UPLOADED_FOLDER + category + "//" + count + "//";
		
		// 호텔별 폴더가 없을 경우 생성
	    Path Directory = Paths.get(FolderPath);
	    if (!Files.exists(Directory)) {
	        try {
	            Files.createDirectories(Directory);
	        } catch (IOException e) {
	            log.error("Failed to create directory for hotel: " + FolderPath, e);
	        }
	     }
	    for (MultipartFile file : files) {
	          if (file.isEmpty()) {
	              continue;
	          }

	          try {
	        	  imgNames.add(file.getOriginalFilename());
	              byte[] bytes = file.getBytes();
	              Path path = Paths.get(FolderPath + file.getOriginalFilename());
	              Files.write(path, bytes);

	          } catch (IOException e) {
	              e.printStackTrace();
	          }
	       }

	    return imgNames;
	}

	// Destination 등록
	@Override
	public long saveDestination(Destination destination) {
		return packRepository.saveDestination(destination);
	}

	// Destination 리스트 반환
	@Override
	public List<Destination> findAllDestination() {
		return packRepository.findAllDestination();
	}

	// Restaurants 등록
	@Override
	public void saveRestaurant(Restaurants restaurants, long destination_Id) {
		packRepository.saveRestaurant(restaurants, destination_Id);
	}

	
	// 식당, 명소, 관광지 이미지 등록
	@Override
	public void saveImg(List<String> imgNames, String type, long id) {
		packRepository.saveImg(imgNames, type, id);
	}
	
	// Attraction 등록
	@Override
	public void saveAttraction(Attraction attraction, long id) {
		packRepository.saveAttraction(attraction, id);
	}
	
	// sql Date 타입 변경
	@Override
	public LocalDate replaceSqlDate(String date) {
		date = date.substring(0, date.length() -1);
		date = date.replace(".", "-");
		
		LocalDate localDate = LocalDate.parse(date);
		return localDate;
	}
	
	// 두 날짜 차이 계산
	@Override
	public long dayDifference(Date startDate, Date endDate) {
		return ChronoUnit.DAYS.between(startDate.toLocalDate(), endDate.toLocalDate());
	}
	
	// Pack 등록
	@Override
	public long savePack(Pack pack) {
		return packRepository.savePack(pack);
	}
	
	// 호텔 모든 열 지역으로 검색
	@Override
	public List<HotelView> findByDestinationHotels(String destinationName) {
		return packRepository.findByDestinationHotels(destinationName);
	}
	
	// 레스토랑 모든 열 지역으로 검색
	@Override
	public List<RestaurantView> findByDestinationRestaurant(String destinationName) {
		return packRepository.findByDestinationRestaurant(destinationName);
	}
	@Override
	public Pack findPackById(long packId) {
		return packRepository.findPackById(packId);
	}
	
	// 관광지 모든 열 지역으로 검색
	@Override
	public List<AttractionView> findByDestinationAttraction(String destinationName, String type) {
		return packRepository.findByDestinationAttraction(destinationName, type);
	}
  
		@Override
	public List<HotelView> findHotelsByDestinationName(String destinationName) {
		return packRepository.findHotelsByDestinationName(destinationName);
	}
  
	// Schedule 등록
	@Override
	public void saveSchedule(long packId, long days, Map<String, String> params) {
		// 필터링된 파라미터 사용
	    Map<String, List<Integer>> filteredParams = params.entrySet().stream()
	        .filter(entry -> entry.getKey().matches("hotel\\[\\d+\\]|restaurant\\[\\d+\\]|tourist\\[\\d+\\]|activity\\[\\d+\\]"))
	        .collect(Collectors.toMap(
	            Map.Entry::getKey,
	            entry -> Arrays.stream(entry.getValue().split("\\s+"))
	                           .filter(s -> !s.isEmpty())
	                           .map(Integer::parseInt)
	                           .collect(Collectors.toList())
	     ));
	    
	    // dayCounts 맵을 받은 'days' 매개변수에 기반하여 동적으로 초기화
	    Map<Integer, Integer> dayCounts = IntStream.rangeClosed(1, (int)days)
	        .boxed()
	        .collect(Collectors.toMap(day -> day, day -> 0));

	    for (Map.Entry<String, List<Integer>> entry : filteredParams.entrySet()) {
	        String eventType = entry.getKey().split("\\[")[0];
	        int dayIndex = Integer.parseInt(entry.getKey().split("\\[")[1].replaceAll("\\D", ""));
	        List<Integer> eventIds = entry.getValue();

	        // 각 이벤트 ID에 대해 처리
	        for (Integer eventId : eventIds) {
	            dayCounts.put(dayIndex, dayCounts.get(dayIndex) + 1);
	            Schedule schedule = new Schedule();
	            schedule.setPackId(packId);
	            schedule.setDayNumber(dayIndex);
	            schedule.setScheduleType(eventType);
	            schedule.setEventId(eventId);
	            
	            packRepository.saveSchedule(schedule);
	        }
	    }
	}
	
	// hotel_each_day 등록
	@Override
	public void saveEachHotel(long packId, long days, Map<String, String> params) {
		// 필터링된 파라미터 사용
	    Map<String, List<Integer>> filteredParams = params.entrySet().stream()
	        .filter(entry -> entry.getKey().matches("hotel\\[\\d+\\]"))
	        .collect(Collectors.toMap(
	            Map.Entry::getKey,
	            entry -> Arrays.stream(entry.getValue().split("\\s+"))
	                           .filter(s -> !s.isEmpty())
	                           .map(Integer::parseInt)
	                           .collect(Collectors.toList())
	     ));
	    
	    // dayCounts 맵을 받은 'days' 매개변수에 기반하여 동적으로 초기화
	    Map<Integer, Integer> dayCounts = IntStream.rangeClosed(1, (int)days)
	        .boxed()
	        .collect(Collectors.toMap(day -> day, day -> 0));

	    for (Map.Entry<String, List<Integer>> entry : filteredParams.entrySet()) {
	        String eventType = entry.getKey().split("\\[")[0];
	        int dayIndex = Integer.parseInt(entry.getKey().split("\\[")[1].replaceAll("\\D", ""));
	        List<Integer> eventIds = entry.getValue();

	        // 각 이벤트 ID에 대해 처리
	        for (Integer eventId : eventIds) {
	            dayCounts.put(dayIndex, dayCounts.get(dayIndex) + 1);
	            Hotel_each_day hotel_each_day = new Hotel_each_day();
	            hotel_each_day.setPackId(packId);
	            hotel_each_day.setDayNumber(dayIndex);
	            hotel_each_day.setHotelId(eventId);
	            
	            packRepository.saveEachHotel(hotel_each_day);
	        }
	    }
	}
	
	// Attraction_each_day 등록
	@Override
	public void saveEachAttraction(long packId, long days, Map<String, String> params) {
		// 필터링된 파라미터 사용
	    Map<String, List<Integer>> filteredParams = params.entrySet().stream()
	        .filter(entry -> entry.getKey().matches("tourist\\[\\d+\\]|activity\\[\\d+\\]"))
	        .collect(Collectors.toMap(
	            Map.Entry::getKey,
	            entry -> Arrays.stream(entry.getValue().split("\\s+"))
	                           .filter(s -> !s.isEmpty())
	                           .map(Integer::parseInt)
	                           .collect(Collectors.toList())
	     ));
	    
	    // dayCounts 맵을 받은 'days' 매개변수에 기반하여 동적으로 초기화
	    Map<Integer, Integer> dayCounts = IntStream.rangeClosed(1, (int)days)
	        .boxed()
	        .collect(Collectors.toMap(day -> day, day -> 0));

	    for (Map.Entry<String, List<Integer>> entry : filteredParams.entrySet()) {
	        String eventType = entry.getKey().split("\\[")[0];
	        int dayIndex = Integer.parseInt(entry.getKey().split("\\[")[1].replaceAll("\\D", ""));
	        List<Integer> eventIds = entry.getValue();

	        // 각 이벤트 ID에 대해 처리
	        for (Integer eventId : eventIds) {
	            dayCounts.put(dayIndex, dayCounts.get(dayIndex) + 1);
	            Attraction_each_day attraction_each_day = new Attraction_each_day();
	            attraction_each_day.setAttractionId(eventId);
	            attraction_each_day.setDayNumber(dayIndex);
	            attraction_each_day.setPackId(packId);
	            
	            packRepository.saveEachAttraction(attraction_each_day);
	        }
	    }
	}
	
	// Restaurant_each_day
	@Override
	public void saveEachRestaurant(long packId, long days, Map<String, String> params) {
		// 필터링된 파라미터 사용
	    Map<String, List<Integer>> filteredParams = params.entrySet().stream()
	        .filter(entry -> entry.getKey().matches("restaurant\\[\\d+\\]"))
	        .collect(Collectors.toMap(
	            Map.Entry::getKey,
	            entry -> Arrays.stream(entry.getValue().split("\\s+"))
	                           .filter(s -> !s.isEmpty())
	                           .map(Integer::parseInt)
	                           .collect(Collectors.toList())
	     ));
	    
	    // dayCounts 맵을 받은 'days' 매개변수에 기반하여 동적으로 초기화
	    Map<Integer, Integer> dayCounts = IntStream.rangeClosed(1, (int)days)
	        .boxed()
	        .collect(Collectors.toMap(day -> day, day -> 0));

	    for (Map.Entry<String, List<Integer>> entry : filteredParams.entrySet()) {
	        String eventType = entry.getKey().split("\\[")[0];
	        int dayIndex = Integer.parseInt(entry.getKey().split("\\[")[1].replaceAll("\\D", ""));
	        List<Integer> eventIds = entry.getValue();

	        // 각 이벤트 ID에 대해 처리
	        for (Integer eventId : eventIds) {
	            dayCounts.put(dayIndex, dayCounts.get(dayIndex) + 1);
	            
	            Restaurant_each_day restaurant_each_day = new Restaurant_each_day();
	            restaurant_each_day.setRestaurantId(eventId);
	            restaurant_each_day.setDayNumber(dayIndex);
	            restaurant_each_day.setPackId(packId);
	            
	            packRepository.saveEachRestaurant(restaurant_each_day);
	        }
	    }
	}
  	//패키지 조회
	@Override
	public List<Pack> reservationInquiry(String startDate,String endDate) {
		return packRepository.reservationInquiry(startDate,endDate);
	}
	
	// 패키지 삭제 처리
	@Override
	public void packagesDelete(long packId) {
		packRepository.packagesDelete(packId);
	}
	
	// 패키지 수정
	@Override
	public Pack updatePack(Pack pack) {
		return packRepository.updatePack(pack);
	}
	
	// 스케줄 삭제
	@Override
	public void deleteSchedule(long packId) {
		packRepository.deleteSchedule(packId);
	}
	
}
