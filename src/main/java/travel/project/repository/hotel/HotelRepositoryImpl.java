package travel.project.repository.hotel;

import java.util.List;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import travel.project.domain.HotelAmenities;
import travel.project.domain.HotelData;
import travel.project.domain.Hotels;
import travel.project.mapper.HotelMapper;

@RequiredArgsConstructor
@Repository
public class HotelRepositoryImpl implements HotelRepository{

	private final HotelMapper hotelMapper;

	//호텔 리스트 받아오는 메소드
	@Override
		public List<HotelData> hotelsInquiry() {

			 return hotelMapper.hotelsInquiry();
		}


	//호텔 편의 시설 정보 받아오는 메소드
	@Override
	public List<HotelAmenities> hotelsCorrection(long hotelId) {

		return hotelMapper.hotelsCorrection(hotelId);

	}

	@Override
	public void saveHotelCorrection(Hotels hotels) {

		hotelMapper.saveHotelCorrection(hotels);

	}


	@Override
	public void saveHotelAmenitiesCorrection(List<String> amenities, long hotelId) {

		hotelMapper.deletAmenities(hotelId);
		hotelMapper.saveHotelAmenitiesCorrection(amenities, hotelId);
	}


	@Override
	public void saveHotelImgCorrection(List<String> imgNames, long hotelId) {

		  hotelMapper.hotelImgDelete(hotelId);

	    	hotelMapper.saveHotelImgCorrection(imgNames, hotelId);
	}
}
