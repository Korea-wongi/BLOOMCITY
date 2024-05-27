package travel.project.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Reservation;
import travel.project.service.reservation.ReservationService;

@RequiredArgsConstructor
@Slf4j
@RequestMapping
@Controller
public class ReservationController {
	
	private final ReservationService reservationService;
	
	
	// 예약정보 저장
	@GetMapping("/Pay/payConfirm")
	public String saveRsv(@RequestParam("packId") String packId, 
						@RequestParam("customerId") String customerId, 
						@RequestParam("numberOfPeople") String numberOfPeople,
						@RequestParam("reservationDate") String reservationDate) {
		
		log.info("packId : {}" , packId);
		log.info("customerId : {}" , customerId);
		log.info("numberOfPeople : {}" , numberOfPeople);
		log.info("reservationDate : {}" , reservationDate);
		
		Reservation reservation = new Reservation();
		// reservation에 파라미터 세팅
		reservation.setPackId(Long.parseLong(packId));
		reservation.setCustomerId(customerId);
		reservation.setNumberOfPeople(Integer.parseInt(numberOfPeople));
        reservation.setReservationDate(Date.valueOf(reservationDate));
		
		
		reservationService.saveRsv(reservation);
		
		return "main/main";
	}
}
