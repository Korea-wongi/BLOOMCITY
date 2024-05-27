package travel.project.repository.reservation;

import org.springframework.stereotype.Repository;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import travel.project.domain.Reservation;
import travel.project.mapper.ReservationMapper;

@Slf4j
@RequiredArgsConstructor
@Repository
public class ReservationRepositoryImpl implements ReservationRepository {

	private final ReservationMapper reservationMapper;
	
	@Override
	public void saveRsv(Reservation reservation) {
		reservationMapper.saveRsv(reservation);
		log.info("saveRsv : {}", reservation);
	}

}
