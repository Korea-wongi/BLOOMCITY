package travel.project.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class HotelAmenities {
    private long amenityId;
    private long hotelId;
    private String amenity;

}
