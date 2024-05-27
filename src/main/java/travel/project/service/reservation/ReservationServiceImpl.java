package travel.project.service.reservation;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Reservation;
import travel.project.repository.reservation.ReservationRepository;

@Slf4j
@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {

	private final ReservationRepository reservationRepository;
	
	@Override
	public void saveRsv(Reservation reservation) {
		reservationRepository.saveRsv(reservation);
	}

}
