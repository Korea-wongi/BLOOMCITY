package travel.project.repository.reservation;

import travel.project.domain.Reservation;

public interface ReservationRepository {
	
	//예약정보 저장
	void saveRsv(Reservation reservation);
}
