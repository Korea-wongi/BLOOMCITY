package travel.project.service.hotel;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import travel.project.domain.HotelAmenities;
import travel.project.domain.HotelData;
import travel.project.domain.Hotels;

public interface HotelService {

	////호텔 리스트 받아오는 메소드
	List<HotelData> hotelsInquiry();

	//호텔 편의 시설 정보 받아오는 메소드
	List<HotelAmenities> hotelsCorrection(long hotelId);

	void saveHotelCorrection(Hotels hotels);

	void saveHotelAmenitiesCorrection(List<String> amenities, long hotelId);

	List<String> uploadImageCorrection(MultipartFile[] files, long hotelId, String string);

	void saveHotelImgCorrection(List<String> imgNames, long hotelId);

}
