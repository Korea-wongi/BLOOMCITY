package travel.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import travel.project.domain.HotelAmenities;
import travel.project.domain.HotelData;
import travel.project.domain.Hotels;

@Mapper
public interface HotelMapper {

	//호텔 리스트 받아오는 메소드
	List<HotelData> hotelsInquiry();


	//호텔 편의 시설 정보 받아오는 메소드
	List<HotelAmenities> hotelsCorrection(long hotelId);

	void saveHotelCorrection(Hotels hotels);

	void saveHotelAmenitiesCorrection(List<String> amenities, long hotelId);

	void saveHotelImgCorrection(@Param("imgNames") List<String> imgNames, long hotelId);

	void deletAmenities(long hotelId);

	void hotelImgDelete(long hotelId);








}
