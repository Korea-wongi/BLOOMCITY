package travel.project.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.HotelAmenities;
import travel.project.domain.HotelData;
import travel.project.domain.Hotels;
import travel.project.service.hotel.HotelService;

@Slf4j
@Controller
@RequestMapping("/hotels")
@RequiredArgsConstructor
public class HotelController {

	private final HotelService hotelService;

	String main = "main/main";


		//호텔 정보 수정 버튼 누르면 호텔들의 정보 조회
		@GetMapping("/correctionList")
		public String hotelsInquiry(Model model) {
			List<HotelData> HotelList = hotelService.hotelsInquiry();

			model.addAttribute("list", HotelList);
			model.addAttribute("center", "../hotel/hotelList.jsp");

			return main;
		}
		//호텔 수정에서 하나의 호텔을 누르면 정보 받아서 보여줌
		@GetMapping("/correction")
		public String hotelsCorrection(@ModelAttribute("HotelData") HotelData hotelData,Model model) {
			List<HotelAmenities> list = hotelService.hotelsCorrection(hotelData.getHotelId());

			model.addAttribute("center", "../hotel/hotelCorrection.jsp");
			model.addAttribute("hotelData",hotelData);
			model.addAttribute("list",list);
			return main;
		}

		// 호텔, 호텔 편의시설, 호텔 이미지 수정 등록
		@PostMapping("/{hotelId}")
		public String upload(@ModelAttribute Hotels hotels, @PathVariable("hotelId")long hotelId,
							 @RequestParam(value = "amenities", required = true)  List<String> amenities,
							 @RequestParam(value = "hotelImage", required = true)  MultipartFile[] files
							) {

			// 호텔 수정 등록
			hotelService.saveHotelCorrection(hotels);

			// 호텔 편의시설 수정 등록
			hotelService.saveHotelAmenitiesCorrection(amenities, hotels.getHotelId());

			// 호텔 이미지 수정 업로드
			List<String> imgNames = hotelService.uploadImageCorrection(files, hotels.getHotelId(), "hotel");
			// 호텔 이미지 수정 등록
			hotelService.saveHotelImgCorrection(imgNames, hotels.getHotelId());


			return "redirect:/hotels/correctionList";


		}


}
