package travel.project.service.hotel;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.HotelAmenities;
import travel.project.domain.HotelData;
import travel.project.domain.Hotels;
import travel.project.repository.hotel.HotelRepository;

@Slf4j
@RequiredArgsConstructor
@Service
public class HotelServiceImpl implements HotelService{

	private final HotelRepository hotelRepository;
	private static String UPLOADED_FOLDER = "C://temp//";
	private int count = 0;

	//호텔 리스트 받아오는 메소드
	@Override
	public List<HotelData> hotelsInquiry() {
		return hotelRepository.hotelsInquiry();

	}

	//호텔 편의 시설 정보 받아오는 메소드
	@Override
	public List<HotelAmenities> hotelsCorrection(long hotelId) {
		return hotelRepository.hotelsCorrection(hotelId);
	}

	@Override
	public void saveHotelCorrection(Hotels hotels) {
		 hotelRepository.saveHotelCorrection(hotels);
	}

	@Override
	public void saveHotelAmenitiesCorrection(List<String> amenities, long hotelId) {
		hotelRepository.saveHotelAmenitiesCorrection(amenities, hotelId);
	}


	@Override
	public void saveHotelImgCorrection(List<String> imgNames, long hotelId) {
		hotelRepository.saveHotelImgCorrection(imgNames, hotelId);

	}
	@Override
	public List<String> uploadImageCorrection(MultipartFile[] files, long hotelId, String category) {
		List<String> imgNames = new ArrayList<>();
		count = (int)hotelId;
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

}
