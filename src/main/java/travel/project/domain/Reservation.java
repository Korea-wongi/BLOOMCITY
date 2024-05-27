package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.sql.Date;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Reservation {
    private long reservationId;
    private String customerId;
    private long packId;
    private long hotelId;
    private Date reservationDate;
    private int numberOfPeople;

}
