package travel.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import travel.project.domain.Reservation;

@Mapper
public interface ReservationMapper {
	
	void saveRsv(Reservation reservation);
}
